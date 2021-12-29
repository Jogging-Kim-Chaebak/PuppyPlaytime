package com.puppy.client.guide.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.extraservice.service.ExtraServiceService;
import com.puppy.admin.room.controller.CageRoomController;
import com.puppy.admin.room.service.CageRoomService;
import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.guide.service.GuideService;
import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.common.vo.ExtraServiceVO;

@Controller
@RequestMapping("/client/guide")
public class GuideController {
	private Logger log = LoggerFactory.getLogger(GuideController.class);

	@Autowired
	private CageRoomService cageRoomService;

	

		private static final String CONTEXT_PATH = "/client/guide";

		private static final Logger logger = LoggerFactory.getLogger(CageRoomController.class);

		//private static final String UPLOAD_PATH = "\\resources\\images";

		@Autowired
		private GuideService guideRoomSevice;
		
		@Autowired
		private ExtraServiceService extraServiceService;
		/****************************************************************
		 * 룸 리스트 구현하기
		 *
		 ****************************************************************/
		@RequestMapping("/guideList") // 케이지 리스트
		public ModelAndView roomList(CageRoomVO param) throws Exception {

			List<CageRoomVO> list = guideRoomSevice.roomList(param);

			ModelAndView mav = new ModelAndView();
			mav.addObject("roomList", list);
			mav.setViewName(CONTEXT_PATH + "/guideList");

			return mav;
		}
		
		/****************************************************************
		 * 룸 상세페이지 구현하기
		 * @throws Exception 
		 *
		 ****************************************************************/
		
		  @RequestMapping("/roomDetail") // 케이지 상세 정보 
		  public ModelAndView roomDetail(@RequestParam("c_no") String no) throws Exception {
		  log.info("c_num=" + no);
		  ModelAndView mav = new ModelAndView();
		  CageRoomVO rvo = guideRoomSevice.roomDetail(Integer.parseInt(no));
		  
		  mav.addObject("roomData", rvo); 
		  mav.setViewName(CONTEXT_PATH +"/guideDetail"); 
		  
		  return mav; 
		  
		  }
		 
		
		
	/****************************************************************
	 * 부가서비스 리스트 구현하기
	 *
	 ***************************************************************/
   @RequestMapping(value="/guideExtraList", method = RequestMethod.GET) 
   public String GuideExtraList(Model model) throws Exception{
																		  
	   List<ExtraServiceVO> exList =
			   guideRoomSevice.extraServiceList();
	   model.addAttribute("exList",exList);
	   model.addAttribute("exData");
																		  
	   return "client/guide/guideList";
																		  
   }
    /****************************************************************
	 * 시설안내 페이지
	 *
	 ****************************************************************/															 
   @RequestMapping(value="/guideInfo", method = RequestMethod.GET) 
   public String guideInfo() throws Exception{
																		 																  
	   return "client/guide/guideInfo";
																		  
   }
}
