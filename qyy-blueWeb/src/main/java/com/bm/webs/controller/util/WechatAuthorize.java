package com.bm.webs.controller.util;

import java.util.UUID;

import com.bm.common.util.HString;
import com.bm.common.util.config.ConfigLoad;
import com.bm.common.weibo4j.http.HttpClient;
import com.bm.common.weibo4j.http.Response;
import com.bm.common.weibo4j.model.PostParameter;
import com.bm.common.weibo4j.org.json.JSONObject;

/**
 * 微信登录帮助生成授权
 * 
 * @author mike <br>
 *         2015年10月27日
 */
public class WechatAuthorize {
	
	protected static HttpClient client = new HttpClient();
	
	public static String authorizeURL = "https://open.weixin.qq.com/connect/qrconnect";
	
	public static String accessTokenURL = "https://api.weixin.qq.com/sns/oauth2/access_token";
	
	public static String userinfoURL = "https://api.weixin.qq.com/sns/userinfo";
	
	
//	https://open.weixin.qq.com/connect/qrconnect
//	?appid=wxbdc5610cc59c1631
//	&redirect_uri=https%3A%2F%2Fpassport.yhd.com%2Fwechat%2Fcallback.do
//	&response_type=code
//	&scope=snsapi_login
//	&state=3d6be0a4035d839573b04816624a415e
//	#wechat_redirect
	
	public static String getAuthorizeUrl(){
		StringBuffer sb = new StringBuffer(authorizeURL);
		sb.append("?state="+UUID.randomUUID().toString().replace("-", ""));	//设置状态值
		sb.append("&response_type=code");									//设置返回类型为code
		sb.append("&appid="+ConfigLoad.getStringValue("WC.app_id"));	//设置客户端id
		sb.append("&redirect_uri="+ConfigLoad.getStringValue("WC.redirect_uri"));
		sb.append("&scope="+ConfigLoad.getStringValue("WC.scope"));
		return sb.toString(); 
	}
	
	
	/**
	 * 获取授权信息
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getAccessToken(String code) throws Exception{
		PostParameter[] params = new PostParameter[] { 
				new PostParameter("appid", ConfigLoad.getStringValue("WC.app_id")),
				new PostParameter("secret", ConfigLoad.getStringValue("WC.app_sercet")), 
				new PostParameter("grant_type", "authorization_code"), 
				new PostParameter("code", code)
				};
		Response res = client.post(accessTokenURL, params, false, null);
		String resStr = res.toString();
		if(-1 == resStr.indexOf("errcode"))
			return new JSONObject(resStr);
		else
			throw new Exception("qzone AccessToken Exception :"+resStr);
	}
	
	/**
	 * 获取用户信息
	 * 
	 * @param code
	 * @param access_token
	 * @param openid
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getUserinfo(String code,String access_token,String openid) throws Exception{
		
		if(HString.isEmpty(access_token)){
			JSONObject accessToken = getAccessToken(code);
			access_token = accessToken.getString("access_token");
			openid = accessToken.getString("openid");
		}
		
		PostParameter[] params = new PostParameter[] {
			new PostParameter("access_token", access_token),
			new PostParameter("openid", openid)
		};
		
		Response res = client.get(userinfoURL,params,access_token);
		String resStr = res.toString();
		resStr = new String(resStr.getBytes("ISO-8859-1"), "UTF-8");
		if(-1 == resStr.indexOf("errcode"))
			return new JSONObject(resStr).put("access_token", access_token);
		else
			throw new Exception("qzone AccessToken Exception :"+resStr);
		
	}
	
}
