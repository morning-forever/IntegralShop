package com.bm.webs.controller.system.depth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.depth.WebDepthAzimuthService;

/**
 * 方位深度游-方位
 * 
 * @author jiangl <br>
 *         2015年8月31日
 */
@Controller
@RequestMapping(value = "admin/depth/azimuth")
public class AdminAzimuthController  extends BaseController{
	
	@Autowired
	private WebDepthAzimuthService webDepthAzimuthService;//方位
	
	/**
	 * 进入首页
	 * @param page
	 * @return
	 */
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mav = super.getModelAndView();
		try {
			mav.setViewName("system/depth/azimuth_main");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 获取方位 分页
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = super.getSysPageData();
			res = webDepthAzimuthService.getAdminList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 保存方位
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public PageData save() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			if(!HString.isEmpty(param.getString("azimuthName"))){
				Integer count = webDepthAzimuthService.getResultNum(param);
				if(count == 0){
					String azimuthId = param.getString("azimuthId");
					param.put("id", param.getString("azimuthId"));
					//新增
					if(HString.isEmpty(azimuthId)){
						webDepthAzimuthService.insert(param);
					}
					//更新
					else{
						webDepthAzimuthService.update(param);
					}
					res.putStatus(XConst.SUCCESS);
				}else{
					res.putStatus(XConst.EXISTS);
				}
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	
	/**
	 * 删除方位
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public PageData delete() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			webDepthAzimuthService.delete(param.getLong("id"));
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 编辑方位
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public PageData edit() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			Long id = param.getLong("id");
			if(HString.isEmpty(id)){
				res.putStatus(XConst.ERROR);
				return res;
			}
			PageData data = webDepthAzimuthService.getById(id);
			res.put("data", data);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
