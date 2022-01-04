package com.puppy.admin.reservation.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.extraservice.service.ExtraServiceService;
import com.puppy.admin.reservation.service.AdminReservationService;
import com.puppy.admin.room.service.CageRoomService;
import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.member.vo.MemberVO;
import com.puppy.client.mypage.service.MypageService;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.PetVO;

@Controller
@RequestMapping(value="/admin/reservation")
public class AdminReservationController {

	private static final String CONTEXT_PATH = "admin/reservation";
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언
	
	@Autowired
	private AdminReservationService reservationService;
	
	@Autowired
	private ExtraServiceService extraServiceService;
	
	@Autowired
	private CageRoomService cageRoomService;

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/*
	 * @RequestMapping("/newReservationList") //새로운 예약 리스트 public ModelAndView
	 * newReservationList(@ModelAttribute ReservationVO param,Model model,
	 * HttpServletRequest request, HttpServletResponse response)throws Exception {
	 * sessionCheck(request, response, "잘못된 접근입니다.", model); List<ReservationVO>
	 * list = reservationService.newReservationList(param);
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("newReservationList",
	 * list); mav.setViewName(CONTEXT_PATH + "/newReservationList");
	 * 
	 * return mav; }
	 */
	
	@RequestMapping("/reservationList") //예약 리스트
	public ModelAndView reservationList(@ModelAttribute ReservationVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		List<ReservationVO> list1 = reservationService.newReservationList(param);
		List<ReservationVO> list2 = reservationService.reservationList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("reservationList", list2);
		mav.addObject("newReservationList", list1);
		mav.setViewName(CONTEXT_PATH + "/reservationList");

		return mav;
	}
	
	
	@RequestMapping("/reservationDetail") // 예약 상세 정보
	public ModelAndView reservationDetail(@RequestParam("r_no") String no,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		ModelAndView mav = new ModelAndView();
		ReservationVO rvo = reservationService.reservationDetail(Integer.parseInt(no));
		
		MemberVO param = new MemberVO();
		param.setM_id(rvo.getM_id());
		PetVO param2 = new PetVO();
		param2.setP_no(rvo.getR_pet());
	
		MemberVO mvo = mypageService.myDetail(param);
		PetVO pvo = mypageService.petDetail(param2);
		CageRoomVO cvo = cageRoomService.roomDetail(rvo.getC_no());
		List<ExtraServiceVO> list = extraServiceService.extraServiceDetail2(rvo.getC_no());
		
		
		mav.addObject("reservationVO", rvo);
		mav.addObject("extraServiceList", list);
		mav.addObject("cageRoomVO", cvo);
		mav.addObject("memberVO",mvo);
		mav.addObject("petVO",pvo);
		
		if(rvo.getR_approval().equals("W")) {
			mav.setViewName(CONTEXT_PATH + "/reservationDetail");
		}else {
			mav.setViewName(CONTEXT_PATH + "/reservationCancel");
		}
		
		return mav;
	}
	
	@RequestMapping("/reservationApproval") // 예약 승인/거부
	public String reservationApproval(@ModelAttribute ReservationVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";
		int result = reservationService.reservationApproval(param);

		if (result > 0) {
			resultStr = "승인여부 결정이 완료되었습니다.";
		} else {
			resultStr = "승인여부 결정이 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/reservationCancel");

		return "redirect:/admin/reservation/reservationList";
	}
	
	@RequestMapping("/reservationCancel") // 예약 취소
	public String reservationCancel(@ModelAttribute ReservationVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";
		System.out.println(param.getR_no());
		int result = reservationService.reservationCancel(param);

		if (result > 0) {
			resultStr = "예약 취소가 완료되었습니다.";
		} else {
			resultStr = "예약 취소가 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/reservationCancel");
		return "redirect:/admin/reservation/mail";
	}
	
	@RequestMapping("/sendMail") //거부사유 메일
	public String sendMail(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
        String subject = ""; //제목
        subject = request.getParameter("subject");
        String content = ""; //내용
        content = request.getParameter("content");
        String from = "PuppyPlaytime<chan978@naver.com>";//보내는사람 이메일
        String to = "";//받는이 아이디@도메인주소
        to = request.getParameter("to");
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            
            mailHelper.setFrom(from);

            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/reservation/reservationList";
	}
	
	
	@RequestMapping(value = "/mail")
	public ModelAndView writeForm(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/reservationMail");

		return mav;
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
