package com.puppy.admin.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.notice.service.AdminNoticeService;
import com.puppy.admin.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {
	
	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	private AdminNoticeService noticeService;
	
	/**********************************************
	 * 글목록 구현하기
	 * ********************************************/
	
	@RequestMapping(value="/noticeList.do", method = RequestMethod.GET)
	public String noticeList(Model model) {
		log.info("noticeList 호출 성공");
		
		List<NoticeVO> list = noticeService.noticeList();
		
		model.addAttribute("noticeList",list);	//jsp파일에 필요한("객체명, 데이터")
		model.addAttribute("data");
		
		return "admin/notice/noticeList";
		
	}
	

	/**********************************************
	 * 글쓰기 폼 출력하기
	 * ********************************************/
	@RequestMapping(value="/writeForm.do")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		return "admin/notice/writeForm";
	}
	
	/**********************************************
	 * 글쓰기 구현하기
	 * ********************************************/
	
	@RequestMapping(value="/noticeAdd.do", method=RequestMethod.POST)
	public String noticeAdd(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeAdd 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = noticeService.noticeAdd(nvo);
		if(result==1) {
			url = "/admin/notice/noticeList.do";
			
		}else {
			model.addAttribute("code",1);
			url = "/admin/notice/writeForm.do";
		}
		
		return "redirect:"+url;
	}
}
