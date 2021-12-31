package com.puppy.admin.inquiry.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.puppy.client.inquiry.controller.InquiryController;
import com.puppy.client.inquiry.service.InquiryService;
import com.puppy.client.inquiry.vo.InquiryVO;

@Controller
@RequestMapping(value="/admin/inquiry")
public class adminInquiryController {

	private Logger log = LoggerFactory.getLogger(InquiryController.class);
	
	@Autowired
	private InquiryService inquiryService;
	
	
	// 리스트
	@RequestMapping(value="/adminInquiryList", method=RequestMethod.GET)
	public String adminInquiryList(Model model) {
		log.info("adminInquiryList 호출 성공");
		
		List<InquiryVO> inquiryList = inquiryService.inquiryList();
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("data");
		
		return "admin/inquiry/adminInquiryList";
	}
	

	
	// 글 상세보기
	@RequestMapping(value="/adminInquiryDetail", method=RequestMethod.GET)
	public String adminInquiryDetail(@ModelAttribute InquiryVO ivo, Model model) {
		log.info("admininquiryDetail 호출 성공");
		log.info("q_no = " + ivo.getQ_no());
		
		InquiryVO detail = new InquiryVO();
		detail = inquiryService.inquiryDetail(ivo);
		
		if(detail != null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
			
		}
		
		model.addAttribute("detail", detail);
		return "admin/inquiry/adminInquiryDetail";
	}
	
	
	// 글삭제 구현
	@RequestMapping(value="/adminInquiryDelete")
	public String adminInquiryDelete(@ModelAttribute InquiryVO ivo) {
		log.info("adminInquiryDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = inquiryService.inquiryDelete(ivo.getQ_no());
		
		if(result==1) {
			url="/admin/inquiry/adminInquiryList";
		} else {
			url = "/admin/inquiry/adminInquiryDetail?q_no=" + ivo.getQ_no();
		}
		return "redirect:" + url;
	}
	
}
