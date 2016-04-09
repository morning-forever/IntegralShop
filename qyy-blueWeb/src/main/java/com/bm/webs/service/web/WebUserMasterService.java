package com.bm.webs.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 达人列表Service
 * 
 * @author Hham
 *
 */
@Service
@Transactional
@SuppressWarnings("unchecked")
public class WebUserMasterService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void applyMaster(PageData pd) throws Exception {
		dao.save("WebUserMasterMapper.applyMaster", pd);

		Long id = pd.getLong("id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("masterId", id);
		String[] areaArr = pd.getString("area").split(",");
		for (int i = 0; i < areaArr.length; i++) {
			map.put("areaId", areaArr[i]);
			dao.save("WebUserMasterMapper.addMasterArea", map);
			map.remove("areaId");
		}
	}

	/**
	 * 获取达人列表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findMasterList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebUserMasterMapper.findMasterCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<Map<String, Object>>) dao.findForList("WebUserMasterMapper.findMasterList", pd);
	}

	/**
	 * 提交审核状态
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void updateExamineMaster(PageData pd) throws Exception {
		dao.save("WebUserMasterMapper.insertExamine", pd);
		dao.update("WebUserMasterMapper.updateMasterState", pd);
		String titleStr = "您的达人申请未通过";
		String reasonStr = "原因:" + pd.getString("reamrk");
		if ("OK".equals(pd.getString("state")) || "PLATFORM".equals(pd.getString("state"))) {
			dao.update("WebUserMasterMapper.updateUserMaster", pd);
			titleStr = "您的达人申请已通过";
			reasonStr = "";
		}
		Long userId = (Long) dao.findForObject("findUserIdByMasterId", pd);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("message", titleStr);
		param.put("msgType", "notice");
		param.put("msgSource", "result");
		param.put("fromUserId", 0);
		param.put("toUserId", userId);
		param.put("biuldId", 0);
		param.put("biuldTitle", reasonStr);
		param.put("biuldImg", "");
		dao.save("WebMessageMapper.addMessage", param);
	}

	/**
	 * 删除达人
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void deleteMaster(PageData pd) throws Exception {
		Integer number=(Integer) dao.update("WebUserMasterMapper.deleteMaster", pd);
		if(number>0){
			dao.update("WebUserMasterMapper.updateDeleteMaster", pd);
		}
	}

	/**
	 * 查询达人信息
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findMasterDetial(Long id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return (Map<String, Object>) dao.findForObject("WebUserMasterMapper.findMasterDetial", map);
	}

	/**
	 * 查询审核记录
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findExamineList(Long id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return (List<Map<String, Object>>) dao.findForList("WebUserMasterMapper.findExamineList", map);
	}

	/**
	 * 查询用户
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findUserList(PageData pd) throws Exception {
		Long pageSize = pd.getLong("showLine");
		Long count = (Long) dao.findForObject("WebUserMasterMapper.findUserCount", pd);
		Long totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
		pd.put("totalPage", totalPage);
		pd.put("recordsTotal", count);
		pd.put("recordsFiltered", count);
		return (List<Map<String, Object>>) dao.findForList("WebUserMasterMapper.findUserList", pd);
	}

	/**
	 * 根据用户ID查询达人申请信息
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> findMasterDetialByUserId(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("WebUserMasterMapper.findMasterDetialByUserId", pd);
	}

	/**
	 * 查询达人区域
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> findMasterArea(PageData pd) throws Exception {
		return (List<Map<String, Object>>) dao.findForList("WebUserMasterMapper.findMasterArea", pd);
	}

	/**
	 * 修改达人信息
	 * 
	 * @param pd
	 * @throws Exception
	 */
	public void updateMaster(PageData pd) throws Exception {
		dao.update("WebUserMasterMapper.updateMaster", pd);

		Long id = (Long) dao.findForObject("WebUserMasterMapper.findMasterIdByUserId", pd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("masterId", id);
		dao.delete("WebUserMasterMapper.deleteMasterArea", pd);
		String[] areaArr = pd.getString("area").split(",");
		for (int i = 0; i < areaArr.length; i++) {
			map.put("areaId", areaArr[i]);
			dao.save("WebUserMasterMapper.addMasterArea", map);
			map.remove("areaId");
		}
	}

	/**
	 * 查询是否为达人
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public PageData findUserMaster(PageData pd) throws Exception {
		return (PageData) dao.findForObject("WebUserMasterMapper.findUserMaster", pd);
	}

}
