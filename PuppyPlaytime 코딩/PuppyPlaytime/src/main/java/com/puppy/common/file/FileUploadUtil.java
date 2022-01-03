package com.puppy.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	private static Logger log = LoggerFactory.getLogger(FileUploadUtil.class);
	private static final String UPLOAD_PATH = "C:\\PuppyPlaytimeRepository\\";
	
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	public static String fileUpload(MultipartFile file, HttpServletRequest request, String path) throws IOException{	
		log.info("fileUpload 호출 성공");
		String real_name=null;
		String org_name = file.getOriginalFilename();
		log.info("org_name : "+org_name);
		
		if(org_name!=null&&(!org_name.equals(""))) {
			real_name = System.currentTimeMillis()+"_"+org_name;
			
			String docRoot = request.getSession().getServletContext().getRealPath("/");
			//String img_path = "resources/images/";
			makeDir(docRoot);
			
			/* File fileAdd = new File(docRoot+img_path+real_name); */
			File fileAdd = new File(UPLOAD_PATH+path,real_name);
			log.info("업로드할 파일(fileAdd):"+fileAdd);
			
			file.transferTo(fileAdd);	
		}
		return real_name;
	}
	
	// 파일 삭제 메서드
	public static void fileDelete(String fileName, HttpServletRequest request, String path)throws IOException{
		log.info("fileDelete 호출 성공");
		boolean result=false;
		String dirName=fileName.substring(0,fileName.indexOf("_"));
		String docRoot = request.getSession().getServletContext().getRealPath("UPLOAD_PATH"+path+dirName);
		File fileDelete = new File(docRoot+"/"+fileName);
		log.info("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists()&&fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}
}