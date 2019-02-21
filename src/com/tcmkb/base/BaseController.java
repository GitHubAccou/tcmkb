package com.tcmkb.base;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class BaseController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		String mName=arg0.getParameter("go");
		Method method=this.getClass().getMethod(mName, HttpServletRequest.class,HttpServletResponse.class);
		ModelAndView res=(ModelAndView) method.invoke(this, arg0,arg1);
		return res;
	}

}
