package com.puppy.admin.room.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.room.service.CageRoomService;
import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.common.file.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin/room")
public class CageRoomController {
	private static final String CONTEXT_PATH = "admin/room";

	private static final Logger logger = LoggerFactory.getLogger(CageRoomController.class);

	private static final String UPLOAD_PATH = "\\resources\\image";

	@Autowired
	private CageRoomService cageRoomService;

	@RequestMapping("/roomList") // 케이지 리스트
	public ModelAndView roomList(@ModelAttribute CageRoomVO param) {

		List<CageRoomVO> list = cageRoomService.roomList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("roomList", list);
		mav.setViewName(CONTEXT_PATH + "/cageRoomList");

		return mav;
	}

	@RequestMapping("/roomDetail") // 케이지 상세 정보
	public ModelAndView roomDetail(@RequestParam("c_no") String no) {

		ModelAndView mav = new ModelAndView();
		CageRoomVO rvo = cageRoomService.roomDetail(Integer.parseInt(no));
		mav.addObject("cageRoomVO", rvo);
		logger.info(rvo.getC_picture());
		mav.setViewName(CONTEXT_PATH + "/cageRoomDetail");
		return mav;
	}

	@RequestMapping(value = "/roomAdd", method = RequestMethod.POST) // 케이지 등록
	public ModelAndView roomAdd(CageRoomVO cvo, @RequestPart(value = "file") MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException {
		String resultStr = "";

		String c_file = FileUploadUtil.fileUpload(file, request);
		cvo.setC_picture(c_file);
		logger.info(cvo.getC_picture());

		int result = cageRoomService.roomAdd(cvo);

		logger.info(cvo.getC_kind());
		logger.info(cvo.getC_explain());
		logger.info(cvo.getC_status());
		logger.info(cvo.getC_usestatus());
		logger.info(cvo.getC_type());

		ModelAndView mav = new ModelAndView();

		/*
		 * String fileName = file.getOriginalFilename(); File target = new
		 * File(uploadPath, fileName);
		 * 
		 * //경로 생성 if ( ! new File(uploadPath).exists()) { new
		 * File(uploadPath).mkdirs(); }
		 * 
		 * try { FileCopyUtils.copy(file.getBytes(), target); mav.addObject("file",
		 * file); } catch(Exception e) { e.printStackTrace(); mav.addObject("file",
		 * "error"); }
		 * 
		 * 
		 * if(param.getC_picture()!=null) { String b_file =
		 * FileUploadUtil.fileUpload(param.getC_picture(), request, "room");
		 * param.setC_picture(b_file); }
		 * 
		 * 
		 * UUID uuid = UUID.randomUUID(); String saveName = uuid + "_" +
		 * file.getOriginalFilename();
		 * 
		 * logger.info("saveName: {}",saveName);
		 * 
		 * File saveFile = new File(UPLOAD_PATH,saveName); // 저장할 폴더 이름, 저장할 파일 이름
		 * 
		 * try { FileCopyUtils.copy(file.getBytes(),saveFile);
		 * param.setC_picture(UPLOAD_PATH+saveName); } catch (IOException e) {
		 * e.printStackTrace(); return null; }
		 */

		if (result > 0) {
			resultStr = "케이지 등록이 완료되었습니다.";
		} else {
			resultStr = "케이지 등록이 문제가 있어 완료하지 못하였습니다.";
		}
		mav.addObject("file", cvo.getC_picture());
		mav.addObject("result", resultStr);
		mav.setViewName("/result");

		return mav;
	}

	@RequestMapping("/roomDisabled") // 케이지 비활성화
	public ModelAndView roomDisabled(@ModelAttribute CageRoomVO param) {
		String resultStr = "";
		int result = cageRoomService.roomDisabled(param);

		if (result > 0) {
			resultStr = "케이지 비활성화가 완료되었습니다.";
		} else {
			resultStr = "케이지 비활성화가 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName("/result");

		return mav;
	}

	@RequestMapping(value = "/writeForm")
	public String writeForm() {
		return "admin/room/cageRoomAdd";
	}
}
