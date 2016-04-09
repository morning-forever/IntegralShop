package com.bm.webs.controller.system.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.system.AdminOrderService;
import com.bm.webs.service.web.WebOrderService;

/**
 * 后台主题深度游退款管理
 * 
 * @author Daisy <br>
 *         2015年9月1日
 */
@Controller
@RequestMapping(value = "admin/refund/depth")
public class AdminDepthRefundController extends BaseController {

	@Autowired
	private AdminOrderService adminOrderService;//后台订单
	
	@Autowired
	private WebOrderService webOrderService;//订单
	
	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "main")
	public ModelAndView depthIndex() {
		ModelAndView mav = new ModelAndView("system/order/admin_depth_refund_list");
		return mav;
	}

	/**
	 * 查询深度游列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			String search = param.getString("search[value]");
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("depthName", json.get("depthName"));
				param.put("orderCode", json.get("orderCode"));
				param.put("payOrderId", json.get("payOrderId"));
				param.put("personName", json.get("personName"));
				param.put("orderState", json.get("orderState"));
				param.put("bankName", json.get("bankName"));
				param.put("bankNo", json.get("bankNo"));
			}
			//退款状态为空时，查找所有退款的状态
			if(ValidateHelper.isNullOrEmpty(param.get("orderState"))){
				param.put("orderState", "'REFUNDING','REFUNDING_FAIL','REFUNDED'");
			}
			res = adminOrderService.findDepthRefundList(param);
			res.put("draw", param.getString("draw"));
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 审核
	 * @return
	 */
	@RequestMapping(value = "saveCheck")
	@ResponseBody
	public PageData saveCheck() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			//检查 只有退款中的订单才可以审核
			boolean flag = adminOrderService.checkExamine(param.getLong("orderId"));
			if(flag){
				adminOrderService.saveCheck(param);
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 退款成功和退款失败
	 * @return
	 */
	@RequestMapping(value = "saveRefund")
	@ResponseBody
	public PageData saveRefund() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			//检查 只有退款中的订单才可以退款成功和退款失败
			boolean flag = adminOrderService.checkExamine(param.getLong("orderId"));
			if(flag){
				adminOrderService.saveRefund(param);
				res.putStatus(XConst.SUCCESS);
			}else{
				res.putStatus(XConst.ERROR);
			}
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 查看审核记录
	 * @return
	 */
	@RequestMapping(value = "examineList")
	@ResponseBody
	public PageData examineList() {
		PageData res = new PageData();
		try {
			PageData param = getPageData();
			List<PageData> examineList = adminOrderService.findExamineList(param.getLong("orderId"));
			PageData refundInfo  = adminOrderService.findRefundInfo(param.getLong("orderId"));
			res.put("refundInfo", refundInfo);
			res.put("examineList", examineList);
			res.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 删除订单
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteOrder",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData deleteOrder(Long id){
		PageData pd=getApiPageData();
		try {
			pd.put("id", id);
			webOrderService.deleteOrder(pd);
			pd.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pd.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return pd;
	}
	
	@Override
	protected String getMenuKey() {
		// TODO Auto-generated method stub
		return null;
	}

}
