package com.puppy.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.support.RequestDataValueProcessor;

public class CSRFRequestDataValueProcessor  implements RequestDataValueProcessor{

	@Override
	public Map<String, String> getExtraHiddenFields(HttpServletRequest request) {
		 Map<String,String> hiddenFields = new HashMap<String,String>();
	     hiddenFields.put(CSRFTokenManager.CSRF_PARAM_NAME, 
	             CSRFTokenManager.getTokenForSession(request.getSession()));
	     System.out.println("CSRFRequestDataValueProcessor");
	     return hiddenFields;
	}

	public String processAction(HttpServletRequest arg0, String arg1) {

		return arg1;
	}

	@Override
	public String processFormFieldValue(HttpServletRequest arg0, String arg1,
			String arg2, String arg3) {

		return arg2;
	}

	@Override
	public String processUrl(HttpServletRequest arg0, String arg1) {

		return arg1;
	}

	@Override
	public String processAction(HttpServletRequest request, String action, String httpMethod) {

		return null;
	}
   
}
