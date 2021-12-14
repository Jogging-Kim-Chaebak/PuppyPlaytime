package com.puppy.client.reservation.controller;

import java.time.LocalDate;
import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.service.ReservationService;

@Controller
@RequestMapping(value="/client/reserve")
public class ReservationController {
	
	//@Autowired
	//private ReservationService reservationService;
	
	@RequestMapping(value="/reserveCalendar")
	public String reserveCalendar(@RequestParam(value="year", defaultValue="0") int year, @RequestParam(value="month", defaultValue="0") int month, Model model) {
		// JAVA 8 이후 나온 달력 쓰는 클래스
		LocalDate localDate;
		YearMonth yearMonth;
		int monthEnd, monthFirst;
		
		if(year != 0) {
			// 해당 12월달 다음은 내년 1월, 해당 1월 전은 작년 12월
			if(month > 12) {
				System.out.println(year);
				System.out.println(month);
				year+=1;
				month = 1;
			}
			if(month < 1) {
				year-=1;
				month = 12;
			}
		}

		// year, month 기본값 -1 설정, -1 이면 지금 날짜 출력
		if(year == 0) {
			localDate = LocalDate.now();
			yearMonth = YearMonth.now();
			year = localDate.getYear();
			month = localDate.getMonth().getValue();
			monthEnd = yearMonth.atEndOfMonth().getDayOfMonth();
			monthFirst = yearMonth.atDay(1).getDayOfWeek().getValue();
		}else {
			yearMonth = YearMonth.of(year, month);
			monthEnd = yearMonth.atEndOfMonth().getDayOfMonth();
			monthFirst = yearMonth.atDay(1).getDayOfWeek().getValue();
		}
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("monthEnd", monthEnd);
		model.addAttribute("monthFirst", monthFirst);
		
		return "client/reserve/reserveCalendar";
	}
	
	@RequestMapping(value="/reserveRoom")
	public String reserveRoom(@RequestParam(value="startDate") String startDate, @RequestParam(value="endDate") String endDate, Model model){
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "client/reserve/reserveRoom";
	}
}