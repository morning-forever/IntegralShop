package com.bm.common.util.http;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import com.bm.common.util.file.FileUpload;

/**
 * http请求帮助类
 * 
 * @author mike <br>
 *         2015年4月9日
 */
@SuppressWarnings("deprecation")
public class HttpClientHelper {

	/**
	 * 使用post请求
	 * 
	 * @param url
	 * @param params
	 * @return
	 */
	public static Object post(String url, Map<String, String> params) {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		Object body = null;
		HttpPost post = postForm(url, params);
		body = invoke(httpclient, post);
		httpclient.getConnectionManager().shutdown();
		return body;
	}

	/**
	 * 使用get请求
	 * 
	 * @param url
	 * @return
	 */
	public static Object get(String url) {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		Object body = null;
		HttpGet get = new HttpGet(url);
		body = invoke(httpclient, get);
		httpclient.getConnectionManager().shutdown();
		return body;
	}

	private static Object invoke(DefaultHttpClient httpclient,
			HttpUriRequest httpost) {
		HttpResponse response = sendRequest(httpclient, httpost);
		Object body = paseResponse(response);
		return body;
	}

	@SuppressWarnings("unused")
	private static Object paseResponse(HttpResponse response) {
		HttpEntity entity = response.getEntity();
		String charset = EntityUtils.getContentCharSet(entity);
		String body = null;
		try {
			body = EntityUtils.toString(entity);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return body;
	}

	private static HttpResponse sendRequest(DefaultHttpClient httpclient,
			HttpUriRequest httpost) {
		HttpResponse response = null;
		try {
			response = httpclient.execute(httpost);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return response;
	}

	private static HttpPost postForm(String url, Map<String, String> params) {
		HttpPost httpost = new HttpPost(url);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		Set<String> keySet = params.keySet();
		for (String key : keySet) {
			nvps.add(new BasicNameValuePair(key, params.get(key)));
		}
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return httpost;
	}

	/**
	 * 下载文件
	 * 
	 * @param url
	 *            请求的地址
	 * @param filePath
	 *            保存到本地文件的地址
	 * @param params
	 *            请求的参数
	 * @return boolean
	 * @throws IOException 
	 * @throws  
	 */
	@SuppressWarnings("resource")
	public static void download(String url, String realPath, String fileName,
			Map<String, String> params) throws Exception {
		InputStream is = null;
		HttpClient httpClient = new DefaultHttpClient();
		HttpGet httGet = new HttpGet(url);
		// 1.配置参数
		if(null != params){
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			Set<String> keySet = params.keySet();
			for (String key : keySet) {
				nvps.add(new BasicNameValuePair(key, params.get(key)));
			}
//			httGet.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
		}
		// 2.获取回流内容
		HttpResponse response = httpClient.execute(httGet);
		if(200 == response.getStatusLine().getStatusCode()){
			HttpEntity entity = response.getEntity();
			is = entity.getContent();
			// 3.写入文件
			FileUpload.copyFile(is, realPath, fileName);
		}else{
			throw new Exception("download head images err!"+response.getStatusLine().getStatusCode());
		}
	}
	
	/**
	 * 转为16进制方法
	 * 
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String paraTo16(String str)
			throws UnsupportedEncodingException {
		String hs = "";
		byte[] byStr = str.getBytes("UTF-8");
		for (int i = 0; i < byStr.length; i++) {
			String temp = "";
			temp = (Integer.toHexString(byStr[i] & 0xFF));
			if (temp.length() == 1)
				temp = "%0" + temp;
			else
				temp = "%" + temp;
			hs = hs + temp;
		}
		return hs.toUpperCase();
	}

}
