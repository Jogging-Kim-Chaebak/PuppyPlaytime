package com.puppy.client.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private HttpSession session;
	private String userId;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {	
		session = request.getSession();
	    userId = (String) session.getAttribute("user_id");
	    
	    if(userId != null){
	    	model.addAttribute("userId", userId);
	    }
	    
		return "home";
	}
}
