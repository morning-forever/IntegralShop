package com.bm.webs.controller.util;

import java.util.UUID;

import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.weibo4j.http.HttpClient;
import com.bm.common.weibo4j.http.Response;
import com.bm.common.weibo4j.model.PostParameter;
import com.bm.common.weibo4j.org.json.JSONObject;

/**
 * qq登录帮助生成授权
 * 
 * @author mike <br>
 *         2015年10月27日
 */
public class QzoneAuthorize {
//	https://graph.qq.com/oauth2.0/authorize
//	?client_id=101262570
//	&redirect_uri=http://www.qianyiyou.com/pc/login?op=thirdLogin
//	&response_type=code
//	&state=e23fe196b1b942fa4ccbc19fe7297c83
//	&scope=get_user_info	
	
	
	protected static HttpClient client = new HttpClient();
	
	public static String authorizeURL = "https://graph.qq.com/oauth2.0/authorize";
	
	public static String getUserInfoURL = "https://graph.qq.com/user/get_user_info";
	
	public static String accessTokenURL = "https://graph.qq.com/oauth2.0/token";
	
	public static String getOpenIdURL = "https://graph.qq.com/oauth2.0/me";
	
	
	public static String getAuthorizeUrl() throws Exception{
		StringBuffer sb = new StringBuffer(authorizeURL);
		sb.append("?state="+UUID.randomUUID().toString().replace("-", ""));//获取状态值
		sb.append("&response_type=code");//设置返回类型为code
		sb.append("&client_id="+ConfigLoad.getStringValue("QQ.client_id"));//设置客户端id
		sb.append("&redirect_uri="+ConfigLoad.getStringValue("QQ.redirect_uri"));
		sb.append("&scope="+ConfigLoad.getStringValue("QQ.scope"));
//		sb.append("&app_key="+ConfigLoad.getStringValue("QQ.app_key"));
		return sb.toString();
	}
	
	/**
	 * 获取授权
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getAccessToken(String code) throws Exception{
		PostParameter[] params = new PostParameter[] { 
				new PostParameter("client_id", ConfigLoad.getStringValue("QQ.client_id")),
				new PostParameter("client_secret", ConfigLoad.getStringValue("QQ.app_key")), 
				new PostParameter("grant_type", "authorization_code"), 
				new PostParameter("code", code),
				new PostParameter("redirect_uri", ConfigLoad.getStringValue("QQ.redirect_uri")) };
		Response res = client.post(accessTokenURL, params, false, null);
		String resStr = res.toString();
		if(0 != resStr.indexOf("callback")){
			resStr = "{"+resStr.replace("&", ",").replace("=", ":")+"}";
			return new JSONObject(resStr);
		}else{
			resStr = resStr.replace("callback( ", "").replace(" );", "").trim();
			throw new Exception("qzone AccessToken Exception :"+resStr);
		}
	}
	
	/**
	 * 获取openid
	 * 
	 * @param code
	 * @return
	 * @throws Exception 
	 */
	public static JSONObject getOpenId(String code,String access_token) throws Exception{
		if(HString.isEmpty(access_token)){
			JSONObject accessToken = getAccessToken(code);
			access_token = accessToken.getString("access_token");
		}
		PostParameter[] params = new PostParameter[] { 
				new PostParameter("access_token", access_token)
		};
		Response res = client.get(getOpenIdURL,params,access_token);
		String resStr = res.toString();
		resStr = resStr.replace("callback( ", "").replace(" );", "").trim();
		JSONObject json =new JSONObject(resStr);
		if(!HString.isEmpty(json.getString("openid"))){
			json.put("access_token", access_token);
			return json;
		}else{
			throw new Exception("qzone getOpenId Exception:"+resStr);
		}
	}
	
	/**
	 * 获取用户信息
	 * @param code
	 * @return
	 * @throws Exception 
	 */
	public static JSONObject getUserinfo(String code,String access_token) throws Exception{
		JSONObject openId = getOpenId(code,access_token);
		access_token = openId.getString("access_token");
		String openID = openId.getString("openid");
		PostParameter[] params = new PostParameter[] {
			new PostParameter("oauth_consumer_key", ConfigLoad.getStringValue("QQ.client_id")),
			new PostParameter("access_token", access_token),
			new PostParameter("openid", openID),
			new PostParameter("format", "json")
		};
		Response res = client.get(getUserInfoURL,params,access_token);
		String resStr = res.toString();
		if(0 != resStr.indexOf("callback")){
			return new JSONObject(resStr).put("access_token", access_token).put("openid", openID);
		}else{
			throw new Exception("qzone AccessToken Exception :"+resStr);
		}
	}
	
}
