package com.puppy.admin.extraservice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.extraservice.service.ExtraServiceService;
import com.puppy.common.vo.ExtraServiceVO;


@Controller
@RequestMapping(value ="/admin/extraService")
public class ExtraServiceController {
	private static final String CONTEXT_PATH = "admin/extraService";
	private static final Logger logger = LoggerFactory.getLogger(ExtraServiceController.class);

	@Autowired
	private ExtraServiceService extraServiceService;

	@RequestMapping("/extraServiceList") // 부가서비스 리스트
	public ModelAndView extraServiceList(@ModelAttribute ExtraServiceVO param) {

		List<ExtraServiceVO> list = extraServiceService.extraServiceList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("extraServiceList", list);
		mav.setViewName(CONTEXT_PATH + "/extraServiceList");

		return mav;
	}

	@RequestMapping("/extraServiceDetail") // 부가서비스 상세 정보
	public ModelAndView extraServiceDetail(@RequestParam("s_no") String no) {

		ModelAndView mav = new ModelAndView();
		ExtraServiceVO svo = extraServiceService.extraServiceDetail(Integer.parseInt(no));
		mav.addObject("ExtraServiceVO", svo);
		mav.setViewName(CONTEXT_PATH + "/extraServiceDetail");
		return mav;
	}

	@RequestMapping(value = "/extraServiceAdd", method = RequestMethod.POST) // 부가서비스 등록
	public String extraServiceAdd(@ModelAttribute ExtraServiceVO svo) {
		String resultStr = "";
		
		int result = extraServiceService.extraServiceAdd(svo);
		
		ModelAndView mav = new ModelAndView();

		if (result > 0) {
			resultStr = "부가서비스 등록이 완료되었습니다.";
		} else {
			resultStr = "부가서비스 등록이 문제가 있어 완료하지 못하였습니다.";
		}
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/extraServiceList");
		
		return "redirect:/admin/extraService/extraServiceList";
	}

	@RequestMapping("/extraServiceDisabled") // 케이지 비활성화
	public String extraServiceDisabled(@ModelAttribute ExtraServiceVO svo) {
		String resultStr = "";
		int result = extraServiceService.extraServiceDisabled(svo);

		if (result > 0) {
			resultStr = "부가서비스 비활성화가 완료되었습니다.";
		} else {
			resultStr = "부가서비스 비활성화가 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/extraServiceList");

		return "redirect:/admin/extraService/extraServiceList";
	}

	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "admin/extraService/extraServiceAdd";
	}
	
}
