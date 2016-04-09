package com.bm.webs.controller.web.forum;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.WebPraiseService;
import com.bm.webs.service.web.forum.WebComplaintService;

/**
 * Web端吐槽专区Controller
 * 
 * @author Hham
 *
 */
@Controller(value="WebComplaintController")
@RequestMapping(value="pc/complaint")
public class WebComplaintController extends BaseController{

	@Autowired
	private WebComplaintService webComplaintService;
	
	@Autowired
	private WebPraiseService webPraiseService;
	
	private static final String WEB_COMPLAINT="web_complaint";
	
	private static final String WEB_COMPLAINT_MENT="web_complaint_ment";
	
	/**
	 * 跳转到吐槽专区主页
	 * @return
	 */
	@RequestMapping(value="index")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		try {
			if(getWebLoginUserObj()==null){
				goLogin(mav);
			}else{
				mav.setViewName("web/interact/roast");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 删除吐槽
	 * @return
	 */
	@RequestMapping(value="delete",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData delete(){
		PageData pd=getApiPageData();
		try {
			webComplaintService.deleteComplaint(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 查询吐槽详情列表
	 * @return
	 */
	@RequestMapping(value="list",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(){
		PageData pd=getApiPageData();
		try {
			Long userId=getWebLoginUser();
			pd.put("userId", userId);
			List<Map<String, Object>> list=webComplaintService.findList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 跳转到吐槽详情页面
	 * @param complaintId
	 * @return
	 */
	@RequestMapping(value="detial_{complaintId}",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public ModelAndView detial(@PathVariable(value="complaintId") Long complaintId){
		ModelAndView mav=new ModelAndView();
		try {
			Long userId=getWebLoginUser();
			PageData pd=new PageData();
			if(userId==null){
				goLogin(mav);
			}else{
				pd.put("userId", userId);
				pd.put("complaintId", complaintId);
				Map<String, Object> map=webComplaintService.findComplaintDetial(pd);
				mav.addObject("complaint", map);
				mav.addObject("userId", userId);
				mav.setViewName("web/interact/complaint_detial");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	/**
	 * 查询回复List
	 * @return
	 */
	@RequestMapping(value="replyList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData replyList(){
		PageData pd=getApiPageData();
		try {
			List<Map<String, Object>> list=webComplaintService.findReplyList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 查询二级回复
	 * @return
	 */
	@RequestMapping(value="secondaryReply",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData secondaryReply(){
		PageData pd=getApiPageData();
		try {
			List<Map<String, Object>> list=webComplaintService.findAllSecondaryList(pd);
			pd.put("list", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 添加回复
	 * @return
	 */
	@RequestMapping(value="addReply",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData addReply(){
		PageData pd=getApiPageData();
		try {
			webComplaintService.addComplaintReply(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 点赞回复
	 * @return
	 */
	@RequestMapping(value="praiseReply",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praiseReply(){
		PageData pd=getApiPageData();
		try {
			Long userId=getWebLoginUser();
			pd.put("form_table", WEB_COMPLAINT_MENT);
			pd.put("userId", userId);
			Integer checkPraise=webPraiseService.checkPraise(pd);
			if(checkPraise==null){
				webPraiseService.insertComplaintPraise(pd);
				pd.putStatus(XConst.SUCCESS);
			}else{
				pd.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 点赞吐槽
	 * @return
	 */
	@RequestMapping(value="praise",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData praise(){
		PageData pd=getApiPageData();
		try {
			Long userId=getWebLoginUser();
			pd.put("form_table", WEB_COMPLAINT);
			pd.put("userId", userId);
			Integer checkPraise=webPraiseService.checkPraise(pd);
			if(checkPraise==null){
				webPraiseService.insertComplaintPraise(pd);;
				pd.putStatus(XConst.SUCCESS);
			}else{
				pd.putStatus(XConst.EXISTS);
			}
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 跳转到新增吐槽页面
	 * @return
	 */
	@RequestMapping(value="newComplaint")
	public ModelAndView newComplaint(){
		ModelAndView mav=new ModelAndView();
		try {
			if(getWebLoginUserObj()!=null){
				mav.setViewName("web/interact/new_question");
				mav.addObject("type","complaint");
			}else{
				goLogin(mav);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 保存吐槽
	 * @return
	 */
	@RequestMapping(value="submit",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitComplaint(){
		PageData pd=getApiPageData();
		try {
			Long userId=getWebLoginUser();
			pd.put("userId", userId);
			webComplaintService.addComplaint(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
