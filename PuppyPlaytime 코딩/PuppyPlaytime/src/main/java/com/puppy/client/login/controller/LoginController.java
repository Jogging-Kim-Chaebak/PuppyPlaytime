package com.puppy.client.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/client/login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	//private LoginService loginService;
	
	//로그인 화면 보여주기 위한 메소드	 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		log.info("login.do get 호출 성공");
		return "client/login/login";
	}
	
	/*
	//로그인 처리 메서드 : 로그인 실패시 처리 메서드도 포함
	@RequestMapping(value = "/login" ,method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session, HttpServletRequest request) {
		log.info("login post 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		String m_id = mvo.getM_id();
		MemberVO loginCheckResult = loginService.loginSelect(mvo.getM_id(), mvo.getM_pw());
		 
		return mav;
	}*/
}
