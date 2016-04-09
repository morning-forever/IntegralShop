package com.bm.webs.controller.system.integralShop;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bm.common.beans.XConst;
import com.bm.common.util.HString;
import com.bm.common.util.file.FileUpload;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.HotLevel;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.integralShop.GoodsHotService;
import com.bm.webs.service.integralShop.GoodsImageService;
import com.bm.webs.service.integralShop.GoodsTypeService;
import com.bm.webs.service.integralShop.WebIntegralGoodsService;
import com.bm.webs.vo.GoodsView;

@Controller(value = "goodsController")
@RequestMapping(value = "admin/integralShop/")
public class GoodsController extends BaseController {

	
	@Autowired                             
	private WebIntegralGoodsService integralGoodsService;
	
	@Autowired
	private GoodsImageService gis;
	
	@Autowired
	private GoodsHotService goodsHotService;
	
	@Autowired
	private GoodsTypeService goodsTypeService;

	@RequestMapping(value = "goods_manage/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("system/integralShop/goods_manage_main");
		
		return mav;
	}
	
	
	

	/**
	 * 后台获取所有商品列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "goods_manage/list")
	@ResponseBody
	public PageData list() {
		PageData res = new PageData();
		try {
			PageData param = getSysPageData();
			String search = param.getString("search[value]");
			
			if (!HString.isEmpty(search)) {
				JSONObject json = JSON.parseObject(search);
				param.put("name", json.get("name"));
				
				/*param.put("cityId", json.get("cityId"));
				param.put("subjectId", json.get("subjectId"));
				param.put("azimuthId", json.get("azimuthId"));
				param.put("expon", json.get("expon"));
				param.put("days", json.get("days"));
				param.put("adultPrice", json.get("adultPrice"));
				param.put("childPrice", json.get("childPrice"));*/
			}
			System.out.println("********准备查询数据库***********");
			res = integralGoodsService.getAdminGoodsList(param);
		} catch (Exception e) {
			res.putStatus(XConst.EXCEPTION);
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value = "goods_manage/saveUI")
	public ModelAndView saveUI() throws Exception{
		
		ModelAndView mav = new ModelAndView("system/integralShop/goods_manage_saveUI");
		
		List<PageData> data=goodsTypeService.getGoodsTypeList();
		Object goodsTypes=JSON.toJSON(data);
		mav.addObject("goodsTypes",goodsTypes );
		List<HotLevel> hotLevelsData = goodsHotService.getHotLevelList();
		Object  hotLevels = JSON.toJSON(hotLevelsData);
		mav.addObject("hotLevels",hotLevels);
		
		return mav;
	}
	
	/**
	 * 保存商品
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "saveGoods")
	@ResponseBody
	public PageData saveGoods(GoodsView gv) throws Exception {
			
			PageData res = new PageData();
			integralGoodsService.saveGoods(gv);
			res.putStatus(XConst.SUCCESS);
		return res;
	}
	
	@RequestMapping("goods_manage/editUI/{id}")
	public ModelAndView EditUI(@PathVariable Integer id) throws Exception{
		ModelAndView mav = new ModelAndView("system/integralShop/goods_manage_editUI");
		
		
		GoodsView gv = integralGoodsService.findGoodsById(id);
		mav.addObject("goodsView",gv);
		
		
		List<PageData> data=goodsTypeService.getGoodsTypeList();
		Object goodsTypes=JSON.toJSON(data);
		mav.addObject("goodsTypes",goodsTypes );
		
		List<HotLevel> hotLevelsData = goodsHotService.getHotLevelList();
		Object  hotLevels = JSON.toJSON(hotLevelsData);
		mav.addObject("hotLevels",hotLevels);
		
		return mav;
	}
	
	/**
	 * 更新商品信息
	 * @param goodsView
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("goods_manage/updateGoods")
	@ResponseBody
	public PageData updateGoods(GoodsView goodsView) {
		PageData pageData = new PageData();
		try {
			integralGoodsService.updateGoods(goodsView);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			pageData.putStatus(XConst.FAIL);
		}
		return pageData;
		
	}
	
	/**
	 * 删除商品
	 * @param id
	 * @return
	 */
	@RequestMapping("goods_manage/deleteGoods/{id}")
	@ResponseBody
	public PageData deleteGoods(@PathVariable Integer id) throws Exception{
		PageData pageData = new PageData();
		integralGoodsService.deleteGoods(id);
		pageData.putStatus(XConst.SUCCESS);
		return pageData;
	}
	
	/**
	 * 商品图片上传
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="imgUpload",produces=XConst.JSON_PRODUCES)
	@ResponseBody
	public PageData imgFileUpload(@RequestParam("img")MultipartFile file,String destination,HttpServletRequest request){
		PageData res = new PageData();
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String oldName = file.getOriginalFilename();
			System.out.println();
			String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
			String realPath = request.getSession().getServletContext().getRealPath("") + "/"+destination;
			String urlPath = destination;
			String fileName = sdf.format(new Date()) + suffix;
			FileUpload.copyFile(file.getInputStream(), realPath, fileName);
			res.put("imgUrl", urlPath+fileName);
			
			//判断图片大小（记得关掉fis）
			FileInputStream fis = null;
			try{
				File fileObj = new File(realPath+"/"+fileName); 
				fis = new FileInputStream(fileObj);
				BufferedImage buff = ImageIO.read(fis);
				double ratio = (double)buff.getWidth()/buff.getHeight();
				if(ratio < 1.7 || ratio > 2.3){
					res.putStatus("size_error");//大小不符合规定
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				fis.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping(value="goods_manage/deleteImgByUrl")
	@ResponseBody
	public PageData deleteByUrl( String imgUrl,HttpServletRequest request){
		
		PageData result = new PageData();
		
		//删除图片	
		String realPath = request.getSession().getServletContext().getRealPath("")+"/"+imgUrl;
		File file = new File(realPath);
		if(file.exists()){
			boolean flag= file.delete();
			if(flag){
				result.putStatus(XConst.SUCCESS);
			}else{
				result.putStatus(XConst.FAIL);
			}
		}else{
			System.out.println("文件不存在");
		}
		
		
		return result;
	}
	
	@Override
	protected String getMenuKey() {
		return null;
	}

}
