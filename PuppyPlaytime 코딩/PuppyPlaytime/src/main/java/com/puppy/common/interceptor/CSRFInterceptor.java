package com.puppy.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
@Component
public class CSRFInterceptor extends HandlerInterceptorAdapter {
//preHandle() 컨트롤러가 호출되기 전에 실행되는 메서드
 @Override
 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
   Object handler) throws Exception {
  
   System.out.println("CSRFInterceptor");
   if (!request.getMethod().equalsIgnoreCase("POST") ) {
   // Not a POST - allow the request
	   System.out.println("csrf success!");
       return true;
   } else {
       
	   // This is a POST request - need to check the CSRF token
       String sessionToken = CSRFTokenManager.getTokenForSession(request.getSession());
       String requestToken = CSRFTokenManager.getTokenFromRequest(request);
       if (sessionToken.equals(requestToken)) {
         return true;
       } else {
         response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bad or missing CSRF value");
         return false;
      }
   }
 }
}