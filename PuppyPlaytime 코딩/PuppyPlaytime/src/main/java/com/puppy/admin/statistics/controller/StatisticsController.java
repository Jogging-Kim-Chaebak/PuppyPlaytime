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
		List<Map<String, String>> listMap = statisticsService.adminJoinStatistics();
		ChartMake.barJoinChart(listMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/adminJoinStatistics");
		return mav;
	}
	
	@RequestMapping("/adminReservationStatistics")
	public ModelAndView adminReservationStatistics() {
		List<Map<String, String>> listMap = statisticsService.adminReservationStatistics();
		ChartMake.barReservationChart(listMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/adminReservationStatistics");
		return mav;
	}
	
	@RequestMapping("/adminSalesStatistics")
	public ModelAndView adminSalesStatistics() {
		
		List<Map<String, String>> listMap = statisticsService.adminSalesStatistics();
		ChartMake.barSalesChart(listMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/adminSalesStatistics");
		return mav;
	}
	
}
