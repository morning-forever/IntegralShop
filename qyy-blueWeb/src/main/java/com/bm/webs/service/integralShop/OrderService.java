package com.bm.webs.service.integralShop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.mail.SimpleMailSender;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;
import com.bm.webs.service.web.user.WebUserService;
import com.bm.webs.vo.OrderView;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class OrderService {
	
	@Resource
	private DaoSupport dao;
	
	@Resource
	private WebUserService webUserService;
	
	@Resource
	private WebIntegralGoodsService webIntegralGoodsService;
	
	public void submitOrder(OrderView orderView) throws Exception {
		
		
		//一、查询当前是否还有剩余商品
		Integer  residueNumber = (Integer) dao.findForObject("IntegralGoodsMapper.getGoodsResdById", orderView);
		if(residueNumber<=0){
			throw new Exception("residuNumber<=0");
		}
		
		//处理兑换
		//1.扣除当前用户的积分，更新数据库
		
		//(1)先获得用户
		Map<String,Object> parameters = new HashMap<String,Object>();
		parameters.put("id", orderView.getUserId());
		
		//(2)获得商品所要耗费的积分
		Integer goodsScore= orderView.getGoods().getCurrentPrice()*orderView.getQuantity();
		parameters.put("goodsScore", goodsScore);
		
		//(3)更新用户积分
		webUserService.updateWuScoreWhenExchange(parameters);
		
		//2.更新商品剩余
		dao.update("IntegralGoodsMapper.updateResidue", orderView);
		
		
		//3.往订单表表中增加一条记录
		
		Date date = new Date();
		
		SimpleDateFormat orderIdSdf = new SimpleDateFormat("yyyyMMddhhmmss", Locale.CHINA);
		orderView.setOrderId(""+orderView.getUserId()+orderIdSdf.format(date));
		
		SimpleDateFormat timeSdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.CHINA);
		orderView.setTime(timeSdf.format(date));
		
		dao.save("OrderMapper.saveOrder", orderView);
		//4.发送通知邮件
		SimpleMailSender.sendEmail("1042456230@qq.com", "用户兑换商品通知", "有用户兑换商品，请登录后台管理系统查看兑换详情", "1");
		
	}
	
	
	public List<OrderView> getExchRcds(Long userId) throws Exception{
		
		return (List<OrderView>) dao.findForList("OrderMapper.getExchRcds", userId);
		
	}
	
	public PageData getAllUserExchRcds(PageData param) throws Exception{
		PageData pageData = new PageData();
		
		List<OrderView> orderViews = (List<OrderView>) dao.findForList("OrderMapper.getAdminExchRcds", param);
		List<OrderView> allOrder= (List<OrderView>) dao.findForList("OrderMapper.getAdminExchRcds", null);
		pageData.put("data", orderViews);
		pageData.put("recordsTotal",allOrder.size());
		pageData.put("recordsFiltered", allOrder.size());
		return pageData;
	}
	
	public void saveWaybillNumber(OrderView orderView) throws Exception{
		dao.update("OrderMapper.saveWaybillNumber", orderView);
	}
	
	public void userReceiveGoods(Integer id) throws Exception{
		dao.update("OrderMapper.userReceiveGoods", id);
	}
	
	public void deleteRecordById(Integer id) throws Exception{
		
		dao.delete("OrderMapper.deleteRecordById", id);
	}
}
