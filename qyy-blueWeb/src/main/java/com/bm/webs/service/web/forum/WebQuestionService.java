package com.bm.webs.service.web.forum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.common.util.html.ValidateHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 问答Service
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebQuestionService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 查找提问List
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findList(PageData pd) throws Exception {
		Double total=(Double) dao.findForObject("WebQuestionMapper.findCount", pd);
		pd.put("recordsTotal", total.intValue());
		pd.put("recordsFiltered", total.intValue());
		pd.put("totalPage", Math.ceil(total/pd.getDouble("showLine")));
		return (List<Map<String, Object>>) dao.findForList("WebQuestionMapper.findList", pd);
	}

	/**
	 * 查找提问详情
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> findQuestionDetial(PageData pd) throws Exception {
		dao.update("WebQuestionMapper.updateBrowse", pd);
		return (Map<String, Object>) dao.findForObject("WebQuestionMapper.findQuestionDetial", pd);
	}

	/**
	 * 查询一级回复List
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String, Object>> findReplyList(PageData pd) throws Exception {
		Double total=(Double) dao.findForObject("WebQuestionMapper.findReplyCount", pd);
		pd.put("totalPage", Math.ceil(total/pd.getDouble("showLine")));
		pd.put("recordsTotal", total.intValue());
		pd.put("recordsFiltered", total.intValue());
		return (List<Map<String, Object>>) dao.findForList("WebQuestionMapper.findReplyList", pd);
	}

	public List<Map<String, Object>> findSecondaryList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebQuestionMapper.findSecondaryList", pd);
	}

	/**
	 * 新增提问
	 * @param pd
	 * @throws Exception 
	 */
	public void insertQuestion(PageData pd) throws Exception {
		dao.save("WebQuestionMapper.insertQuestion", pd);
		String atUserIds=pd.getString("atUserIds");
		if(!ValidateHelper.isNullOrEmpty(atUserIds)){
			String[] userArr=atUserIds.split(",");
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("message", pd.getString("userNickname")+"邀请您回答问题");
			map.put("msgType", "notice");
			map.put("msgSource", "qa");
			map.put("biuldId", pd.get("id"));
			map.put("fromUserId", pd.get("userId"));
			map.put("biuldTitle", pd.getString("userNickname")+"邀请您回答问题");
			for (int i = 0; i < userArr.length; i++) {
				map.put("toUserId", userArr[i]);
				dao.save("WebMessageMapper.addMessage", map);
			}
		}
	}

	/**
	 * 新增提问回答
	 * @param pd
	 * @throws Exception 
	 */
	public void insertQuestionReply(PageData pd) throws Exception {
		dao.save("WebQuestionMapper.insertQuestionReply", pd);
		Map<String, Object> param = new HashMap<String, Object>();
		if ("0".equals(pd.getString("rootId"))) {
			param.put("id", pd.get("replyUserId"));
			PageData user = (PageData) dao.findForObject("WebUserMapper.findById", param);
			param.put("id", pd.get("toUserId"));
			PageData toUser = (PageData) dao.findForObject("WebUserMapper.findById", param);
			param.put("questionId", pd.get("replyId"));
			Map<String, Object> question=(Map<String, Object>) dao.findForObject("WebQuestionMapper.findQuestionDetial", param);
			PageData notice = new PageData();
			String title=(String) question.get("content");
			if(title.length()>80){
				title=title.substring(0, 80);
			}
			notice.put("message", user.get("nickname") + "回答了你的问题");
			notice.put("msgType", "comment");
			notice.put("msgSource", "qa");
			notice.put("toUserId", toUser.get("id"));
			notice.put("fromUserId", user.get("id"));
			notice.put("biuldId", pd.get("replyId"));
			notice.put("biuldTitle", title);
			dao.save("WebMessageMapper.addMessage", notice);
		}
	}

	/**
	 * 删除提问 
	 * @param pd
	 * @throws Exception 
	 */
	public void deleteQuestion(PageData pd) throws Exception {
		dao.update("WebQuestionMapper.deleteQuestion", pd);
	}
	
	/**
	 * 查询该留言是否属于用户
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer checkDeleteQuestion(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebQuestionMapper.checkDeleteQuestion", pd);
	}

	/**
	 * 查询指定一级回复下的所有二级回复
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findAllSecondaryList(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebQuestionMapper.findAllSecondaryList", pd);
	}

	/**
	 * 验证是否已被采纳
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public Integer checkAdopt(PageData pd) throws Exception {
		return (Integer) dao.findForObject("WebQuestionMapper.checkAdopt", pd);
	}

	/**
	 * 修改回复状态为采纳
	 * @param pd
	 * @throws Exception 
	 */
	public void updateAdoptReply(PageData pd) throws Exception {
		dao.update("WebQuestionMapper.adoptReply", pd);
	}

	/**
	 * 查询回答数
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Long findRootReplyCount(PageData param) throws Exception {
		return (Long) dao.findForObject("WebQuestionMapper.findRootReplyCount", param);
	}

	public List<Map<String, Object>> findReplyListByUserId(PageData pd) throws Exception {
		Double total=(Double) dao.findForObject("WebQuestionMapper.findReplyCountByUserId", pd);
		pd.put("totalPage", Math.ceil(total/pd.getDouble("showLine")));
		pd.put("recordsTotal", total.intValue());
		pd.put("recordsFiltered", total.intValue());
		return (List<Map<String, Object>>) dao.findForList("WebQuestionMapper.findReplyListByUserId", pd);
	}
	
	
	
}
