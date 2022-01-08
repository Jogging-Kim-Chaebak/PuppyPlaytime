package com.puppy.client.login.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.puppy.client.login.service.LoginService;
import com.puppy.client.member.service.MemberService;
import com.puppy.client.member.vo.MemberVO;
import com.puppy.common.crypt.SHA256;

@Controller
@RequestMapping("/client/login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	@Autowired
	private MemberService memberService;

	// JavaMailSender 객체 타입인 mailSender 변수를 선언
	@Autowired
	private JavaMailSender mailSender;
	
	private HttpSession session;

	// 로그인 화면 보여주기 위한 메소드
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception {
		log.info("login.do get 호출 성공");
		return "client/login/login";
	}

	// 로그인 등록 처리 메서드
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("MemberVO") MemberVO mvo, HttpServletRequest request,
			RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		log.info("login post 호출 성공");

		session = request.getSession();

		// 비밀번호 암호화
		SHA256 sha = SHA256.getInsatnce();
		String shaPass = sha.getSha256(mvo.getM_pw().getBytes());
		mvo.setM_pw(shaPass);// 비밀번호를 보냄

		MemberVO lvo = loginService.userLogin(mvo);

		if (lvo == null) { // 일치하지 않은 아이디,비밀번호 입력 경우
			int result = 0;
			rttr.addFlashAttribute("result", result);

			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('로그인에 실패하였습니다.');");
			out.println("location.href='/client/login/login'");
			out.println("</script>");
			out.flush();

			return "client/login/login";
		} else {
			session.setAttribute("userId", lvo.getM_id()); // 일치하는 아이디와 비밀번호일 경우
			if (lvo.getM_id().equals("admin")) {
				return "redirect:/admin";
			} else {
				return "intro";
			}
		}
	}

	// 아이디 찾기 페이지
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String find_idForm() {
		log.info("find_id GET 호출 성공");
		return "client/login/find_id";
	}

	// 아이디 찾기 처리 메서드
	@ResponseBody
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String find_id(String m_email, Model model, RedirectAttributes rttr) throws Exception {
		log.info("find_id POST 호출 성공");
		String ok = "";
		log.info("ok : " + ok);
		MemberVO vo = memberService.find_id(m_email);// 이메일 값
		if (vo == null) {// 이메일이 맞지 않을 경우
			ok = "ok";
			model.addAttribute("vo", null);
			rttr.addFlashAttribute("msg", false);
			return "ok"; // resultData의 값

		} else if (vo != null) {// 이메일이 맞을 경우
			model.addAttribute("m_id", vo.getM_id());// id값을 받아옴
		}
		return vo.getM_id();// vo의 id값을 받아온다.
	}

	// 로그아웃 메소드
	@RequestMapping(value = "/logout")
	public String logout(HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		session = request.getSession();
		session.removeAttribute("userId");

		out.println("<script type='text/javascript'>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("</script>");
		out.flush();

		return "intro";
	}

	// 비밀번호 찾기 페이지
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public String find_pwForm() throws Exception {
		log.info("find_pw GET 호출 성공");
		return "client/login/find_pw";
	}

	// 비밀번호 찾기 : 아이디와 이메일 확인 메서드
	@ResponseBody
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public String findId(MemberVO mvo, Model model, RedirectAttributes rttr) throws Exception {
		log.info("find_pw post");

		MemberVO vo = memberService.find_pw(mvo);
		String ok = "";
		log.info("ok : " + ok);
		if (vo == null) {
			log.info("PW 찾기 실패");
			ok = "ok";
			model.addAttribute("vo", null);
			rttr.addFlashAttribute("mvo", false);
			return "ok";
		} else {// 비밀번호 변경 버튼 클릭시
			log.info("PW 찾기 성공");
			model.addAttribute("vo", vo);
		}
		return "client/login/find_pw";
	}

	// 비밀번호 수정 팝업 페이지
	@RequestMapping(value = "/pw_popup", method = RequestMethod.GET)
	public String pw_popupForm(MemberVO mvo, Model model) throws Exception {
		log.info("pw_popup GET 호출 성공");

		MemberVO vo = memberService.read(mvo);

		model.addAttribute("m_id", vo.getM_id());
		model.addAttribute("m_email", vo.getM_email());
		model.addAttribute("m_pw", vo.getM_pw());

		return "client/login/pw_popup";
	}

	// 비밀번호 수정 팝업 등록 페이지 POST방식 (회원정보 수정시 비동기 처리로 수정해주는 역할)
	@ResponseBody
	@RequestMapping(value = "/pw_popup", method = RequestMethod.POST)
	public String pw_popup(MemberVO mvo, Model model) throws Exception {
		log.info("pw_popup POST 호출 성공");
		// 비밀번호 암호화
		SHA256 sha = SHA256.getInsatnce();
		String shaPass = sha.getSha256(mvo.getM_pw().getBytes());
		mvo.setM_pw(shaPass);// 비밀번호를 보냄

		memberService.update(mvo);
		return "client/login/pw_popup";

	}
	
	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("이메일 : " + email);

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
