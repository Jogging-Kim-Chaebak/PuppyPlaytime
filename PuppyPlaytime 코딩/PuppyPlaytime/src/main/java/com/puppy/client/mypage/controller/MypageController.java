package com.puppy.client.mypage.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.puppy.client.member.vo.MemberVO;
import com.puppy.client.mypage.service.MypageService;
import com.puppy.client.mypage.vo.MypagePagination;
import com.puppy.client.mypage.vo.MypageVO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.file.FileUploadUtil;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.PageRequest;
import com.puppy.common.vo.Pagination;
import com.puppy.common.vo.PetVO;


@Controller
@RequestMapping(value = "/client/mypage")
public class MypageController {
	 
	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageService mypageService;
	
	// JavaMailSender 객체 타입인 mailSender 변수를 선언
		@Autowired
		private JavaMailSender mailSender;
	
	private HttpSession session;
	private String userId;
	
	//펫리스트 구현하기
	@RequestMapping(value="/petList", method=RequestMethod.GET)
	public String petList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		sessionCheck(request, response, "로그인 후 마이페이지를 이용할 수 있습니다.", model);
		
		log.info("petList 호출 성공");
  		log.info("m_id = " + userId);
  		
  		if(userId != null) {
  			List<PetVO> petList = mypageService.petList(userId);
  			model.addAttribute("petList", petList);
  		}
		
		return "client/mypage/mypagePetinfo";
	}
	
	//펫등록 폼 출력하기
	@RequestMapping(value="/insertForm")
	public String insertForm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		log.info("insertForm 호출 성공");
		
		return "client/mypage/mypagePetinfoinsert";
	}
	
	//펫등록 구현하기
	@RequestMapping(value = "/petInsert", method = RequestMethod.POST)
	public String petInsert(@ModelAttribute PetVO pvo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		log.info("petInsert 호출 성공");
		
		log.info("fileName : " + pvo.getFile().getOriginalFilename());
		log.info("p_no : " + pvo.getP_no());
		
		int result = 0;
		String url="";
		
		pvo.setM_id(userId);
		
		if(pvo.getFile()!=null) {
			String p_picture = FileUploadUtil.fileUpload(pvo.getFile(), request, "petImages");
			pvo.setP_picture(p_picture);
		}
		
		result = mypageService.petInsert(pvo);
		if(result==1) {
			url = "/client/mypage/petList";
		}else {
			model.addAttribute("code", 1);
			url = "/client/mypage/insertForm";
		}
				
		return "redirect:"+url;
	}
	
	//펫 상세보기 구현
	@RequestMapping(value="/petDetail", method = RequestMethod.POST)
	public String petDetail(@ModelAttribute PetVO pvo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		log.info("PetDetail 호출 성공");
		
		log.info("p_no = " + pvo.getP_no());
			
		PetVO detail = new PetVO();
		detail = mypageService.petDetail(pvo);
			
		model.addAttribute("detail", detail);
		return "client/mypage/mypagePetinfodetail";
			 
	}
		
	//펫수정 폼 출력하기
	@RequestMapping(value="/updateForm")		
	public String updateForm(@ModelAttribute PetVO pvo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		log.info("updateForm 호출 성공");
		
		log.info("p_no = " + pvo.getP_no());
		
		PetVO updateData=new PetVO();
		updateData=mypageService.petDetail(pvo);
			
		model.addAttribute("updateData", updateData);
		return "client/mypage/mypagePetinfoupdate";
	}
	
	//펫수정 구현하기
	@RequestMapping(value="/petUpdate", method=RequestMethod.POST)
	public String petUpdate(@ModelAttribute PetVO pvo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		sessionCheck(request, response, "잘못된 접근입니다.", model);
		
		log.info("petUpdate 호출 성공");
		
		int result=0;
		String url="";
		String p_picture="";
		
		if(!pvo.getFile().isEmpty()) {
			log.info("============= file = " + pvo.getFile().getOriginalFilename());
			if(!pvo.getP_picture().isEmpty()) {
				FileUploadUtil.fileDelete(pvo.getP_picture(),request,"petImages");
			}
			p_picture=FileUploadUtil.fileUpload(pvo.getFile(), request, "petImages");
			pvo.setP_picture(p_picture);
		}else {
			log.info("첨부파일 없음");
			pvo.setP_picture("");
		}
		
		mypageService.petUpdate(pvo);
		
		return "redirect:/client/mypage/petList";
	}
	
	
	 //펫정보 삭제
    @RequestMapping(value = "/petDelete")
    public String petDelete(@ModelAttribute PetVO pvo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	sessionCheck(request, response, "잘못된 접근입니다.", model);
    	
    	log.info("petDelete 호출 성공");
        
        int result = 0;
        String url = "";
        
        result=mypageService.petDelete(pvo.getP_no());
        
        if(result==1) {
        	url="/client/mypage/petList";
        }else {
        	url="/client/mypage/petDetale?p_no="+pvo.getP_no();
        }
        return "redirect:"+url;
    }
    /*
    //예약리스트 구현하기
    @RequestMapping(value="/reservationList", method=RequestMethod.GET) 
    public String reservationList(Model model, HttpServletRequest request,
    HttpServletResponse response) throws Exception {
    	sessionCheck(request, response, "잘못된 접근입니다.", model);
    	
    	log.info("reservationList 호출 성공"); 
    	
    	log.info("m_id = " + userId); 
		ReservationVO rvo = new ReservationVO();
		rvo.setM_id(userId);
	 
		List<ReservationVO> reservationList = mypageService.reservationList(userId);
		model.addAttribute("reservationList", reservationList);
	 
		return "client/mypage/mypageReservation";
  	}
	 */
    
    //페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다
  	@RequestMapping(value="/mypageReservation", method = RequestMethod.GET)
  	public void mypageReservation(@ModelAttribute("pgrq") MypageVO mvo, Model model) throws Exception{
  		
  		mvo.setM_id(userId);
  		//뷰에 페이징 처리를 한 게시글 목록을 전달한다.
  		model.addAttribute("mypageReservation",mypageService.reservationList(mvo));
  		
  		//페이징 네비게이션 정보를 뷰에 전달한다.
  		MypagePagination mypagepagination = new MypagePagination();
  		mypagepagination.setMypageVO(mvo);
  		mypagepagination.setTotalCount(mypageService.count());
  		model.addAttribute("mypagepagination", mypagepagination);
  	}
    
	//예약 상세보기 구현
		@RequestMapping(value="reservationDetail", method = RequestMethod.POST)
		public String reservationDetail(@ModelAttribute ExtraServiceVO evo, ReservationVO rvo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
			sessionCheck(request, response, "잘못된 접근입니다.", model);
			
			log.info("reservationDetail 호출 성공");
			
			log.info("r_no = " + rvo.getR_no());
			log.info("c_no = " + rvo.getC_no());
				
			ReservationVO detail = new ReservationVO();
			detail = mypageService.reservationDetail(rvo);
						
			int count = 0;
			if(detail.getR_extraService1() != 0) {
				count ++;
			}
			if(detail.getR_extraService2() != 0) {
				count ++;		
			}
			if(detail.getR_extraService3() != 0) {
				count ++;
			}
			if(detail.getR_extraService4() != 0) {
				count ++;
			}
			
			List<String> s_nameList = new ArrayList<String>();
			
			switch(count) {
			case 1:
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService1()));
				break;
			case 2:
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService1()));
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService2()));				
				break;
			case 3:
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService1()));
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService2()));				
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService3()));				
				break;
			case 4:
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService1()));
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService2()));					
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService3()));				
				s_nameList.add(mypageService.reservationExtraservice(detail.getR_extraService4()));				
				break;	
			default:
				break;
			}
			
			model.addAttribute("s_nameList", s_nameList);
			
			model.addAttribute("detail", detail);
			//model.addAttribute("extraDetail", extraDetail);
			return "client/mypage/mypageReservationDetail";
				 
		}
	 
	//예약취소 구현하기
		@RequestMapping(value="/reservationCancel", method=RequestMethod.POST)
		public String reservationCancel(@ModelAttribute ReservationVO rvo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
			sessionCheck(request, response, "잘못된 접근입니다.", model);
			
			log.info("reservationCancel 호출 성공");
			
			
			mypageService.reservationCancel(rvo);
			
			return "redirect:/client/mypage/reservationList";
		}
  	
  	//내정보 구현하기
  	@RequestMapping(value="/myDetail", method = RequestMethod.GET)
  	public String myDetail(@ModelAttribute MemberVO mvo, HttpServletResponse response, Model model, HttpServletRequest request) throws Exception{
  		sessionCheck(request, response, "잘못된 접근입니다.", model);
  		
  		log.info("myDetail 호출 성공");
  		
  		log.info("m_id = " + userId);
  		if(userId != null) {
	  		mvo.setM_id(userId);
	  		session.setAttribute("m_id", userId);
	  		MemberVO detail = new MemberVO();
	  		detail=mypageService.myDetail(mvo);
	  		
	  		model.addAttribute("detail", detail);
		}
  		return "client/mypage/mypageMyinfo";
  			 
  	}
  	
  //내정보 수정 폼 출력하기
  	@RequestMapping(value="/myUpdateForm")		
  	public String myUpdateForm(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
  		sessionCheck(request, response, "잘못된 접근입니다.", model);
  		
  		log.info("myUpdateForm 호출 성공");
  		HttpSession session = request.getSession();
  		String m_id = (String)session.getAttribute("userId");
  		log.info("m_id = " + m_id);	
  		mvo.setM_id(m_id);
  		session.setAttribute("m_id", m_id);
  		
  		MemberVO updateData=new MemberVO();
  		updateData = mypageService.myDetail(mvo);
  			
  		model.addAttribute("updateData", updateData);
  		return "client/mypage/mypageMyinfoupdate";
  	}
  	
  	//내정보 수정 구현하기
  	@RequestMapping(value="/myUpdate", method=RequestMethod.POST)
  	public String myUpdate(@ModelAttribute MemberVO mvo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
  		sessionCheck(request, response, "잘못된 접근입니다.", model);
  		
  		log.info("myUpdate 호출 성공");
  		HttpSession session = request.getSession();
  		String m_id = (String)session.getAttribute("userId");
  		log.info("m_id = " + m_id);	
  		mvo.setM_id(m_id);
  		session.setAttribute("m_id", m_id);
  		
  		mypageService.myUpdate(mvo);
  		
  		return "redirect:/client/mypage/myDetail";
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
	    }else {
	    	model.addAttribute("userId", userId);
	    }
  	}
  	
  	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("이메일 : " + email);

		/* 인증번호(난수) 생성 */
		// 111111 ~ 999999 범위의 숫자를 얻기 위해서 nextInt(888888) + 111111를 사용
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 : " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "PuppyPlaytime<chan978@naver.com>";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}
}
