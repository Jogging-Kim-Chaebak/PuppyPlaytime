package com.puppy.client.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.client.member.service.MemberService;
import com.puppy.client.member.vo.MemberVO;

//회원가입 창
@Controller
@RequestMapping(value = "/client/member")
public class MemberController {

	private Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 회원가입 폼
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() throws Exception {
		// 목록을 조회하여 뷰에 전달
		log.info("joinForm get 방식으로 호출");
		return "client/member/joinForm";

	}

	// 회원가입 등록 처리
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public ModelAndView join(@ModelAttribute MemberVO mvo, Model model) throws Exception {
		// 회원가입 서비스 실행
		log.info("joinForm post 방식으로 호출");
		memberService.join(mvo);
		model.addAttribute("msg", "등록이 완료되었습니다");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/client/login/login");
		return mav;
	}

	// 아이디 중복
	@ResponseBody
	@RequestMapping(value = "/m_idConfirm", method = RequestMethod.POST)
	public String m_idConfirm(@RequestParam("m_id") String id) throws Exception {
		String ok = "";
		MemberVO mvo = memberService.m_idConfirm(id);

		if (mvo != null) {
			ok = "ok";
		}
		return ok;
	}


	

}
