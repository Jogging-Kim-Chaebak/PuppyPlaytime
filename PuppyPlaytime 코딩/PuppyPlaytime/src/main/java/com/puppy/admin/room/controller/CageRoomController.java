package com.puppy.admin.room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.puppy.admin.extraservice.service.ExtraServiceService;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.admin.room.service.CageRoomService;
import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.file.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin/room")
public class CageRoomController {
	private static final String CONTEXT_PATH = "admin/room";
	
	private HttpSession session; // 세션 선언
	private String userId; // 체크할 아이디 선언

	private static final Logger logger = LoggerFactory.getLogger(CageRoomController.class);

	//private static final String UPLOAD_PATH = "\\resources\\images";

	@Autowired
	private CageRoomService cageRoomService;
	
	@Autowired
	private ExtraServiceService extraServiceService;

	@RequestMapping("/roomList") // 케이지 리스트
	public ModelAndView roomList(@ModelAttribute CageRoomVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		List<CageRoomVO> list = cageRoomService.roomList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("roomList", list);
		mav.setViewName(CONTEXT_PATH + "/cageRoomList");

		return mav;
	}

	@RequestMapping("/roomDetail") // 케이지 상세 정보
	public ModelAndView roomDetail(@RequestParam("c_no") String no,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		ModelAndView mav = new ModelAndView();
		CageRoomVO rvo = cageRoomService.roomDetail(Integer.parseInt(no));
		List<ExtraServiceVO> list = extraServiceService.extraServiceDetail2(Integer.parseInt(no));
		
		/*
		 * String ck ="check"; if(list==null) { ck=null; }
		 */
		
		mav.addObject("cageRoomVO", rvo);
		/* mav.addObject("check",ck); */
		mav.addObject("extraServiceList", list);
		logger.info(rvo.getC_picture());
		mav.setViewName(CONTEXT_PATH + "/cageRoomDetail");
		return mav;
	}
	

	@RequestMapping(value = "/roomAdd", method = RequestMethod.POST) // 케이지 등록
	public String roomAdd(CageRoomVO cvo,ExtraServiceVO svo,@RequestPart(value = "file") MultipartFile file,
			Model model, HttpServletRequest request, HttpServletResponse response)throws Exception, IllegalStateException, IOException {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";

		String c_file = FileUploadUtil.fileUpload(file, request, "roomImages");
		cvo.setC_picture(c_file);
		
		int result = cageRoomService.roomAdd(cvo);
		int c_no = cvo.getC_no();
		svo.setC_no(c_no);
		
		String[] s_no = request.getParameterValues("sno");
		if(s_no!=null) {
			for(String str : s_no) {
				System.out.println(str);
				svo.setS_no(Integer.parseInt(str));
				svo.setS_explain("임시");
				svo.setS_name("임시");
				svo.setS_price(Integer.parseInt(str));
				svo.setS_status("임시");
				System.out.println(svo.getS_no());
				extraServiceService.extraServiceAdd2(svo);
			}
		}
		
		

		ModelAndView mav = new ModelAndView();

		if (result > 0) {
			resultStr = "케이지 등록이 완료되었습니다.";
		} else {
			resultStr = "케이지 등록이 문제가 있어 완료하지 못하였습니다.";
		}
		mav.addObject("file", cvo.getC_picture());
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/cageRoomList");
		
		return "redirect:/admin/room/roomList";
	}

	@RequestMapping("/roomDisabled") // 케이지 비활성화
	public String roomDisabled(@ModelAttribute CageRoomVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		String resultStr = "";
		int result = cageRoomService.roomDisabled(param);

		if (result > 0) {
			resultStr = "케이지 비활성화가 완료되었습니다.";
		} else {
			resultStr = "케이지 비활성화가 문제가 있어 완료하지 못하였습니다.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH + "/cageRoomList");

		return "redirect:/admin/room/roomList";
	}

	/*
	 * @RequestMapping("/writeForm") public String writeForm() { return
	 * "admin/room/cageRoomAdd"; }
	 */
	
	@RequestMapping(value = "/writeForm") // 부가서비스 리스트
	public ModelAndView writeForm(@ModelAttribute ExtraServiceVO param,Model model, HttpServletRequest request, HttpServletResponse response)throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		List<ExtraServiceVO> list = extraServiceService.extraServiceList(param);

		ModelAndView mav = new ModelAndView();
		mav.addObject("extraServiceList", list);
		mav.setViewName(CONTEXT_PATH + "/cageRoomAdd");

		return mav;
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
