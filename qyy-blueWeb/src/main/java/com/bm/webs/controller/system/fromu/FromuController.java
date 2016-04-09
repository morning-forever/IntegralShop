package com.bm.webs.controller.system.fromu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.web.forum.WebComplaintService;
import com.bm.webs.service.web.forum.WebQuestionService;
import com.bm.webs.service.web.forum.WebTravelsService;

/**
 * 论坛文章管理Controller
 * @author Hham
 *
 */
@Controller
@RequestMapping(value = "admin/fromuOperation")
public class FromuController extends BaseController {

	@Autowired
	private WebTravelsService webTravelsService;

	@Autowired
	private WebQuestionService webQuestionService;

	@Autowired
	private WebComplaintService webComplaintService;
	
	private static final String WEB_TRAVELS="web_travels";

	/**
	 * 跳转到订单页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("system/fromu/fromu_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	/**
	 * 查看文章
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value="check_{id}_{type}",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public ModelAndView check(@PathVariable(value="id")  Long id
			,@PathVariable(value="type") Long type){
		ModelAndView mav=new ModelAndView();
		PageData pd=new PageData();
		try {
			if (type < 4) {
				pd.put("travelsId", id);
				pd.put("form_table", WEB_TRAVELS);
				Map<String, Object> map=webTravelsService.findTravelsDetial(pd);
				List<Map<String, Object>> itemList=webTravelsService.findTravelsDetialList(pd);
				List<Map<String, Object>> examineList=webTravelsService.findExamineList(pd);
				mav.addObject("map",map);
				mav.addObject("itemList",itemList);
				mav.addObject("examineList",examineList);
				mav.setViewName("system/fromu/check_travel");
			} else if (type == 4) {
				pd.put("questionId", id);
				Map<String, Object> map=webQuestionService.findQuestionDetial(pd);
				mav.addObject("map",map);
				mav.setViewName("system/fromu/check_qc");
			} else if (type == 5) {
				pd.put("complaintId", id);
				Map<String, Object> map=webComplaintService.findComplaintDetial(pd);
				mav.addObject("map", map);
				mav.setViewName("system/fromu/check_qc");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 跳转到回复列表
	 * @param type
	 * @return
	 */
	@RequestMapping(value="replyIndex",produces=XConst.JSON_PRODUCES)
	public ModelAndView replyIndex(Long type){
		ModelAndView mav=new ModelAndView();
		try {
			PageData pd=getApiPageData();
			mav.addObject("map", pd);
			mav.addObject("type", type);
			mav.setViewName("system/fromu/reply_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 获取文章列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list() {
		PageData pd = null;
		try {
			pd = getSysPageData();
			Long type = pd.getLong("type");
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("title", json.get("title"));
				pd.put("nickName", json.get("nickName"));
			}
			List<Map<String, Object>> list = null;
			if (type < 4) {
				pd.put("travelType", type);
				list = webTravelsService.findStrategyList(pd);
			} else if (type == 4) {
				list = webQuestionService.findList(pd);
			} else if (type == 5) {
				list = webComplaintService.findList(pd);
			}
			pd.put("data", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 删除论坛文章
	 * 
	 * @return
	 */
	@RequestMapping(value = "deletes", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletes() {
		PageData pd = null;
		try {
			pd = getApiPageData();
			String ids = pd.getString("ids");
			Long type = pd.getLong("type");
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			if (type < 4) {
				pd.put("travelsId", ids);
				webTravelsService.deleteTravels(pd);
			} else if (type == 4) {
				pd.put("questionId", ids);
				webQuestionService.deleteQuestion(pd);
			} else if (type == 5) {
				pd.put("complaintId", ids);
				webComplaintService.deleteComplaint(pd);
			}
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 审核文章
	 * 
	 * @return
	 */
	@RequestMapping(value = "examine", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData examine() {
		PageData pd = getApiPageData();
		try {
			webTravelsService.updateTravelsExamine(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 改变置顶状态
	 * 
	 * @return
	 */
	@RequestMapping(value = "changeTop", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData changeTop() {
		PageData pd = getApiPageData();
		try {
			webTravelsService.updateTop(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 获取回复列表
	 * @param type
	 * @return
	 */
	@RequestMapping(value="replyList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData replyList(Long type){
		PageData pd=getSysPageData();
		try {
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("title", json.get("title"));
				pd.put("nickName", json.get("nickName"));
			}
			List<Map<String, Object>> list=null;
			if(type<4){
				pd.put("travelsId", pd.get("id"));
				list=webTravelsService.findTravelsReplyList(pd);
			}else if(4==type){
				pd.put("questionId", pd.get("id"));
				list=webQuestionService.findReplyList(pd);
			}else if(5==type){
				pd.put("complaintId", pd.get("id"));
				list=webComplaintService.findReplyList(pd);
			}
			pd.put("data", list);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 删除论坛文章
	 * 
	 * @return
	 */
	@RequestMapping(value = "deleteReply", produces = XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteReply() {
		PageData pd = null;
		try {
			pd = getApiPageData();
			String ids = pd.getString("ids");
			Long type = pd.getLong("type");
			Integer lastIndex = ids.lastIndexOf(",");
			if (lastIndex != -1) {
				ids = ids.substring(0, lastIndex);
			}
			if (type < 4) {
				pd.put("ids", ids);
				webTravelsService.deleteTravelsReply(pd);
			} else if (type == 4) {
				pd.put("questionId", ids);
				webQuestionService.deleteQuestion(pd);
			} else if (type == 5) {
				pd.put("complaintId", ids);
				webComplaintService.deleteComplaint(pd);
			}
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
