package com.puppy.admin.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.member.service.AdminMemberService;
import com.puppy.common.vo.PageRequest;
import com.puppy.common.vo.Pagination;

@Controller
@RequestMapping(value ="/admin/member")
public class AdminMemberController {
	private static final String CONTEXT_PATH = "admin/member";
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping("/adminMemberList") // 부가서비스 리스트
	public ModelAndView adminMemberList(@ModelAttribute("pgrq") PageRequest pageRequest ,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminMemberList", adminMemberService.adminMemberList(pageRequest));
		mav.setViewName(CONTEXT_PATH + "/adminMemberList");
		
		//페이징 네비게이션 정보를 뷰에 전달한다.
				Pagination pagination = new Pagination();
				pagination.setPageRequest(pageRequest);
				pagination.setTotalCount(adminMemberService.count());
				model.addAttribute("pagination", pagination);

		return mav;
	}
	
	@RequestMapping("/adminMemberDisabled") // 케이지 비활성화
	public String adminMemberDisabled(@RequestParam("m_id") String m_id,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";
		int result = adminMemberService.adminMemberDisabled(m_id);

		if (result > 0) {
			resultStr = "회원 탈퇴가 완료되었습니다.";
		} else {
			resultStr = "회원 탈퇴가 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/adminMemberList");

		return "redirect:/admin/member/adminMemberList";
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
