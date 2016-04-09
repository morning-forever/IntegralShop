package com.bm.webs.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;


/**
 * 友情连接处理
 * @author mike
 * <br>
 * 2015年11月2日
 */
@Service
@Transactional
public class WebFriendsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 返回友情连接列表
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public PageData friendList() throws Exception{
		PageData res = new PageData();
		res.putMessage(XConst.FAIL);
		List<PageData> list = (List<PageData>) dao.findForList("WebFriendsMapper.finaFriendsList", null);
		if(!HString.isEmpty(list)){
			res.put("friendList",list);
			res.putMessage(XConst.SUCCESS);
		}
		return res;
	}
	
	
	

}
