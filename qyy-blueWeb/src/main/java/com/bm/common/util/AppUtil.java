package com.bm.common.util;

import com.bm.webs.bean.PageData;

public class AppUtil  {
	
	protected static Logger logger = Logger.getLogger(AppUtil.class);
	
	public static void main(String[] args) {
		PageData pd = new PageData();
		pd.put("username", "zhangsan");
		
		checkParam("registered", pd,new String[]{"username","password"},new String[]{"用户名","密码"});
	}
	//检查参数是否完整
	public static boolean checkParam(String method,PageData data,String []params,String []values){
		boolean result = false;
		int falseCount = 0;
		String[] tempArray  = new String[20];  //临时数组
		int size = params.length;
		for(int i=0;i<size;i++){
			String param = params[i];
			if(!data.containsKey(param)){
				tempArray[falseCount] = values[i]+"--"+param;
				falseCount += 1;
			}
		}
		
		if(falseCount>0){
			logger.error(method+"接口，请求协议中缺少 "+falseCount+"个 参数");
			for(int j=1;j<=falseCount;j++){
				logger.error("   第"+(j+1)+"个："+ tempArray[j-1]);
			}
		} else {
			result = true;
		}
		return result;
	}
	
	/**
	 * 设置分页的参数
	 * @param pd
	 * @return
	 */
	public static PageData setPageParam(PageData data){
		String page_now_str = data.get("page_now").toString();
		int pageNowInt = Integer.parseInt(page_now_str)-1;
		String page_size_str = data.get("page_size").toString(); //每页显示记录数
		int pageSizeInt = Integer.parseInt(page_size_str);
		
		String page_now = pageNowInt+"";
		String page_start = (pageNowInt*pageSizeInt)+"";
		
		data.put("page_now", page_now);
		data.put("page_start", page_start);
		
		return data;
	}
}
