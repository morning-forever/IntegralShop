package com.bm.webs.controller.app.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.depth.WebUserCollectionService;

/**
 * 收藏模块 APP接口
 * 
 * @author jiangl
 * 
 *         2015年10月14日
 */
@Controller
@RequestMapping(value = "app/collection")
public class AppUserCollectionController extends BaseController {

	@Autowired
	private WebUserCollectionService webUserCollectionService;// 收藏

	/**
	 * 添加 或取消 一个收藏
	 * 
	 * @return
	 */
	@RequestMapping(value = "oper")
	@ResponseBody
	public PageData oper() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("oper", param, new String[] {
					"fromId", "userId", "fromTable","oper" }, new String[] { "深度游id",
					"用户id", "收藏表名","操作：add或是cancel" });
			if (isSuccess) {
				if (!isTokenSuccess(param)) {
					// 检查token
					return param;
				}
				String oper = param.getString("oper");
				if("add".equals(oper)){
					Integer collectionId = webUserCollectionService.checkCollection(param);
					if(collectionId == null){
						webUserCollectionService.insert(param.getLong("fromId"),param.getLong("userId"),param.getString("fromTable"));
					}else{
						res.putMessage(XConst.EXISTS);
					}
				}else if("cancel".equals(oper)){
					webUserCollectionService.delete(param.getLong("fromId"),param.getLong("userId"),param.getString("fromTable"));
				}
				res.putFlag(true);
				res.putMessage(XConst.SUCCESS);
				
				// 更新token
				updateNewToken(param);
				String newToken = param.getString(XConst.API_TOKEN_KEY);
				res.putData(XConst.API_TOKEN_KEY, newToken);
			} else {
				res.putMessage(XConst.PARAM_ERR);
			}
		} catch (Exception e) {
			res.putFlag(false);
			res.putMessage(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
