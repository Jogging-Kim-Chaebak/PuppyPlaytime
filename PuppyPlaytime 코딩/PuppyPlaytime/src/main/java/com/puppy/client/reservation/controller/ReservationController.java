package com.puppy.client.reservation.controller;

import java.time.LocalDate;
import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.puppy.client.reservation.service.ReservationService;

@Controller
@RequestMapping(value="/client/reserve")
public class ReservationController {
	
	//@Autowired
	//private ReservationService reservationService;
	
	@RequestMapping(value="/reserveCalendar")
	public String reserveCalendar(Model model) {
		// JAVA 8 이후 나온 달력 쓰는 클래스
		LocalDate localDate = LocalDate.now();
		YearMonth yearMonth = YearMonth.now();
		int year = localDate.getYear();
		int month = localDate.getMonth().getValue();
		int monthEnd = yearMonth.atEndOfMonth().getDayOfMonth();
		int monthFirst = yearMonth.atDay(1).getDayOfWeek().getValue();
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("monthEnd", monthEnd);
		model.addAttribute("monthFirst", monthFirst);
		
		return "client/reserve/reserveCalendar";
	}
}