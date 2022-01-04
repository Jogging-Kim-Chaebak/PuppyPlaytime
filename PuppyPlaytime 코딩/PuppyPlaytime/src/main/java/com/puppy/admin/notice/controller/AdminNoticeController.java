package com.puppy.admin.notice.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.puppy.admin.notice.service.AdminNoticeService;
import com.puppy.client.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {
	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언
	
	@Autowired
	private AdminNoticeService noticeService;
	
	
	/************************************************************
	 * 글목록 구현하기
	 * *********************************************************/
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeList 호출 성공");
		
		List<NoticeVO> noticeList = null;
		try {
			noticeList = noticeService.noticeList();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("data");
		
		return "admin/notice/noticeList";
	}
	
	
	
	/************************************************************
	 * 글쓰기 폼 출력하기
	 * *********************************************************/
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("writeForm 호출 성공");
		return "admin/notice/writeForm";
	}
	
	/************************************************************
	 * 글쓰기 구현하기
	 * *********************************************************/
	@RequestMapping(value="/noticeAdd", method=RequestMethod.POST)
	public String noticeAdd(@ModelAttribute NoticeVO nvo, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeAdd 호출 성공");
		
		int result = 0;
		String url = "";
		
		try {
			result=noticeService.noticeAdd(nvo);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		if(result==1) {
			url = "/admin/notice/noticeList";
		}else {
			model.addAttribute("code",1);
			url = "admin/notice/writeForm";
		}
		
		return "redirect:" + url;
	}
	
	/************************************************************
	 * 글 상세보기 구현하기
	 * *********************************************************/
	
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeDetail 호출 성공");
		log.info("n_no = " + nvo.getN_no());
		
		NoticeVO detail = new NoticeVO();
		try {
			detail = noticeService.noticeDetail(nvo);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n","<br>"));
		}
		
		model.addAttribute("detail",detail);
		
		return "admin/notice/noticeDetail";
	}
	
	
	/************************************************************
	 * 글 수정 페이지
	 * *********************************************************/
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modifyForm(@ModelAttribute NoticeVO nvo, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info(nvo.getN_no()+"번째 글의 updateForm 호출 성공");
		model.addAttribute("updateData",noticeService.noticeDetail(nvo));
		return "/admin/notice/noticeUpdateForm";
	
	}
	
	/************************************************************
	 * 글 수정처리
	 * *********************************************************/
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String noticeModify(@ModelAttribute NoticeVO nvo, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeModify 호출 성공");
		
		int result=0;
		String url="";
		
		result = noticeService.noticeModify(nvo);
		
		if(result == 1) {
			
			url="/admin/notice/noticeDetail?n_no="+nvo.getN_no();
		}else {
			
			model.addAttribute("code",1);
			url="/admin/notice/modify?n_no="+nvo.getN_no();
		}
		System.out.println(nvo);
		return "redirect:"+url;
	}
	
	
	
	/************************************************************
	 * 글삭제 구현하기
	 * *********************************************************/
	
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@ModelAttribute  NoticeVO nvo,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeDelete 호출 성공");
		
		//아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		
		try {
			result = noticeService.noticeDelete(nvo.getN_no());
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(result==1) {
			url="/admin/notice/noticeList";
		}else {
			url="/admin/notice/noticeDetail?n_no="+ nvo.getN_no();
		}
		
		return "redirect:" + url;
		
	}
	
	private void sessionCheck(HttpServletRequest request, HttpServletResponse response, String message, Model model) throws Exception {
  		session = request.getSession();
  		userId = (String) session.getAttribute("userId");

	    if(userId == null){
	    	response.setContentType("text/html; charset=euc-kr");
	    	PrintWriter out = response.getWriter();
	    	out.println("<script type='text/javascript'>");
	    	out.println("alert('"+ message + "');");
	    	out.println("location.href='/client/login/login'");
	    	out.println("</script>");
	    	out.flush();
	    }else if(!userId.equals("admin")){
	    	response.setContentType("text/html; charset=euc-kr");
	    	PrintWriter out = response.getWriter();
	    	out.println("<script type='text/javascript'>");
	    	out.println("alert('"+ message + "');");
	    	out.println("location.href='/client/login/login'");
	    	out.println("</script>");
	    	out.flush();
	    }else {
	    	model.addAttribute("userId", userId);
	    }
  	}
}
