package com.puppy.client.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.puppy.common.crypt.SHA256;

//회원가입 창
@Controller
@RequestMapping(value = "/client/member")
public class MemberController {

	private Logger log = LoggerFactory.getLogger(MemberController.class);

	// 회원을 위한 객체
	@Autowired
	private MemberService memberService;

	// JavaMailSender 객체 타입인 mailSender 변수를 선언
	@Autowired
	private JavaMailSender mailSender;

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

		//비밀번호 암호화
		SHA256 sha = SHA256.getInsatnce();
		String shaPass = sha.getSha256(mvo.getM_pw().getBytes());
		mvo.setM_pw(shaPass);// 비밀번호를 보냄

		memberService.join(mvo);
		model.addAttribute("msg", "등록이 완료되었습니다");
		ModelAndView mav = new ModelAndView();
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

	// 회원가입시 이메일 인증 랜덤 번호 전송
	@RequestMapping(value = "/sendMail" , method = RequestMethod.GET)
	public String sendMail(HttpServletRequest request) throws Exception {

		/* 뷰(view)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		
		/* 인증번호 (난수 생성) */
		Random random = new Random();
		// 111111~999999 범위의 숫자를 얻기 위해 사용식
		int checkNum = random.nextInt(888888) + 111111;
		// 인증번호가 정상 생성 확인
		log.info("인증번호 : " + checkNum);

		String subject = ""; // 제목
		subject = request.getParameter("subject");
		String content = ""; // 내용
		content = request.getParameter("content");
		String from = "PuppyPlaytime<ghld5@naver.com>";// 보내는사람 이메일
		String to = "";// 받는이 아이디@도메인주소
		to = request.getParameter("m_email");

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);

			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			

			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/client/member/joinForm";
	}
	
	@RequestMapping(value = "/mail")
	public ModelAndView writeForm() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/client/member/mail");

		return mav;
	}

}
