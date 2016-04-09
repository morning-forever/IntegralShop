package com.bm.webs.service.web.forum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebComplaintService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 查询
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findList(PageData pd) throws Exception {
		Float total=(Float) dao.findForObject("WebComplaintMapper.findCount", pd);
		pd.put("recordsTotal", total.intValue());
		pd.put("recordsFiltered", total.intValue());
		pd.put("totalPage", Math.ceil(total/pd.getDouble("showLine")));
		return (List<Map<String, Object>>) dao.findForList("WebComplaintMapper.findList", pd);
	}

	/**
	 * 查看吐槽详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findComplaintDetial(PageData pd) throws Exception {
		dao.update("WebComplaintMapper.updateBrowse", pd);
		return (Map<String, Object>) dao.findForObject("WebComplaintMapper.findComplaintDetial", pd);
	}

	/**
	 * 查询吐槽详情下的回复List
	 * 一级回复
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findReplyList(PageData pd) throws Exception {
		Float total=(Float) dao.findForObject("WebComplaintMapper.findReplyCount", pd);
		pd.put("totalPage", Math.ceil(total/pd.getDouble("showLine")));
		pd.put("recordsTotal", total.intValue());
		pd.put("recordsFiltered", total.intValue());
		return (List<Map<String, Object>>) dao.findForList("WebComplaintMapper.findReplyList", pd);
	}

	/**
	 * 
	 * 查询二级回复List
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findSecondaryList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebComplaintMapper.findSecondaryList", pd);
	}

	/**
	 * 新添吐槽
	 * @param pd
	 * @throws Exception
	 */
	public void addComplaint(PageData pd) throws Exception {
		dao.save("WebComplaintMapper.addComplaint", pd);
	}

	/**
	 * 新添吐槽回复
	 * @param pd
	 * @throws Exception 
	 */
	public void addComplaintReply(PageData pd) throws Exception {
		dao.save("WebComplaintMapper.addComplaintReply", pd);
		if ("0".equals(pd.getString("rootId"))) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", pd.get("userId"));
			PageData user = (PageData) dao.findForObject("WebUserMapper.findById", param);
			param.put("id", pd.get("toUserId"));
			PageData toUser = (PageData) dao.findForObject("WebUserMapper.findById", param);
			param.put("complaintId", pd.get("toComplaintId"));
			Map<String, Object> complatint=(Map<String, Object>) dao.findForObject("WebComplaintMapper.findComplaintDetial", param);
			PageData notice = new PageData();
			String title=(String) complatint.get("content");
			if(title.length()>80){
				title=title.substring(0, 80);
			}
			notice.put("message", user.get("nickname") + "回复了你的文章");
			notice.put("msgType", "comment");
			notice.put("msgSource", "complaint");
			notice.put("toUserId", toUser.get("id"));
			notice.put("fromUserId", user.get("id"));
			notice.put("biuldId", pd.get("toComplaintId"));
			notice.put("biuldTitle", title);
			dao.save("WebMessageMapper.addMessage", notice);
		}
	}

	/**
	 * 
	 * 删除吐槽
	 * 
	 * @param pd
	 * @throws Exception 
	 */
	public void deleteComplaint(PageData pd) throws Exception {
		dao.delete("WebComplaintMapper.deleteComplaint", pd);
	}

	/**
	 * 
	 * 查询指定一级回复的所有二级回复
	 * 
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findAllSecondaryList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebComplaintMapper.findAllSecondaryList", pd);
	}

	/**
	 * 验证删除吐槽
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Long checkDelete(PageData pd) throws Exception {
		return (Long) dao.findForObject("WebComplaintMapper.checkDelete", pd);
	}

	
}
