package com.bm.webs.controller.app.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebPraiseService;

/**
 * 点赞模块 APP接口
 * 
 * @author jiangl
 * 
 *         2015年10月14日
 */
@Controller
@RequestMapping(value = "app/praise")
public class AppUserPraiseController extends BaseController {

	@Autowired
	private WebPraiseService webPraiseService;// 点赞

	/**
	 * 添加一个点赞
	 * 
	 * @return
	 */
	@RequestMapping(value = "add")
	@ResponseBody
	public PageData add() {
		PageData res = new PageData();
		try {
			PageData param = super.getApiPageData();
			// 检查参数
			boolean isSuccess = checkParam("add", param, new String[] {
					"fromId", "userId", "fromTable" }, new String[] { "深度游id",
					"用户id", "收藏表名" });
			if (isSuccess) {
				if (!isTokenSuccess(param)) {
					// 检查token
					return param;
				}
				webPraiseService.addPraise(param.getString("fromTable"),param.getLong("fromId"),param.getLong("userId"));
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
