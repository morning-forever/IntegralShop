package com.bm.webs.controller.web.interact;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="webInteractController")
@RequestMapping(value="pc/interact")
public class InteractController {
	
	/**
	 * 
	 * 旅行问答主页
	 * 
	 * @return
	 */
	@RequestMapping("QAndA")
	public ModelAndView QAndA(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/ask_list");
		return mav;
	}
	
	/**
	 * 
	 * 新旅行问答
	 * 
	 * @return
	 */
	/*
	@RequestMapping("newQuestion")
	public ModelAndView newQuestion(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/new_question");
		return mav;
	}*/
	
	/**
	 * 
	 * 旅行问答详情
	 * 
	 * @return
	 */
	@RequestMapping("questionDetial")
	public ModelAndView questionDetial(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/question_detial");
		return mav;
	}
	
	/**
	 * 
	 * 达人攻略
	 * 
	 * @return
	 */
	@RequestMapping("masterRaiders")
	public ModelAndView masterRaiders(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/master_raiders");
		return mav;
	}
	
//	/**
//	 * 
//	 * 游记列表
//	 * 
//	 * @return
//	 */
//	@RequestMapping("travel")
//	public ModelAndView travel(){
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("web/interact/travel");
//		return mav;
//	}
	
	/**
	 * 
	 * 招募玩伴
	 * 
	 * @return
	 */
	@RequestMapping("frendEnlist")
	public ModelAndView frendEnlist(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/frend_enlist");
		return mav;
	}
	
	/**
	 * 
	 * 招募玩伴详情
	 * 
	 * @return
	 */
	@RequestMapping("frendEnlistDetial")
	public ModelAndView frendEnlistDetial(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/frend_enlist_detial");
		return mav;
	}
	
	/**
	 * 
	 * 吐槽专区
	 * 
	 * @return
	 */
	/*@RequestMapping("roast")
	public ModelAndView roast(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("web/interact/roast");
		return mav;
	}*/
	
	
	
	
}
