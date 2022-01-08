package com.puppy.client.inquiry.controller;

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

import com.puppy.client.inquiry.service.InquiryService;
import com.puppy.client.inquiry.vo.InquiryVO;


@Controller
@RequestMapping(value="/client/inquiry")
public class InquiryController {

   private Logger log = LoggerFactory.getLogger(InquiryController.class);
   
   @Autowired
   private InquiryService inquiryService;
   
   private HttpSession session;
   
   private String userId;
   
   
   // 리스트
   @RequestMapping(value="/inquiryList", method=RequestMethod.GET)
   public String inquiryList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
      
      sessionCheck(request, response, "로그인 후 문의게시판 이용해주세요.", model);
      
      log.info("inquiryList 호출 성공");
      if(userId != null) {
         List<InquiryVO> inquiryList = inquiryService.inquiryMyList(userId);
         model.addAttribute("inquiryList", inquiryList);
         model.addAttribute("data");
      }
      
      return "client/inquiry/inquiryList";
   }
   
   // 글쓰기 폼
   @RequestMapping(value="/inquiryWrite")
   public String inquiryWrite(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
      sessionCheck(request, response, "잘못된 접근입니다.", model);
      
      log.info("inquiryList 호출 성공");
      
      return "client/inquiry/inquiryWrite";
   }
   
   // 글쓰기 구현
   @RequestMapping(value="/inquiryInsert", method=RequestMethod.POST)
   public String inquiryInsert(HttpServletRequest request, HttpServletResponse response, @ModelAttribute InquiryVO ivo, Model model) throws Exception{
      sessionCheck(request, response, "잘못된 접근입니다.", model);
      
      log.info("inquiryInsert 호출 성공");
      
      int result = 0;
      String url = "";
      
      ivo.setM_id(userId);
      
      result = inquiryService.inquiryInsert(ivo);
      
      if(result == 1) {
         url = "/client/inquiry/inquiryList";
      } else {
         model.addAttribute("code", 1);
         url = "/client/inquiry/inquiryWrite";
      }
      
      return "redirect:" + url;
   }
   
   // 글 상세보기
   @RequestMapping(value="/inquiryDetail", method=RequestMethod.GET)
   public String inquiryDetail(HttpServletRequest request, HttpServletResponse response, @ModelAttribute InquiryVO ivo, Model model) throws Exception{
      sessionCheck(request, response, "잘못된 접근입니다.", model);
      
      log.info("inquiryDetail 호출 성공");
      log.info("q_no = " + ivo.getQ_no());
      
      InquiryVO detail = new InquiryVO();
      detail = inquiryService.inquiryDetail(ivo);
      
      if(detail != null) {
         detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
         
      }
      
      model.addAttribute("detail", detail);
      return "client/inquiry/inquiryDetail";
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
   
}