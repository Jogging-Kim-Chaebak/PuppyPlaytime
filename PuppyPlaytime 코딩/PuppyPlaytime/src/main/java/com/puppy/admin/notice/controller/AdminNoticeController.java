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
import com.puppy.common.vo.PageRequest;
import com.puppy.common.vo.Pagination;

@Controller
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {
	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언
	
	@Autowired
	private AdminNoticeService noticeService;
	
	
	/************************************************************
	 * 글목록 구현하기(목록을 페이징처리로 변경)
	 * *********************************************************/
	
	//페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다
	@RequestMapping(value="/noticeList", method = RequestMethod.GET)
	public void noticeList(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) 
	throws Exception{
			
		//뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("noticeList",noticeService.noticeList(pageRequest));
			
		//페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(noticeService.count());
		model.addAttribute("pagination", pagination);
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
	public String noticeDetail(@ModelAttribute NoticeVO nvo, @ModelAttribute("pgrq") PageRequest pageRequest, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
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
	public String modifyForm(@ModelAttribute NoticeVO nvo, Model model, HttpServletRequest request, HttpServletResponse response, 
@ModelAttribute("pgrq") PageRequest pageRequest)throws Exception{
		
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info(nvo.getN_no()+"번째 글의 updateForm 호출 성공");
		//조회한 게시글 상세 정보를 뷰에 전달한다.
		model.addAttribute("updateData",noticeService.noticeDetail(nvo));
		
		return "admin/notice/noticeUpdateForm";
	
	}
	
	/************************************************************
	 * 글 수정처리(페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.)
	 * *********************************************************/
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String noticeModify(@ModelAttribute NoticeVO nvo, PageRequest pageRequest, Model model, HttpServletRequest request, 
			HttpServletResponse response, RedirectAttributes rttr)throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeModify 호출 성공");
		
		int result=0;
		String url="";
		
		result = noticeService.noticeModify(nvo);
		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page",pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
						
		if(result == 1) {
			url="/admin/notice/noticeDetail?n_no="+nvo.getN_no();
			rttr.addFlashAttribute("msg","SUCCESS");
		}else {
			
			model.addAttribute("code",1);
			url="/admin/notice/modify?n_no="+nvo.getN_no();
			
			
		}

		return "redirect:"+url;
	}
	
	
	
	/************************************************************
	 * 글삭제 구현하기(게시글 삭제 처리, 페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달한다.)
	 * *********************************************************/
	
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@ModelAttribute  NoticeVO nvo, Model model, HttpServletRequest request,
			HttpServletResponse response, PageRequest pageRequest, RedirectAttributes rttr)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		log.info("noticeDelete 호출 성공");
		
		//아래 변수에는 입력 성공에 대한 상태값을 담습니다.(1 or 0)
		int result = 0;
		String url = "";
		
		try {
			result = noticeService.noticeDelete(nvo.getN_no());
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page",pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		/*
		 * if(result==1) { url="/admin/notice/noticeDetail?n_no="+ nvo.getN_no();
		 * 
		 * }else { url="/admin/notice/noticeList"; }
		 */
		
		return "redirect:/admin/notice/noticeList";
		
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
