package com.puppy.admin.statistics.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.statistics.service.StatisticsService;
import com.puppy.client.member.vo.MemberVO;

@Controller
@RequestMapping(value ="/admin/statistics")
public class StatisticsController {
	
	private static final String CONTEXT_PATH = "admin/statistics";
	
	@Autowired
	private StatisticsService satisticsService;
	
	@RequestMapping("/adminJoinStatistics")
	public ModelAndView adminJoinStatistics() {
		
		List<Map<String, Integer>> list = satisticsService.adminJoinStatistics();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("join",list);
		mav.setViewName(CONTEXT_PATH+"/adminJoinStatistics");
		return mav;
	}
	
	@RequestMapping("/adminReservationStatistics")
	public ModelAndView adminReservationStatistics() {
		
		List<Map<String, Integer>> list = satisticsService.adminReservationStatistics();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reservation",list);
		mav.setViewName(CONTEXT_PATH+"/adminReservationStatistics");
		return mav;
	}
	
	@RequestMapping("/adminSalesStatistics")
	public ModelAndView adminSalesStatistics() {
		
		List<Map<String, Integer>> list = satisticsService.adminSalesStatistics();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sale",list);
		mav.setViewName(CONTEXT_PATH+"/adminSalesStatistics");
		return mav;
	}
	
}
