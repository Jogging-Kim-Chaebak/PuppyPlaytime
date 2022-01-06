package com.puppy.admin.statistics.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.statistics.service.StatisticsService;
import com.puppy.common.graph.ChartMake;

@Controller
@RequestMapping(value ="/admin/statistics")
public class StatisticsController {
	
	private static final String CONTEXT_PATH = "admin/statistics";
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언
	
	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping("/adminJoinStatistics")
	public ModelAndView adminJoinStatistics(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model); // 세션체크라는 메서드를 만들어 사용
		List<Map<String, String>> listMap1 = statisticsService.adminJoinStatistics();
		ChartMake.barJoinChart(listMap1);
		List<Map<String, String>> listMap2 = statisticsService.adminReservationStatistics();
		ChartMake.barReservationChart(listMap2);
		List<Map<String, String>> listMap3 = statisticsService.adminSalesStatistics();
		ChartMake.barSalesChart(listMap3);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/adminJoinStatistics");
		return mav;
	}
	
	/*
	 * @RequestMapping("/adminReservationStatistics") public ModelAndView
	 * adminReservationStatistics(Model model, HttpServletRequest request,
	 * HttpServletResponse response)throws Exception { sessionCheck(request,
	 * response, "잘못된 접근입니다.", model); // 세션체크라는 메서드를 만들어 사용 List<Map<String,
	 * String>> listMap2 = statisticsService.adminReservationStatistics();
	 * ChartMake.barReservationChart(listMap2);
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName(CONTEXT_PATH+"/adminReservationStatistics"); return mav; }
	 * 
	 * @RequestMapping("/adminSalesStatistics") public ModelAndView
	 * adminSalesStatistics(Model model, HttpServletRequest request,
	 * HttpServletResponse response)throws Exception { sessionCheck(request,
	 * response, "잘못된 접근입니다.", model); // 세션체크라는 메서드를 만들어 사용 List<Map<String,
	 * String>> listMap3 = statisticsService.adminSalesStatistics();
	 * ChartMake.barSalesChart(listMap3);
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * mav.setViewName(CONTEXT_PATH+"/adminSalesStatistics"); return mav; }
	 */
	
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
