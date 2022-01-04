package com.puppy.admin.extraservice.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.extraservice.service.ExtraServiceService;
import com.puppy.common.vo.ExtraServiceVO;


@Controller
@RequestMapping(value ="/admin/extraService")
public class ExtraServiceController {
	private static final String CONTEXT_PATH = "admin/extraService";

	@Autowired
	private ExtraServiceService extraServiceService;
	
	private HttpSession session;
	private String userId;

	@RequestMapping("/extraServiceList") // 부가서비스 리스트
	public ModelAndView extraServiceList(@ModelAttribute ExtraServiceVO param , Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		List<ExtraServiceVO> list = extraServiceService.extraServiceList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("extraServiceList", list);
		mav.setViewName(CONTEXT_PATH + "/extraServiceList");

		return mav;
	}

	@RequestMapping("/extraServiceDetail") // 부가서비스 상세 정보
	public ModelAndView extraServiceDetail(@RequestParam("s_no") String no, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		ModelAndView mav = new ModelAndView();
		ExtraServiceVO svo = extraServiceService.extraServiceDetail(Integer.parseInt(no));
		mav.addObject("ExtraServiceVO", svo);
		mav.setViewName(CONTEXT_PATH + "/extraServiceDetail");
		return mav;
	}

	@RequestMapping(value = "/extraServiceAdd", method = RequestMethod.POST) // 부가서비스 등록
	public String extraServiceAdd(@ModelAttribute ExtraServiceVO svo, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";
		
		int result = extraServiceService.extraServiceAdd(svo);
		
		ModelAndView mav = new ModelAndView();

		if (result > 0) {
			resultStr = "부가서비스 등록이 완료되었습니다.";
		} else {
			resultStr = "부가서비스 등록이 문제가 있어 완료하지 못하였습니다.";
		}
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/extraServiceList");
		
		return "redirect:/admin/extraService/extraServiceList";
	}

	@RequestMapping("/extraServiceDisabled") // 케이지 비활성화
	public String extraServiceDisabled(@ModelAttribute ExtraServiceVO svo, Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";
		int result = extraServiceService.extraServiceDisabled(svo);

		if (result > 0) {
			resultStr = "부가서비스 비활성화가 완료되었습니다.";
		} else {
			resultStr = "부가서비스 비활성화가 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/extraServiceList");

		return "redirect:/admin/extraService/extraServiceList";
	}

	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		return "admin/extraService/extraServiceAdd";
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
