package com.bm.webs.controller.util;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;

import com.bm.common.util.config.ConfigLoad;

public class JPushHelper {
	
	private final static String appKey = ConfigLoad.getStringValue("JFush.appKey");
	private final static String masterSecret = ConfigLoad.getStringValue("JFush.masterSecret");
	
	/**
	 * 发送极光推送
	 * @param mobiTag
	 * @param msg
	 */
	public static void sendJfush(String alias, String alert, String title) {
		JPushClient jpushClient = new JPushClient(masterSecret, appKey, 3);

        // For push, all you need do is to build PushPayload object.
        PushPayload payload = buildPushObject_android_tag_alertWithTitle(alias,alert,title);

        try {
            PushResult result = jpushClient.sendPush(payload);
            System.out.println("Got result - " + result);

        } catch (APIConnectionException e) {
            // Connection error, should retry later
        	System.err.println("Connection error, should retry later");
        	e.printStackTrace();
        } catch (APIRequestException e) {
            // Should review the error, and fix the request
        	System.err.println("Should review the error, and fix the request");
        	e.printStackTrace();
        	System.out.println("HTTP Status: " + e.getStatus());
        	System.out.println("Error Code: " + e.getErrorCode());
        	System.out.println("Error Message: " + e.getErrorMessage());
        }
	}
	
	public static PushPayload buildPushObject_android_tag_alertWithTitle(String alias,String alert,String title) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.alias(alias))
                .setNotification(Notification.android(alert,title,null))
                .build();
    }
	
	public static void main(String[] args) {
//		sendJfush("38", "麻烦各位，给我叶良辰一个嘴巴子！","标题");
		try {
			String email ="123123@qq.com";
			String mailAddr = email.substring(email.lastIndexOf("@")+1, email.length());
			System.out.println(mailAddr);
			
			
//			String res = "callback( {\"client_id\":\"101262570\",\"openid\":\"37C8852AFE62AB1D5B8B09CF90FCA923\"} );";
//			
//			String resStr =res.replace("callback( ", "").replace(" );", "").trim();
			
//			String res = "access_token=CF91AB363542826F67DDC5559B33D215&expires_in=7776000&refresh_token=9F00DE724C4A58920B0AF666D0C5D0AF";
//			String resStr = "{"+res.toString().replace("&", ",").replace("=", ":")+"}";
//			
//			JSONObject json = new JSONObject(resStr);
//			System.out.println(json.getString("openid"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
