package com.puppy.client.reservation.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.service.ReservationService;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.client.reservation.vo.ReserveDate;
import com.puppy.common.vo.PetVO;

@Controller
@RequestMapping(value="/client/reserve")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	private HttpSession session;
	private String userId;
	
	// 예약 날짜 선택
	@RequestMapping(value="/reserveCalendar")
	public String reserveCalendar(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		sessionCheck(request, response, "로그인 후 예약 가능합니다.");
		
		// JAVA 8 이후 나온 달력 쓰는 클래스
		LocalDate localDate;
		YearMonth yearMonth;
		int monthEndFirst, monthStartFirst, monthEndSecond, monthStartSecond;
		int year, month, yearNext, monthNext;
		int today;
		
		localDate = LocalDate.now();
		yearMonth = YearMonth.now();
		year = localDate.getYear();
		month = localDate.getMonth().getValue();
		monthEndFirst = yearMonth.atEndOfMonth().getDayOfMonth();
		monthStartFirst = yearMonth.atDay(1).getDayOfWeek().getValue();
		today = localDate.getDayOfMonth();
		
		yearNext = year;
		monthNext = month+1;
		
		// 해당 12월달 다음은 내년 1월
		if(monthNext > 12) {
			yearNext+=1;
			monthNext = 1;
		}
		
		yearMonth = YearMonth.of(yearNext, monthNext);
		monthEndSecond = yearMonth.atEndOfMonth().getDayOfMonth();
		monthStartSecond = yearMonth.atDay(1).getDayOfWeek().getValue();
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("monthEndFirst", monthEndFirst);
		model.addAttribute("monthStartFirst", monthStartFirst);
		model.addAttribute("today", today);
		
		model.addAttribute("yearNext", yearNext);
		model.addAttribute("monthNext", monthNext);
		model.addAttribute("monthEndSecond", monthEndSecond);
		model.addAttribute("monthStartSecond", monthStartSecond);
		
		return "client/reserve/reserveCalendar";
	}
	
	// 예약날짜 받고, 펫 선택창 띄워주기
	@RequestMapping(value="/reservePetSelectForm", method=RequestMethod.POST)
	public String reservePetSelectForm(String m_id, ReserveDate rDate, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.");
		
		// 펫 불러오기
		System.out.println("userId : " + userId);
		List<PetVO> petList = reservationService.importPetList(userId);
		
		model.addAttribute("rDate", rDate);
		model.addAttribute("petList", petList);
		
		return "client/reserve/reservePetSelectForm";
	}
	
	// 펫 상세 불러오기
	@RequestMapping(value="/reservePetSelect", method=RequestMethod.POST)
	public String reservePetSelect(String p_no, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.");
			
		// 성별 한국어로 바꾸기
		String p_gender_korean = "";
		// 체급 한국어로 바꾸기
		String p_weight_korean = "";
		
		PetVO pet = reservationService.importPetDetail(p_no);
		
		switch(pet.getP_gender()) {
		case "M" :
			p_gender_korean = "수컷";
			break;
		case "F" :
			p_gender_korean = "암컷";
			break;
		}
		
		switch(pet.getP_weight()) {
		case "small" :
			p_weight_korean = "소형";
			break;
		case "middle" :
			p_weight_korean = "중형";
			break;
		case "big" :
			p_weight_korean = "대형";
			break;
		}
		
		model.addAttribute("pet", pet);
		model.addAttribute("p_gender_korean", p_gender_korean);
		model.addAttribute("p_weight_korean", p_weight_korean);
		
		return "client/reserve/reservePetSelect";
	}

	// 날짜와 펫 정보에 따라 룸 띄워주기
	@RequestMapping(value="/reserveRoom")
	public String reserveRoom(PetVO petVO, ReserveDate rDate, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.");
		
		rDate.setStartDate(rDate.getStartDate() + " 09:00:00");
		rDate.setEndDate(rDate.getEndDate() + " 17:00:00");
		
		petVO.setM_id(userId);
		
		//Date startReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startDate);
		//Date endReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endDate);
		//petVO, rDate
		
		List<CageRoomVO> roomList = reservationService.listRoom();
		
		model.addAttribute("rDate", rDate);
		model.addAttribute("roomList", roomList);
		
		return "client/reserve/reserveRoom";
	}
	
	// 상세예약창 띄워주기
	@RequestMapping(value="/reserveDetailForm", method=RequestMethod.POST)
	public String petDetailForm(ReserveDate rDate, @RequestParam("c_no") int c_no, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.");
		
		CageRoomVO cageRoomVO = reservationService.cageDetail(c_no);
		
		model.addAttribute("rDate", rDate);
		model.addAttribute("cageRoomVO", cageRoomVO);
		return "client/reserve/reserveDetail";
	}
	
	// 상세 예약 및 가격 확인 후 예약
	@RequestMapping(value="/reserveDetail", method=RequestMethod.POST)
	public String reserveDetail(ReserveDate rDate, ReservationVO rvo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.");
		
		Date startReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rDate.getStartDate());
		Date endReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rDate.getEndDate());
		
		rvo.setM_id(userId);
		rvo.setR_startDate(startReservation);
		rvo.setR_endDate(endReservation);
		
		reservationService.requestReservation(rvo);
		
		return "intro";
	}
	
	
	private void sessionCheck(HttpServletRequest request, HttpServletResponse response, String message) throws Exception {
  		session = request.getSession();
	    userId = (String) session.getAttribute("user_id");

	    if(userId == null){
	    	response.setContentType("text/html; charset=euc-kr");
	    	PrintWriter out = response.getWriter();
	    	out.println("<script type='text/javascript'>");
	    	out.println("alert('"+ message + "');");
	    	out.println("location.href='/client/login/login'");
	    	out.println("</script>");
	    	out.flush();
	    }
  	}
}