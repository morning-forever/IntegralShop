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
import com.bm.webs.service.web.WebCitysService;
import com.bm.webs.service.web.WebUserMasterService;

/**
 * 后台达人Controller
 * 
 * @author Hham
 *
 */
@Controller
@RequestMapping(value="admin/fromu/master")
public class AdminMasterController extends BaseController {

	
	@Autowired
	private WebUserMasterService webUserMasterService; 
	
	@Autowired
	private WebCitysService webCitysService;
	
	/**
	 * 跳转到达人列表主页
	 * @return
	 */
	@RequestMapping(value="index")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		try {
			List<Map<String, Object>>	list=	webCitysService.findAllCounty();
			mav.addObject("areaList", list);
			mav.setViewName("system/fromu/master_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 查询达人列表
	 * @return
	 */
	@RequestMapping(value="list",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData list(){
		PageData pd=getSysPageData();
		try {
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("realName", json.get("realName"));
				pd.put("phone", json.get("phone"));
				pd.put("email", json.get("email"));
				pd.put("areaId", json.get("areaId"));
				pd.put("isAudit", json.get("isAudit"));
			}
			List<Map<String, Object>> list=webUserMasterService.findMasterList(pd);
			pd.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 审核达人
	 * @return
	 */
	@RequestMapping(value="examineMaster",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData examineMaster(){
		PageData pd=getApiPageData();
		try {
			webUserMasterService.updateExamineMaster(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}

	/**
	 * 删除达人
	 * @return
	 */
	@RequestMapping(value="deletes",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deletes(){
		PageData pd=null;
		try {
			pd=getApiPageData();
			String ids=pd.getString("ids");
			Integer lastIndex=ids.lastIndexOf(",");
			if(lastIndex!=-1){
				pd.put("ids", ids.subSequence(0, lastIndex));
			}
			webUserMasterService.deleteMaster(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	/**
	 * 查看达人
	 * @param id
	 * @return
	 */
	@RequestMapping(value="check_{id}")
	public ModelAndView check(@PathVariable(value="id") Long id){
		ModelAndView mav=new ModelAndView();
		try {
			Map<String, Object> map=webUserMasterService.findMasterDetial(id);
			List<Map<String, Object>> list=webUserMasterService.findExamineList(id);
			mav.addObject("map", map);
			mav.addObject("list", list);
			mav.setViewName("system/fromu/check_master");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 跳转到添加达人页面
	 * @return
	 */
	@RequestMapping(value="add")
	public ModelAndView add(){
		ModelAndView mav=new ModelAndView();
		try {
			List<Map<String, Object>>	list=	webCitysService.findAllCounty();
			mav.addObject("areaList", list);
			mav.setViewName("system/fromu/add_master");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 提交达人申请
	 * @return
	 */
	@RequestMapping(value="submitMaster",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData submitMaster(){
		PageData pd=getApiPageData();
		try {
			pd.put("isAudit", "PLATFORM");
			webUserMasterService.applyMaster(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.ERROR);
			e.printStackTrace();
		}
		return pd;
	}
	
	
	/**
	 * 查询用户
	 * @return
	 */
	@RequestMapping(value="userList",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData userList(){
		PageData pd=getSysPageData();
		try {
			String search = pd.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				pd.put("name", json.get("name"));
			}
			List<Map<String, Object>> list=webUserMasterService.findUserList(pd);
			pd.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}
	
}
