package com.bm.webs.controller.system.integralShop;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bm.common.beans.XConst;
import com.bm.common.util.file.FileUpload;
import com.bm.webs.bean.PageData;
import com.bm.webs.bean.integralShop.Banner;
import com.bm.webs.controller.BaseController;
import com.bm.webs.service.integralShop.BannerService;

import cn.jpush.api.common.connection.IHttpClient.RequestMethod;
@Controller
@RequestMapping("admin/integralShop/banner_manage")
public class BannerManageController extends BaseController{
	
	@Autowired
	private BannerService bannerService;
	
	@RequestMapping("main")
	public ModelAndView main(){
		
		ModelAndView mav = new ModelAndView("system/integralShop/banner_manage_main");
		return mav;
	}
	
	@RequestMapping("list")
	@ResponseBody
	public PageData list() throws Exception{
		PageData result=null;
		PageData param = getSysPageData();
		result = bannerService.getBannerList(param);
		return result;
	}
	@RequestMapping("saveUI")
	public ModelAndView saveUI(){
		ModelAndView mav = new ModelAndView("system/integralShop/banner_manage_saveUI");
		
		return mav;
	}
	
	//上传banner图片
	@RequestMapping("bannerImgUpload")
	@ResponseBody
	public PageData bannerImgUpload(@RequestParam("img") MultipartFile file,HttpServletRequest request){
		System.out.println("hello!"+new Date());
		PageData result = new PageData();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String oldName = file.getOriginalFilename();
			String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
			String realPath = request.getSession().getServletContext().getRealPath("") + "/uploadFiles/uploadImgs/bannerImgs";
			String urlPath = "uploadFiles/uploadImgs/bannerImgs/";
			String fileName = sdf.format(new Date()) + suffix;
			FileUpload.copyFile(file.getInputStream(), realPath, fileName);
			System.out.println("********请查看图片到底上传成功没？**************");
			result.put("imgUrl", urlPath+fileName);
			//判断图片大小
			File fileObj = new File(realPath+"/"+fileName);
			FileInputStream fis = new FileInputStream(fileObj);
			try{
				BufferedImage buff = ImageIO.read(fis);
				double ratio = (double)buff.getWidth()/buff.getHeight();
				if(ratio < 1.7 || ratio > 2.3){
					result.putStatus("size_error");//大小不符合规定
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				fis.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("save")
	@ResponseBody
	public PageData save(Banner banner){
		PageData pageData = new PageData();
		try {
			bannerService.save(banner);
			pageData.putStatus(XConst.SUCCESS);
		} catch (Exception e) {
			pageData.putStatus(XConst.FAIL);
			e.printStackTrace();
		}
		return pageData;
	}
	
	@RequestMapping("delete/{id}")
	@ResponseBody
	public PageData deleteBanner(@PathVariable Integer id,HttpServletRequest request){

		PageData result = new PageData();
		try {
			//服务器地址
			String serverPath = request.getSession().getServletContext().getRealPath("")+"/";
			//删除图片
			if( bannerService.deleteById(id,serverPath) ){
				result.putStatus(XConst.SUCCESS);
			}else{
				result.putStatus(XConst.FAIL);
			}
		} catch (Exception e) {
			result.putStatus(XConst.FAIL);
			e.printStackTrace();
		}
		return result;
		
	}
	
	@RequestMapping(value="deleteByUrl")
	@ResponseBody
	public PageData deleteByUrl( String imgUrl,HttpServletRequest request){
		
		PageData result = new PageData();
		
		//删除图片	
		String realPath = request.getSession().getServletContext().getRealPath("")+"/"+imgUrl;
		File file = new File(realPath);
		/*boolean flag = FileUtils.deleteQuietly(file);*/
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
