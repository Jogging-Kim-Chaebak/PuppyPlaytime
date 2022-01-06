package com.puppy.client.reservation.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.service.ReservationService;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.client.reservation.vo.ReserveDate;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.Pagination;
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
		sessionCheck(request, response, "로그인 후 예약 가능합니다.", model);
		
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
	public String reservePetSelectForm(ReserveDate rDate, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		// 성별 한국어로 바꾸기
		String p_gender_korean = "";
		// 체급 한국어로 바꾸기
		String p_weight_korean = "";
		
		// 펫 불러오기
		List<PetVO> petList = reservationService.importPetList(userId);
		
		PetVO pet = reservationService.importOnePet(userId);
		
		model.addAttribute("rDate", rDate);
		model.addAttribute("petList", petList);
		model.addAttribute("petVO", pet);
		
		if(pet != null) {
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
		}
		
		model.addAttribute("p_gender_korean", p_gender_korean);
		model.addAttribute("p_weight_korean", p_weight_korean);
		
		return "client/reserve/reservePetSelect";
	}
	
	// 펫 상세 불러오기
	@ResponseBody
	@RequestMapping(value="/reservePetSelect", method=RequestMethod.POST)
	public PetVO reservePetSelect(int p_no, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		PetVO pet = reservationService.importPetDetail(p_no);
		
		return pet;
	}

	// 날짜에 따라 룸 띄워주기
	@RequestMapping(value="/reserveRoom")
	public String reserveRoom(int p_no, ReserveDate rDate, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
		// 페이징 하더라도 한번만 시간을 더해준다.
		if(rDate != null && rDate.getStartDate().length() < 12) {
			rDate.setStartDate(rDate.getStartDate() + " 15:00:00");
			rDate.setEndDate(rDate.getEndDate() + " 09:00:00");
		}
		
		rDate.setStartReservation(format.parse(rDate.getStartDate()));
		rDate.setEndReservation(format.parse(rDate.getEndDate()));
		
		List<CageRoomVO> roomList = reservationService.listRoom(rDate);
	
		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		
		pagination.setPageRequest(rDate.getPageRequest());
		pagination.setTotalCount(reservationService.roomCount(rDate));
				
		model.addAttribute("pagination", pagination);
		model.addAttribute("rDate", rDate);
		model.addAttribute("roomList", roomList);
		model.addAttribute("p_no", p_no);
		
		return "client/reserve/reserveRoom";
	}
	
	// 상세예약창 띄워주기
	@RequestMapping(value="/reserveDetailForm", method=RequestMethod.POST)
	public String petDetailForm(ReserveDate rDate, int c_no, int p_no, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		
		CageRoomVO cageRoomVO = reservationService.cageDetail(c_no);
		List<ExtraServiceVO> extraServiceList = reservationService.listExtraService(c_no);
		
		// 박 수 구하기 위한 작업
		Date firstDate = format2.parse(rDate.getStartDate().substring(0,10));
		Date secondDate = format2.parse(rDate.getEndDate().substring(0,10));
		
		// 박 수 구하기
		long calDate = secondDate.getTime() - firstDate.getTime();
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
		calDateDays = Math.abs(calDateDays);
		
		model.addAttribute("rDate", rDate);
		model.addAttribute("p_no", p_no);
		model.addAttribute("cageRoomVO", cageRoomVO);
		model.addAttribute("extraServiceList", extraServiceList);
		model.addAttribute("calDateDays", calDateDays);
		
		return "client/reserve/reserveDetail";
	}
	
	// 상세 예약 및 가격 확인 후 예약
	@RequestMapping(value="/reserveDetail", method=RequestMethod.POST)
	public String reserveDetail(ReserveDate rDate, ReservationVO rvo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// rDate 에 값 넣어주기
		rDate.setStartReservation(format.parse(rDate.getStartDate()));
		rDate.setEndReservation(format.parse(rDate.getEndDate()));
				
		// rvo 에 값 넣어주기
		rvo.setR_startDate(rDate.getStartReservation());
		rvo.setR_endDate(rDate.getEndReservation());
		rvo.setM_id(userId);
		
		String[] services = request.getParameterValues("services");

		// 서비스 갯수만큼 처음부터 extraService 채우기
		if(services != null) {
			switch(services.length) {
			case 1:
				rvo.setR_extraService1(Integer.parseInt(services[0]));
				break;
			case 2:
				rvo.setR_extraService1(Integer.parseInt(services[0]));
				rvo.setR_extraService2(Integer.parseInt(services[1]));
				break;
			case 3:
				rvo.setR_extraService1(Integer.parseInt(services[0]));
				rvo.setR_extraService2(Integer.parseInt(services[1]));
				rvo.setR_extraService3(Integer.parseInt(services[2]));
				break;
			case 4:
				rvo.setR_extraService1(Integer.parseInt(services[0]));
				rvo.setR_extraService2(Integer.parseInt(services[1]));
				rvo.setR_extraService3(Integer.parseInt(services[2]));
				rvo.setR_extraService4(Integer.parseInt(services[3]));
				break;
			}
		}
		
		reservationService.requestReservation(rvo);

		return "intro";
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
	    }else {
	    	model.addAttribute("userId", userId);
	    }
  	}
}