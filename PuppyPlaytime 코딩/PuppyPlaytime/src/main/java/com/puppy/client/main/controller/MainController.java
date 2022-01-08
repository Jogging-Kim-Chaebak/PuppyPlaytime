package com.puppy.client.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.main.service.MainService;
import com.puppy.client.notice.vo.NoticeVO;

@Controller
public class MainController {
	private HttpSession session;
	private String userId;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) throws Exception{
		session = request.getSession();
	    userId = (String) session.getAttribute("user_id");
	    
	    if(userId != null){
	    	model.addAttribute("userId", userId);
	    }
	    
	    // 최신 공지사항 띄워주기
	    List<NoticeVO> noticeList =  mainService.showRecentNotice();
	    if(noticeList.size() >= 2) {
		    model.addAttribute("notice1", noticeList.get(0));
		    model.addAttribute("notice2", noticeList.get(1));
	    }else {
	    	model.addAttribute("notice1", null);
		    model.addAttribute("notice2", null);
	    }
	    
	    // 방 사진 띄워주기
	    List<CageRoomVO> cageRoomList = mainService.showCageRooms();
	    
	    if(cageRoomList.size() >= 2) {
	    	double randomValue = Math.random();
		    int cageroomNum1 = (int)(randomValue * cageRoomList.size());
		    randomValue = Math.random();
		    int cageroomNum2 = (int)(randomValue * cageRoomList.size());
		    
		    model.addAttribute("cageroom1", cageRoomList.get(cageroomNum1));
		    model.addAttribute("cageroom2", cageRoomList.get(cageroomNum2));
	    }else {
	    	model.addAttribute("cageroom1", null);
		    model.addAttribute("cageroom2", null);
	    }
	   
		return "home";
	}
}
