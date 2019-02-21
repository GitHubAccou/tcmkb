package com.tcmkb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.RoleAndMenuService;
import com.tcmkb.service.RolesService;
import com.tcmkb.service.UserAndRoleService;
import com.tcmkb.utils.KeyGerator;
import com.tcmkb.utils.RequestUtil;
public class RolesController extends BaseController{
	private RolesService rolesService;
	private UserAndRoleService userAndRoleService;
	private RoleAndMenuService roleAndMenuService;
	
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		List<Map<String,Object>> list=rolesService.ajaxListAll(params);
		long total=rolesService.ajaxListAllTotal(params);
		RequestUtil.renderPage(response, list, total);
		return null;
	}
	
	public ModelAndView ajaxAvailableUsersByRole(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		List <Map<String,Object>> list=null;
		list=rolesService.ajaxAvailableUsers();
		list=RequestUtil.removeUnUseableFields(list, "id","username");
		if(params.containsKey("roleId")) {
			String roleId= (String) params.get("roleId");
			List<Map<String,Object>> roleUsers=rolesService.selectUsersByRoleId(roleId);
			RequestUtil.removeUnUseableFields(roleUsers, "id","username");
			for(Map<String,Object> map:roleUsers) {
				map.put("checked", "checked");
			}
			list.addAll(roleUsers);
		}
		JSONArray array=new JSONArray();
		array.addAll(list);
		try {
			response.getWriter().write(JSONArray.toJSONString(array));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> row=RequestUtil.getParamsMap(request, true);
		String userId=(String)request.getSession().getAttribute("userId");
		row=RequestUtil.putCreateUserAndTimeFields(row, "createUser", "createTime", userId.toString());
		String roleId=KeyGerator.getNextKey("role", 15, true);
		row.put("id", roleId);
		rolesService.add(row);
		row.put("roleId", roleId);
		if(row.containsKey("userIds")) {
			String userIds=(String) row.get("userIds");
			String ids[]=userIds.split(";");
			for(String id:ids) {
				row.put("userId", id);
				userAndRoleService.add(row);
			}
		}
		
		try {
			response.getWriter().write("ok");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView del(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		if(params.containsKey("ids")) {
			String idsStr=(String) params.get("ids");
			String[] idsArray=idsStr.split(";");
			params.put("ids", idsArray);
			rolesService.del(params);
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("roleIds", idsArray);
			//鍒犻櫎user_role琛ㄥ叧鑱旀暟鎹�
			userAndRoleService.del(map);
			//鍒犻櫎role_menu琛ㄥ叧鑱旀暟鎹�
			roleAndMenuService.delete(map);
		}
		
		try {
			response.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 淇敼瑙掕壊
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		String currentUserId=(String) request.getSession().getAttribute("userId");
		//鏇存柊瑙掕壊琛�
		RequestUtil.putUpdateUserAndTimeFields(params, "updateUser", "udpateTime", currentUserId);
		rolesService.update(params);
		//鍒犻櫎鐢ㄦ埛瑙掕壊琛ㄦ暟鎹�
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("roleIds", ((String)params.get("id")).split(";"));
		userAndRoleService.del(map);
		//娣诲姞鐢ㄦ埛瑙掕壊琛ㄦ暟鎹�
		String roleId=(String) params.get("id");
	    Map<String,Object> row=new HashMap<String,Object>();
		if(params.containsKey("userIds")) {
			String userIds=(String) params.get("userIds");
			String ids[]=userIds.split(";");
			for(String id:ids) {
				row.put("userId", id);
				row.put("roleId", roleId);
				RequestUtil.putCreateUserAndTimeFields(row, "createUser", "createTime", currentUserId);
				userAndRoleService.add(row);
			}
		}
		return null;
	}
	
	public RolesService getRolesService() {
		return rolesService;
	}

	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}

	public UserAndRoleService getUserAndRoleService() {
		return userAndRoleService;
	}

	public void setUserAndRoleService(UserAndRoleService userAndRoleService) {
		this.userAndRoleService = userAndRoleService;
	}

	public RoleAndMenuService getRoleAndMenuService() {
		return roleAndMenuService;
	}

	public void setRoleAndMenuService(RoleAndMenuService roleAndMenuService) {
		this.roleAndMenuService = roleAndMenuService;
	}
}
