package com.bm.webs.controller.web.mall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * PC端商城Controller
 * 
 * @author Hham
 *
 */
@Controller(value="webMailController")
@RequestMapping(value="pc/mall")
public class MailController {

	/**
	 * 跳转到景区商户列表
	 * @return
	 */
	@RequestMapping(value="scenicGoodsList")
	public ModelAndView scenicGoodsList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/scenic_list");
		return mav;
	}
	
	/**
	 * 跳转到酒店商户列表
	 * @return
	 */
	@RequestMapping(value="hotelGoodsList")
	public ModelAndView hotelGoodsList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/hotel_list");
		return mav;
	}
	
	/**
	 * 跳转到餐饮商户列表
	 * @return
	 */
	@RequestMapping(value="caterGoodsList")
	public ModelAndView caterGoodsList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/cater_list");
		return mav;
	}
	
	/**
	 * 跳转到装备商户列表
	 * @return
	 */
	@RequestMapping(value="equipGoodsList")
	public ModelAndView equipGoodsList(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/equip_list");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到景区商品详情
	 * 商户简介
	 * 
	 * @return
	 */
	@RequestMapping("scenicGoodsDetialOfIntroduce")
	public ModelAndView scenicGoodsDetialOfIntroduce(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/scenic_goods_detial_of_introduce");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到景区商品详情
	 * 商品详情
	 * 
	 * @return
	 */
	@RequestMapping("scenicGoodsDetialOfDetial")
	public ModelAndView scenicGoodsDetialOfDetial(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/scenic_goods_detial_of_detail");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到景区商品详情
	 * 评论
	 * 
	 * @return
	 */
	@RequestMapping("scenicGoodsDetialOfComment")
	public ModelAndView scenicGoodsDetialOfComment(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/scenic_goods_detial_of_comment");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到景区商品详情
	 * 提交订单
	 * 
	 * @return
	 */
	@RequestMapping("scenicGoodsDetialBeforePay")
	public ModelAndView scenicGoodsDetialBeforePay(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/scenic_goods_detial_before_pay");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到酒店商品详情
	 * 商户简介
	 * 
	 * @return
	 */
	@RequestMapping("hotleGoodsDetialOfIntroduce")
	public ModelAndView hotleGoodsDetialOfIntroduce(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/hotel_goods_detial_of_introduce");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到酒店商品详情
	 * 商品介绍
	 * 
	 * @return
	 */
	@RequestMapping("hotleGoodsDetialOfDetial")
	public ModelAndView hotleGoodsDetialOfDetial(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/hotel_goods_detial_of_detial");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到酒店商品详情
	 * 用户评价
	 * 
	 * @return
	 */
	@RequestMapping("hotleGoodsDetialOfComment")
	public ModelAndView hotleGoodsDetialOfComment(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/hotel_goods_detial_of_comment");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到酒店商品详情
	 * 提交订单
	 * 
	 * @return
	 */
	@RequestMapping("hotleGoodsDetialBeforePay")
	public ModelAndView hotleGoodsDetialBeforePay(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/hotel_goods_detial_before_pay");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到餐饮商品详情
	 * 商户简介
	 * 
	 * @return
	 */
	@RequestMapping("caterGoodsDetialOfIntroduce")
	public ModelAndView caterGoodsDetialOfIntroduce(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/cater_goods_detial_of_introduce");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到餐饮商品详情
	 * 商品详情
	 * 
	 * @return
	 */
	@RequestMapping("caterGoodsDetialOfDetial")
	public ModelAndView caterGoodsDetialOfDetial(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/cater_goods_detial_of_detial");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到餐饮商品详情
	 * 商户简介
	 * 
	 * @return
	 */
	@RequestMapping("equipGoodsDetialOfIntroduce")
	public ModelAndView equipGoodsDetialOfIntroduce(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/equip_goods_detial_of_introduce");
		return mav;
	}
	
	/**
	 * 
	 * 跳转到餐饮商品详情
	 * 商品详情
	 * 
	 * @return
	 */
	@RequestMapping("equipGoodsDetialOfDetial")
	public ModelAndView equipGoodsDetialOfDetial(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/mall/equip_goods_detial_of_detial");
		return mav;
	}
	
}
