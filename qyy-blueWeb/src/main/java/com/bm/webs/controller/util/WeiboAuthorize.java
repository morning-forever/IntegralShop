package com.bm.webs.controller.util;

import java.util.UUID;

import com.bm.common.util.config.ConfigLoad;
import com.bm.common.weibo4j.http.AccessToken;
import com.bm.common.weibo4j.http.HttpClient;
import com.bm.common.weibo4j.model.PostParameter;
import com.bm.common.weibo4j.model.User;
import com.bm.common.weibo4j.model.WeiboException;
import com.bm.common.weibo4j.org.json.JSONException;

/**
 * 微博登录帮助生成授权
 * 
 * @author mike <br>
 *         2015年10月27日
 */
public class WeiboAuthorize {

	protected static HttpClient client = new HttpClient();

	public static String authorizeURL = "https://api.weibo.com/oauth2/authorize";

	public static String accessTokenURL = "https://api.weibo.com/oauth2/access_token";

	public static String usersShowUrl = "https://api.weibo.com/2/users/show.json";

	public static String uidUrl = "https://api.weibo.com/2/account/get_uid.json";

	// WeiboConfig.getValue("authorizeURL").trim() + "?client_id="
	// + WeiboConfig.getValue("client_ID").trim() + "&redirect_uri="
	// + WeiboConfig.getValue("redirect_URI").trim() + "&response_type=" + response_type
	// + "&state=" + state + "&scope=" + scope;

	/**
	 * 获取验证获取code值的url
	 * 
	 * @return
	 */
	public static String getAuthorizeUrl() {
		StringBuffer sb = new StringBuffer(authorizeURL);
		sb.append("?state=" + UUID.randomUUID().toString().replace("-", ""));// 设置状态值
		sb.append("&response_type=code");// 设置返回类型为code
		sb.append("&client_id=" + ConfigLoad.getStringValue("WB.app_key"));// 设置客户端id
		sb.append("&redirect_uri=" + ConfigLoad.getStringValue("WB.redirect_uri"));
		sb.append("&scope=" + ConfigLoad.getStringValue("WB.scope"));
		return sb.toString();
	}

	/**
	 * 获取授权信息
	 * 
	 * @param code
	 * @return
	 * @throws WeiboException
	 */
	public static AccessToken getAccessTokenByCode(String code) throws WeiboException {
		PostParameter[] params = new PostParameter[] { 
				new PostParameter("client_id", ConfigLoad.getStringValue("WB.app_key")),
				new PostParameter("client_secret", ConfigLoad.getStringValue("WB.app_sercet")), 
				new PostParameter("grant_type", "authorization_code"), new PostParameter("code", code),
				new PostParameter("redirect_uri", ConfigLoad.getStringValue("WB.redirect_uri")) };
		return  new AccessToken(client.post(accessTokenURL, params, false, null));
	}
	
	/**
	 * 返回uid
	 * 
	 * @param code
	 * @return
	 * @throws WeiboException
	 * @throws JSONException 
	 */
	public String getUid(String code) throws WeiboException, JSONException {
		AccessToken accessToken = getAccessTokenByCode(code);
		return client.get(uidUrl,accessToken.getAccessToken()).asJSONObject().getString("uid");
	}
	
	/**
	 * 获取用户信息
	 * 
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public static User getUserinfo(String code) throws Exception {
		AccessToken accessToken = getAccessTokenByCode(code);
		return new User(client.get(usersShowUrl,
			new PostParameter[] { new PostParameter("uid", accessToken.getUid()) },
			accessToken.getAccessToken()).asJSONObject()).setAccessToken(accessToken.getAccessToken());
	}
	
}
