package com.puppy.admin.statistics.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.statistics.service.StatisticsService;
import com.puppy.common.graph.ChartMake;

@Controller
@RequestMapping(value ="/admin/statistics")
public class StatisticsController {
	
	private static final String CONTEXT_PATH = "admin/statistics";
	
	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping("/adminJoinStatistics")
	public ModelAndView adminJoinStatistics() {
		List<Map<String, Integer>> listMap = statisticsService.adminJoinStatistics();
		ChartMake.barJoinChart(listMap);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("join",listMap);
		mav.setViewName(CONTEXT_PATH+"/adminJoinStatistics");
		return mav;
	}
	
	@RequestMapping("/adminReservationStatistics")
	public ModelAndView adminReservationStatistics() {
		Map<String, Integer> list = statisticsService.adminReservationStatistics();
		System.out.println("list 키셋" + list.keySet());
		ChartMake.barChart(list, 2);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reservation",list);
		mav.setViewName(CONTEXT_PATH+"/adminReservationStatistics");
		return mav;
	}
	
	@RequestMapping("/adminSalesStatistics")
	public ModelAndView adminSalesStatistics() {
		
		Map<String, Integer> list = statisticsService.adminSalesStatistics();
		ChartMake.barChart(list, 1);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sale",list);
		mav.setViewName(CONTEXT_PATH+"/adminSalesStatistics");
		return mav;
	}
	
}
