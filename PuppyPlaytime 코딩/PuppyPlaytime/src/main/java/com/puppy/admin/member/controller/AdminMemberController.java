package com.puppy.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.member.service.AdminMemberService;
import com.puppy.client.member.vo.MemberVO;

@Controller
@RequestMapping(value ="/admin/member")
public class AdminMemberController {
	private static final String CONTEXT_PATH = "admin/member";
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping("/adminMemberList") // 부가서비스 리스트
	public ModelAndView adminMemberList(@ModelAttribute MemberVO param) {

		List<MemberVO> list = adminMemberService.adminMemberList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("adminMemberList", list);
		mav.setViewName(CONTEXT_PATH + "/adminMemberList");

		return mav;
	}
	
	@RequestMapping("/adminMemberDisabled") // 케이지 비활성화
	public String adminMemberDisabled(@RequestParam("m_id") String m_id) {
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
}
