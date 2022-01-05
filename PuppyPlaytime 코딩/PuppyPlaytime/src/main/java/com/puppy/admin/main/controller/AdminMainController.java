package com.puppy.admin.main.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.reservation.service.AdminReservationService;
import com.puppy.admin.statistics.controller.StatisticsController;
import com.puppy.admin.statistics.service.StatisticsService;
import com.puppy.client.reservation.service.ReservationService;
import com.puppy.client.reservation.vo.ReservationVO;


@Controller
public class AdminMainController {
	
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언
	
	@Autowired
	private AdminReservationService reservationService;

	@Autowired
	private StatisticsService satisticsService;
	
	@RequestMapping("/admin") //당일 예약 리스트
	public ModelAndView todayReservationList(@ModelAttribute ReservationVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		List<ReservationVO> list = reservationService.todayReservationList(param);
		int map = satisticsService.adminTodayJoinStatistics();
		
		System.out.println("리스트"+list);
		System.out.println("맵"+map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reservationList", list);
		mav.addObject("join",map);
		mav.setViewName("adminIntro");

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
