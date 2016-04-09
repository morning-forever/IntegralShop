package com.bm.webs.service.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bm.webs.bean.PageData;
import com.bm.webs.dao.DaoSupport;

/**
 * 公共上传Service
 * 
 * @author mike <br>
 *         2015年8月21日
 */
@SuppressWarnings("unchecked")
@Service
@Transactional(rollbackFor = Exception.class)
public class CommonUploadService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 返回list列表
	 * 
	 * @param from
	 * @param type
	 * @param fromId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listUpload(String from, String type, String fromId) throws Exception {
		PageData param = new PageData();
		param.put("from", from);
		param.put("type", type);
		param.put("fromId", fromId);
		return (List<PageData>) dao.findForList("CommonUploadMapper.findList", param);
	}

	/**
	 * 返回数据库条件下所有的数据
	 * 
	 * @param from
	 * @param type
	 * @param fromId
	 * @return
	 * @throws Exception
	 */
	public Integer pageListTotalCount(String from, String type, String fromId) throws Exception {
		PageData param = new PageData();
		param.put("from", from);
		param.put("type", type);
		param.put("fromId", fromId);
		return (Integer) dao.findForObject("CommonUploadMapper.pageListTotalCount", param);
	}

	/**
	 * 删除上传的信息
	 * 
	 * @param from
	 * @param type
	 * @param fromId
	 * @return
	 * @throws Exception
	 */
	public boolean delUpload(String from, String type, String fromId) throws Exception {
		PageData param = new PageData();
		param.put("from", from);
		param.put("type", type);
		param.put("fromId", fromId);
		int count = pageListTotalCount(from, type, fromId);
		if (count > 0)
			count = (Integer) dao.delete("CommonUploadMapper.delPics", param);
		else
			return true;
		return count > 0;
	}

	/**
	 * 删除并添加
	 * 
	 * @param from
	 * @param type
	 * @param fromId
	 * @param picList
	 * @return
	 * @throws Exception
	 */
	public boolean delAndAdd(String from, String type, String fromId, List<String> picList) throws Exception {
		PageData param = new PageData();
		param.put("from", from);
		param.put("type", type);
		param.put("fromId", fromId);
		boolean isDel = delUpload(from, type, fromId);
		if (isDel) {
			for (String pic : picList) {
				param.put("picUrl", pic);
				dao.update("CommonUploadMapper.addUpload", param);
			}
			return true;
		}
		return false;
	}
	
	public void savePhotoUrl(PageData map) throws Exception{
		dao.save("CommonUploadMapper.savePhotoUrl", map);
	}

	/**
	 * 
	 * 删除原本图片
	 * 
	 * @param map
	 * @throws Exception 
	 */
	public void deleteAllPhoto(PageData map) throws Exception {
		dao.delete("CommonUploadMapper.deleteAllPhoto", map);
	}

	/**
	 * 
	 * 查询商户所有图片
	 * 
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findAllPhoto(Long id) throws Exception {
		return (List<PageData>) dao.findForList("CommonUploadMapper.findAllPhoto", id);
	}

	/**
	 * 
	 * 查询商品图片
	 * 
	 * @param id
	 * @param goodsType
	 * @return
	 * @throws Exception 
	 */
	public List<String> findGoodsPhoto(Long id, String goodsType) throws Exception {
		PageData map=new PageData();
		map.put("id", id);
		map.put("goodsType", goodsType);
		return (List<String>) dao.findForList("CommonUploadMapper.findGoodsPhoto", map);
	}

	/**
	 * 
	 * 查询图片List
	 * 
	 * @param id
	 * @param string
	 * @param string2
	 * @param i
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> findPhotos(Long id, String picFrom, String picType, Integer number) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("picFrom", picFrom);
		map.put("picType", picType);
		map.put("number", number);
		return (List<PageData>) dao.findForList("CommonUploadMapper.findPhotos", map);
	}

}
