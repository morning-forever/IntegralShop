package com.bm.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;


public class UnitTest {

	public static void main(String[] args) {
		long a=1447862400l*1000;
		Date date=new Date();
		date.setTime(a);
		SimpleDateFormat sdf=new SimpleDateFormat();
		System.out.println(sdf.format(date));
	}
	
}
