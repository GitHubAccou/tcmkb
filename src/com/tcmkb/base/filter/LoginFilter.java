package com.tcmkb.base.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

  @Override
  public void destroy() {
    // TODO Auto-generated method stub
    
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletResponse res=(HttpServletResponse)response;
    res.setCharacterEncoding("utf-8");
    HttpServletRequest req=(HttpServletRequest) request;
    String uri=req.getRequestURI();
    HttpSession session = ((HttpServletRequest)request).getSession(true);
    Object user=session.getAttribute("userId");
    if(user!=null) {
    	//通过
    	chain.doFilter(request, response);
    }else if(uri.equals("/tcmkb/users.php")&&(request.getParameter("go").equals("login")||request.getParameter("go").equals("genIndenC")||request.getParameter("go").equals("addUser"))){
    	chain.doFilter(request, response);
    	//通过
    }else if(uri.equals("/tcmkb/notice.php")){
    	chain.doFilter(request, response);
    	//通过
    }else if(uri.equals("/tcmkb/province.php")&&request.getParameter("go").equals("ajaxList")){
    	chain.doFilter(request, response);
    	//通过
    }else if(uri.equals("/tcmkb/userProjects.php")&&request.getParameter("go").equals("listAll")){
    	chain.doFilter(request, response);
    	//通过
    }else if(uri.equals("/tcmkb/pages/login.jsp")) {
    	chain.doFilter(request, response);
    	//通过
    }else if(uri.equals("/tcmkb/pages/News.jsp")) {
    	chain.doFilter(request, response);
    	//通过
    }else if(uri.equals("/tcmkb/pages/reg.jsp")) {
    	chain.doFilter(request, response);
    	//通过
    }else if(!uri.endsWith(".jsp")&&!uri.endsWith(".php")) {
    	chain.doFilter(request, response);
    	//通过
    }else{
    	((HttpServletResponse)response).sendRedirect(request.getServletContext().getContextPath()+"/pages/login.jsp");
    }

  }

  @Override
  public void init(FilterConfig arg0) throws ServletException {
    
  }

}
