package com.tcmkb.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.UsersService;
import com.tcmkb.utils.ImageUtil;
import com.tcmkb.utils.KeyGerator;
import com.tcmkb.utils.RequestUtil;
import com.tcmkb.utils.StringUitl;
public class UsersController extends BaseController{
  private UsersService usersService;

  public ModelAndView testData(HttpServletRequest request,HttpServletResponse response){
    List<Map<String,Object>> data=new ArrayList<Map<String,Object>>();
    for(int i=0;i<10;i++){
      Map<String,Object> map=new HashMap<String, Object>();
      map.put("num", new Random().nextInt(17));
      data.add(map);
    }
    ModelAndView view =new ModelAndView();
    view.setViewName("test");
    view.addObject("data", data);
    return view;
  }
  
  /**
   * 鍒嗛〉鏌ヨ
   * @param request
   * @param response
   * @return
   */
  public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
	  Map<String,Object> params=RequestUtil.getParamsMap(request, true);
	  List<Map<String,Object>> list=usersService.ajaxListAll(params);
	  long total=usersService.ajaxListAllTotal(params);
	  RequestUtil.renderPage(response, list, total);
	  return null;
  }
  /**
   * 鐧婚檰
   * @param request
   * @param response
   * @return
   */
  public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
	  Map<String,Object> result=new HashMap<String,Object>();
	  response.setCharacterEncoding("utf-8");
	  String username=request.getParameter("un");
	  String password=request.getParameter("ps");
	  String qrCode=request.getParameter("qrCode");
	  if(username==null||password==null||qrCode==null||username.trim().length()<1||password.trim().length()<1||qrCode.trim().length()<1) {
		  try {
			response.sendRedirect("pages/login");
		} catch (IOException e) {
			e.printStackTrace();
		}
	  }
	  Map<String,Object> user=usersService.getUserById(username);
	  String msg="";
	  if(user==null) {
		  //涓嶅瓨鍦ㄨ鐢ㄦ埛
		  msg="涓嶅瓨鍦ㄨ鐢ㄦ埛锛�";
		  result.put("ok", false);
		  result.put("msg", msg);
	  }else {
		  String ps=(String) user.get("password");
		  Integer lock=(Integer) user.get("lock");
		  if(StringUitl.md5Ency(password).equalsIgnoreCase(ps)) {
			  String sessionCode=(String) request.getSession().getAttribute("qrCode");
			  if(!sessionCode.trim().equalsIgnoreCase(qrCode.trim())) {
				  msg="楠岃瘉鐮侀敊璇紒";
				  result.put("ok", false);
				  result.put("msg", msg);
			  }else if(lock==1) {
				  //閿佸畾
				  msg="璇ヨ处鍙峰凡缁忚閿佸畾锛�";
				  result.put("ok", false);
				  result.put("msg", msg);
			  }else {
				  //鐧婚檰鎴愬姛
				request.getSession().setAttribute("userId", user.get("id"));
				request.getSession().setAttribute("username", user.get("username"));
				request.getSession().setAttribute("user", user);
				request.setAttribute("username", username);
				AuthenticationToken token=new UsernamePasswordToken(username, StringUitl.md5Ency(password));
				Subject subject=SecurityUtils.getSubject();
				subject.login(token);
				
				String url="pages/test.jsp";
				result.put("ok", true);
				  result.put("url", url);
			  }
		  }else{
			  //瀵嗙爜閿欒
			  msg="瀵嗙爜閿欒锛�";
			  result.put("ok", false);
			  result.put("msg", msg);
		  }
	  }
	  response.setStatus(200);
	  try {
		  String str=JSONObject.toJSONString(result);
		  response.getWriter().write(str);
	  } catch (IOException e) {
		  e.printStackTrace();
	  }
	  return null;
  }
  /**
   * 閫�鍑�
   * @param request
   * @param response
   * @return
   */
  public ModelAndView logOut(HttpServletRequest request,HttpServletResponse response) {
	  
	  request.getSession().removeAttribute("user");
	  request.getSession().removeAttribute("userId");
	  request.getSession().removeAttribute("username");
	  try {
		  response.sendRedirect("pages/login.jsp");
	  } catch (IOException e) {
		  e.printStackTrace();
	  }
	  return null;
  }
  /**
   * 淇敼涓汉淇℃伅瑕佺敤鍒扮殑鍘熷鏁版嵁
   * @param request
   * @param response
   * @return
   */
  public ModelAndView infoEdit(HttpServletRequest request,HttpServletResponse response) {
	  String userId=(String) request.getSession().getAttribute("username");
	  Map<String,Object> user=usersService.getUserById(userId);
	  String result=JSONObject.toJSONString(user);
	  try {
		  response.getWriter().write(result);
	  } catch (IOException e) {
		  e.printStackTrace();
	  }
	  return null;
  }
  public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) {
	  String userId=(String) request.getSession().getAttribute("userId");
	  Map<String,Object> params=new HashMap<String,Object>();
	  params.put("id", userId);
	  String password=request.getParameter("newPassword");
	  if(password!=null&&password.trim().length()>0) {
		  params.put("password", StringUitl.md5Ency(password));
	  }
	  String phone=request.getParameter("phone");
	  if(phone!=null&&phone.trim().length()>0) {
		  params.put("phone", phone);
	  }
	  String email=request.getParameter("email");
	  if(email!=null&&email.trim().length()>0) {
		  params.put("email",email);
	  }
	  String provinceId=request.getParameter("provinceId");
	  if(provinceId!=null&&provinceId.trim().length()>0) {
		  params.put("provinceId",provinceId);
	  }
	  usersService.update(params);
	  
	  
	  return null;
  }
  
  /**
   * 鐢熸垚楠岃瘉鐮�
   * @param request
   * @param response
   * @return
   */
  public ModelAndView genIndenC(HttpServletRequest request,HttpServletResponse response) {
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	  String iden=sdf.format(new Date());
	  File file=new File("E:\\index"+iden+".png");
	  String code=ImageUtil.makeImage(file);
	  String dataURL=ImageUtil.imageToDataUrl(file,true);
	  request.getSession().setAttribute("qrCode", code);
	  System.out.println(code);
	  try {
		response.getWriter().write(dataURL);
	} catch (IOException e) {
		e.printStackTrace();
	}
	  return null;
  }
  /**
   * 閿佸畾鐢ㄦ埛
   * @param request
   * @param response
   * @return
   */
  public ModelAndView lock(HttpServletRequest request,HttpServletResponse response) {
	  String userIds=request.getParameter("userIds");
	  if(userIds!=null&&userIds.trim().length()>0) {
		  String ids[]=userIds.split(";");
		  Set<String> set=new HashSet<String>();
		  for(int i=0;i<ids.length;i++) {
			  if(ids[i]!=null&&ids[i].trim().length()>0) {
				  set.add(ids[i]);
			  }
		  }
		  Map<String,Object> params=new HashMap<String,Object>();
		  params.put("userIds", set);
		  usersService.lockUsers(params);
	  }
	  return null;
  }
  /**
   * 瑙ｉ攣鐢ㄦ埛
   * @param request
   * @param response
   * @return
   */
  public ModelAndView unLock(HttpServletRequest request,HttpServletResponse response) {
	  String userIds=request.getParameter("userIds");
	  if(userIds!=null&&userIds.trim().length()>0) {
		  String ids[]=userIds.split(";");
		  Set<String> set=new HashSet<String>();
		  for(int i=0;i<ids.length;i++) {
			  if(ids[i]!=null&&ids[i].trim().length()>0) {
				  set.add(ids[i]);
			  }
		  }
		  Map<String,Object> params=new HashMap<String,Object>();
		  params.put("userIds", set);
		  usersService.unLockUsers(params);
	  }
	  return null;
  }
  
  public ModelAndView addUser(HttpServletRequest request,HttpServletResponse response) {
	  HttpSession session=request.getSession();
	  String userId=(String) session.getAttribute("userId");
	  Map<String,Object> params= RequestUtil.getParamsMap(request,true);
	  params.put("password", StringUitl.md5Ency(StringUitl.md5Ency((String) params.get("password"))));
	  String id=KeyGerator.getNextKey("users", 15, true);
	  params.put("id", id);
	  RequestUtil.putCreateUserAndTimeFields(params, "createUser", "createTime", userId==null?"":userId.toString());
	  JSONObject json=new JSONObject();
	  try {
		  usersService.addUser(params);
		  json.put("success", "1");
		  json.put("msg", "娉ㄥ唽鎴愬姛锛�");
	  }catch(Exception e) {
		  e.printStackTrace();
		  json.put("success", "0");
		  json.put("msg", "娉ㄥ唽澶辫触锛�");
	  }
	  try {
			response.getWriter().write(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	  return null;
  }
  
  public UsersService getUsersService() {
    return usersService;
  }

  public void setUsersService(UsersService usersService) {
    this.usersService = usersService;
  }
}