package com.bm.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderNoUtil {

	private static Random random=new Random();
	
	private static SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
	
	/**
	 * 
	 * 生成随机的订单号
	 * 按照[yyyyMMddHHmmss+3位随机数]的格式
	 * 
	 * @return
	 */
	public static String getOrderNo(){
		StringBuffer strBuffer=new StringBuffer();
		strBuffer.append(format.format(new Date()));
		strBuffer.append(random.nextInt(1000));
		return strBuffer.toString();
	}
	
}
