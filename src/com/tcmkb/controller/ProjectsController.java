package com.tcmkb.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.MsgService;
import com.tcmkb.service.NoticeService;
import com.tcmkb.service.ProjectsService;
import com.tcmkb.service.RoleAndMenuService;
import com.tcmkb.service.RolesService;
import com.tcmkb.service.UserProjectService;
import com.tcmkb.service.UsersService;
import com.tcmkb.utils.KeyGerator;
import com.tcmkb.utils.RequestUtil;
public class ProjectsController extends BaseController{
	private ProjectsService projectsService;
	private UserProjectService userProjectService;
	private UsersService usersService;
	private RolesService rolesService;
	private RoleAndMenuService roleAndMenuService;
	private MsgService msgService;
	private NoticeService noticeService;
	/**
	 * 鍒嗛〉鏌ヨ
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		String userId=(String) request.getSession().getAttribute("username");
		String provinceId=(String) usersService.getUserById(userId).get("provinceId");
		params.put("userId", userId);
		params.put("provinceId", provinceId);
		List<Map<String,Object>> list=projectsService.ajaxListAll(params);
		long total=projectsService.ajaxListAllTotal(params);
		RequestUtil.renderPage(response, list, total);
		return null;
	}
	
	
	/**
	 * 鍙戝竷椤圭洰
	 * @return
	 */
	public ModelAndView publishProject(HttpServletRequest request, HttpServletResponse response) {
		JSONObject result=new JSONObject();
		try {
			Map<String,Object> params=RequestUtil.getParamsFromReqStream(request, true, "fileList", "utf-8");
			Map<String,byte[]> files=(Map<String, byte[]>) params.get("fileList");
			String detach="";
			if(files!=null&&!files.isEmpty()) {
				RequestUtil.upload(files, request.getServletContext().getRealPath("/WEB-INF/upload"));
				Set<String> fileNameSet=files.keySet();
				for(String name:fileNameSet) {
					detach+="``"+name;
				}
			}
			
			String key=KeyGerator.getNextKey("project", 15, true);
			params.put("id", key);
			params.put("status", 1);
			params.put("detach", detach.substring(2));
			projectsService.add(params);
			
			//娣诲姞鍒伴�氱煡琛�
			Map<String,Object> noticeRow=new HashMap<String,Object>();
			noticeRow.put("id", KeyGerator.getNextKey("notice", 15, true));
			noticeRow.put("title", "鏂伴」鐩��"+params.get("name")+"銆嬪彂甯�");
			noticeRow.put("content", "椤圭洰绠�鍗曡鏄�:\n"+params.get("desc"));
			RequestUtil.putCreateUserAndTimeFields(noticeRow, "createUser", "createTime", (String) request.getSession().getAttribute("userId"));
			noticeService.addNotice(noticeRow);
			result.put("success", true);
			result.put("msg", "鍙戝竷鎴愬姛锛�");
		}catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", "鍙戝竷鎴愬姛澶辫触锛�"+e.getCause());
		}
		return null;
	}
	/**
	 * 妫�鏌ユ槸鍚﹀彲浠ョ敵鎶ラ」鐩�
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView chkReport(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=new HashMap<String,Object> ();
		params.put("userId", request.getSession().getAttribute("userId"));
		long cnt=userProjectService.selectUnFinishedCount(params);
		JSONObject result=new JSONObject();
		if(cnt==0) {
			result.put("success", true);
		}else {
			result.put("success", false);
			result.put("msg", "瀛樺湪鏈鎵瑰畬鎴愮殑椤圭洰锛屼笉鑳界敵璇锋柊鐨勯」鐩�");
		}
		try {
			response.getWriter().write(result.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 鑾峰彇鍙互鐢虫姤鐨勯」鐩垪琛ㄧ敓鎴恠elect
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView getAvailableProjects(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=new HashMap<String,Object>();
		String userId=(String) request.getSession().getAttribute("username");
		String provinceId=(String) usersService.getUserById(userId).get("provinceId");
		params.put("provinceId", provinceId);
		List<Map<String,Object>> list=projectsService.getAvailableProjects(params);
		JSONArray json=new JSONArray();
		json.addAll(list);
		try {
			response.getWriter().write(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(params);
		return null;
	}
	/**
	 * 鐢虫姤椤圭洰
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView report(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		params.put("userId", request.getSession().getAttribute("userId"));
		userProjectService.add(params);
		
		return null;
	} 
	/**
	 * 鏌ヨ寰呭鎵圭殑椤圭洰锛氳鍒ゆ柇褰撳墠鐢ㄦ埛鐨勬槸鍚︽槸鏅�氱敤鎴凤紝鏅�氱敤鎴锋病鏈夊鏍告潈闄�
	 * @param request
	 * @return
	 */
	public ModelAndView approveList(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> user=(Map<String, Object>) request.getSession().getAttribute("user");
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		params.put("userId", user.get("id"));
		params.put("provinceId", user.get("provinceId"));
		Map<String,Object> role=rolesService.getRoleByUserId(params);
		if(role==null||role.isEmpty()) {
			return null;
		}
		List<Map<String,Object>>menus=roleAndMenuService.listByRole((String) role.get("roleId"));
		boolean haveRight=false;
		for(Map<String,Object> menu:menus) {
			if(menu.get("path").equals("3-1")) {
				haveRight=true;
				break;
			}
		}
		if(haveRight) {
			List<Map<String,Object>> projectList=projectsService.approveList(params);
			long total=projectsService.approveListTotal(params);
			RequestUtil.renderPage(response, projectList, total);
		}
		return null;
	}
	
	public ModelAndView downNoticeFile(HttpServletRequest request,HttpServletResponse response) {
		String name=(String) RequestUtil.getParamsMap(request, true).get("fn");
		String dirName=request.getContextPath();
		
		File file=new File(dirName,name);
		if(!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}
		System.out.println(file.getAbsolutePath());
		RequestUtil.download(response, file);
		return null;
	} 
	
	public ProjectsService getProjectsService() {
		return projectsService;
	}
	public void setProjectsService(ProjectsService projectsService) {
		this.projectsService = projectsService;
	}
	public UserProjectService getUserProjectService() {
		return userProjectService;
	}
	public void setUserProjectService(UserProjectService userProjectService) {
		this.userProjectService = userProjectService;
	}
	public UsersService getUsersService() {
		return usersService;
	}
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}


	public RolesService getRolesService() {
		return rolesService;
	}


	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}


	public RoleAndMenuService getRoleAndMenuService() {
		return roleAndMenuService;
	}


	public void setRoleAndMenuService(RoleAndMenuService roleAndMenuService) {
		this.roleAndMenuService = roleAndMenuService;
	}


	public MsgService getMsgService() {
		return msgService;
	}


	public void setMsgService(MsgService msgService) {
		this.msgService = msgService;
	}


	public NoticeService getNoticeService() {
		return noticeService;
	}


	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

}
