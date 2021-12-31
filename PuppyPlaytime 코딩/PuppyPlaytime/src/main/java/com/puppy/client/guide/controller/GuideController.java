package com.puppy.client.guide.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.extraservice.service.ExtraServiceService;
import com.puppy.admin.room.controller.CageRoomController;
import com.puppy.admin.room.service.CageRoomService;
import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.ExtraServiceVO;

@Controller
@RequestMapping("/client/guide")
public class GuideController {
	private Logger log = LoggerFactory.getLogger(GuideController.class);

	@Autowired
	private CageRoomService cageRoomService;

	@Autowired
	private ExtraServiceService extraServiceService;
	

	

		private static final String CONTEXT_PATH = "/client/guide";

		private static final Logger logger = LoggerFactory.getLogger(CageRoomController.class);

		//private static final String UPLOAD_PATH = "\\resources\\images";

		
		
		
		/****************************************************************
		 * 룸 리스트 구현하기
		 *
		 ****************************************************************/
		@RequestMapping("/guideRoomList") // 케이지 리스트
		public ModelAndView roomList(CageRoomVO param) throws Exception {

			List<CageRoomVO> list = cageRoomService.roomList(param);

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
		  CageRoomVO rvo = cageRoomService.roomDetail(Integer.parseInt(no));
		  
		  mav.addObject("roomData", rvo); 
		  mav.setViewName(CONTEXT_PATH +"/guideDetail"); 
		  
		  return mav; 
		  
		  }
		 
		
		
	/****************************************************************
	 * 부가서비스 리스트 구현하기
	 *
	 ***************************************************************/
	@RequestMapping("/guideExtraList") // 부가서비스 리스트
	public ModelAndView extraServiceList(@ModelAttribute ExtraServiceVO param) {

		List<ExtraServiceVO> list = extraServiceService.extraServiceList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("exData", list);
		mav.setViewName(CONTEXT_PATH + "/guideList");

		return mav;
	}
	
	
    /****************************************************************
	 * 시설안내 페이지
	 *
	 ****************************************************************/															 
   @RequestMapping(value="/guideInfo", method = RequestMethod.GET) 
   public String guideInfo() throws Exception{
																		 																  
	   return "client/guide/guideInfo";
																		  
   }
   
   /****************************************************************
	 * 룸 리스트와 부가서비스 리스트 jsp로 전송
	 *
	 ****************************************************************/	
   @RequestMapping(value="/guideList")
   public ModelAndView view(CageRoomVO param1,@ModelAttribute ExtraServiceVO param2) {
	   ModelAndView mav = new ModelAndView();
	   //데이터만 설정이 가능
	   
	    List<CageRoomVO> rlist = cageRoomService.roomList(param1);

		List<ExtraServiceVO> elist = extraServiceService.extraServiceList(param2);

		mav.addObject("roomList", rlist);
		mav.addObject("exData", elist);
	    
	    mav.setViewName(CONTEXT_PATH + "/guideList");
	   
	   return mav;
	   
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
}