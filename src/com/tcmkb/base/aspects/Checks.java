package com.tcmkb.base.aspects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Checks {
	
	public void checkPermission(JoinPoint  joinPoint) {
		System.out.println("\n##############@@@@@@@@@@@@@@@@@@>before<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");
		System.out.println(joinPoint.getTarget().getClass().getName());
		MethodSignature methodSignature= (MethodSignature) joinPoint.getSignature();
		System.out.println(methodSignature.getClass());
		System.out.println(methodSignature.getDeclaringTypeName());
		System.out.println(methodSignature.getMethod().getName());
	}
	
	public void  before1() {
		 System.out.println("\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@>before<@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");
	}
	
  public Object loginCheck(ProceedingJoinPoint joinPoint){
    System.out.println("checks;");
    Object args[]=joinPoint.getArgs();
    for(Object a:args){
      System.out.println(a.getClass());
    }
    try {
      return joinPoint.proceed();
    } catch (Throwable e) {
      e.printStackTrace();
    }
    return null;
  }

}
