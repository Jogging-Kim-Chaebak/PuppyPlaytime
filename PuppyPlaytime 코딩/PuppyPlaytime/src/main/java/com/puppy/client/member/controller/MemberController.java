package com.puppy.client.member.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

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
		
		// 비밀번호 암호화
		SHA256 sha = SHA256.getInsatnce();
		String shaPass = sha.getSha256(mvo.getM_pw().getBytes());
		mvo.setM_pw(shaPass);// 비밀번호를 보냄

		if (mvo.getM_optional() == null) {
			mvo.setM_optional("N");
		}

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
		String result = "";
		MemberVO mvo = memberService.m_idConfirm(id);

		if (mvo != null) {// 사용할 수 없는 아이디
			result = "N";
		} else {
			result = "Y";
		}
		return result;
	}

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email, HttpServletResponse response) throws Exception {
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("이메일 : " + email);
		
		// 이메일 중복체크
		List<String> emailList = memberService.getEmailList();
		
		if(emailList.contains(email)) {
			return "Already Registered";
		}else {
			/* 인증번호(난수) 생성 */
			// 111111 ~ 999999 범위의 숫자를 얻기 위해서 nextInt(888888) + 111111를 사용
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			log.info("인증번호 : " + checkNum);
	
			/* 이메일 보내기 */
			String setFrom = "PuppyPlaytime<chan978@naver.com>";
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
	
			} catch (Exception e) {
				e.printStackTrace();
			}
	
			String num = Integer.toString(checkNum);
	
			return num;
		}
	}
}
