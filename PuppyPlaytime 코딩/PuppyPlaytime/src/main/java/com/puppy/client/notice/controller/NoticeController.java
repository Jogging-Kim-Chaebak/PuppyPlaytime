package com.puppy.client.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.puppy.client.notice.service.NoticeService;
import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.common.vo.PageRequest;
import com.puppy.common.vo.Pagination;

@Controller
@RequestMapping(value="/client/notice")
public class NoticeController {
	private Logger log = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	//글목록 구현하기
	/*
	 * @RequestMapping(value="/noticeList", method=RequestMethod.GET) public String
	 * noticeList(Model model) { log.info("사용자페이지 noticeList 호출 성공");
	 * 
	 * List<NoticeVO> noticeList = null; try { noticeList =
	 * noticeService.noticeList(); } catch (Exception e) {
	 * 
	 * e.printStackTrace(); } model.addAttribute("noticeList",noticeList);
	 * model.addAttribute("data");
	 * 
	 * return "client/notice/noticeList"; }
	 */
	
	
	//글 상세보기 구현
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeDetail 호출 성공");
		log.info("n_no = " + nvo.getN_no());
		
		NoticeVO detail = new NoticeVO();
		try {
			detail = noticeService.noticeDetail(nvo);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n","<br>"));
		}
		
		model.addAttribute("detail",detail);
		return "client/notice/noticeDetail";
	}
	//페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다
	@RequestMapping(value="/noticeList", method = RequestMethod.GET)
	public void noticeList(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) 
throws Exception{
		
		//뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("noticeList",noticeService.noticeList(pageRequest));
		
		//페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);
		pagination.setTotalCount(noticeService.count());
		model.addAttribute("pagination", pagination);
	}
	
	
	
}
