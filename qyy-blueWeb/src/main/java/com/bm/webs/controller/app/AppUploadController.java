package com.bm.webs.controller.app;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bm.common.beans.XConst;
import com.bm.common.util.file.FileHelper;
import com.bm.webs.bean.PageData;
import com.bm.webs.controller.BaseController;

/**
 * APP端上传图片Controller
 * 
 * @author Hham
 *
 */
@Controller(value = "AppUploadController")
@RequestMapping(value = "app/upload/")
public class AppUploadController extends BaseController {

	/**
	 * 
	 * 上传图片
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "img", method = RequestMethod.POST)
	@ResponseBody
	public PageData uploadtImg(MultipartFile file,Long oderNumber) {
		PageData res = new PageData();
		res.putFlag(false);
		try {
			String type = null, fileName = null;
			File image = null;

			if (file == null || file.getSize() == 0) {
				res.putMessage(XConst.EMPTY);
			} else {
				// if (file.getSize() > 1 * 1024 * 1024) {
				// map.put(STATUS, SIZE);
				// return;
				// }

				type = file.getOriginalFilename().toLowerCase();
				type = type.substring(type.lastIndexOf("."));
				if (!checkImage(type)) {
					res.putMessage(XConst.DATA_FAIL);
				} else {
					fileName = "uploadFiles/appImg/" + FileHelper.getTimeFileName() + type;
					image = new File(WEB_SITE_ROOT_PATH + fileName);
					File dir = image.getParentFile();
					if (!dir.isDirectory()) {
						dir.mkdirs();
					}
					FileCopyUtils.copy(file.getBytes(), image);
					res.putData("url", fileName);
					res.putFlag(true);
					res.putMessage(XConst.SUCCESS);
					res.putData("oderNumber", oderNumber);
				}
			}
		} catch (IOException e) {
			res.putFlag(false);
			res.putMessage(XConst.ERROR);
			e.printStackTrace();
		}
		return res;
	}

	@Override
	protected String getMenuKey() {
		return null;
	}

}
