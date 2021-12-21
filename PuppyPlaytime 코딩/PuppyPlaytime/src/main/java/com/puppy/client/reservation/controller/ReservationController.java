package com.puppy.client.reservation.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.service.ReservationService;
import com.puppy.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value="/client/reserve")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/reserveCalendar")
	public String reserveCalendar(Model model) {
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
	
	@RequestMapping(value="/reserveRoom")
	public String reserveRoom(@RequestParam(value="startDate") String startDate, @RequestParam(value="endDate") String endDate, Model model) throws Exception{
		startDate += " 09:00:00";
		endDate += " 17:00:00";
		
		Date startReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startDate);
		Date endReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endDate);
		
		List<CageRoomVO> roomList = reservationService.listRoom();
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("roomList", roomList);
		
		return "client/reserve/reserveRoom";
	}
	
	@RequestMapping(value="/reserveDetail")
	public String reserveDetail(@RequestParam(value="startDate") String startDate, @RequestParam(value="endDate") String endDate, 
			ReservationVO rvo, Model model) throws Exception {
		
		Date startReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startDate);
		Date endReservation = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endDate);
		
		rvo.setR_startDate(startReservation);
		rvo.setR_endDate(endReservation);
		
		model.addAttribute("reservationVO", rvo);
		
		return "client/reserve/reserveDetail";
	}
}