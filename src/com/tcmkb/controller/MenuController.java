package com.tcmkb.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.MenuService;
import com.tcmkb.service.RoleAndMenuService;
import com.tcmkb.service.UserAndRoleService;
import com.tcmkb.utils.MenuUtil;
import com.tcmkb.utils.RequestUtil;
public class MenuController extends BaseController{
	private MenuService menuService;
	private RoleAndMenuService roleAndMenuService;
	private UserAndRoleService userAndRoleService;
	public ModelAndView ListMenuByRole(HttpServletRequest request,HttpServletResponse
			 response) {
//		SecurityUtils.getSubject().checkPermission("menu:*");
		String userId=(String) request.getSession().getAttribute("userId");
		String roleId=(String) userAndRoleService.getRoleByUserId(userId).get("roleId");
		List<Map<String,Object>> list=roleAndMenuService.listByRole(roleId);
//		list=MenuUtil.render(list);
//		list=RequestUtil.removeUnUseableFields(list,"children","path","html");
		//System.out.println(list.toString());
		JSONArray jsonArray = MenuUtil.getChildrenStyleMenuJSON(list, "path", "-", "children");
		MenuUtil.render(jsonArray, "children");
		try {
			response.getWriter().write(jsonArray.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		List<Map<String,Object>> menuList=menuService.ajaxListAll(params);
		for(Map<String,Object> menuMap:menuList) {
			menuMap.put("parentPath", MenuUtil.getParent((String) menuMap.get("path")));
		}
		long total=menuService.ajaxListTotal(params);
		RequestUtil.renderPage(response, menuList, total);
		return null;
	}
	
	public ModelAndView ajaxAvailableParentNodes(HttpServletRequest request,HttpServletResponse response) {
		List<Map<String,Object>> parentNodes=menuService.ajaxAvailableParentNodes();
		JSONArray array=new JSONArray();
		array.addAll(parentNodes);
		try {
			response.getWriter().write(array.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response) {
		String currentUserId=(String) request.getSession().getAttribute("userId");
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		String parentPath=(String) params.get("parentPath");
		List<Map<String,Object>> usedPaths=menuService.getUsedPaths(parentPath);
		Set<String> usedPathsSet=new HashSet<String>();
		for(Map<String,Object> map:usedPaths) {
			usedPathsSet.add((String) map.get("path"));
		}
		String path=MenuUtil.nextAvailablePath(parentPath, usedPathsSet);
		params.put("path", path);
		params=RequestUtil.putCreateUserAndTimeFields(params, "createUser", "createTime", currentUserId);
		menuService.add(params);
		return null;
	}
	
	public ModelAndView edit(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		String currentUserId=(String) request.getSession().getAttribute("userId");
		if(params.containsKey("path")) {
			RequestUtil.putUpdateUserAndTimeFields(params, "updateUser", "updateTime", currentUserId);
			menuService.update(params);
		}
		return null;
	}
	
	public ModelAndView del(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		if(params.containsKey("paths")) {
			String paths=(String) params.get("paths");
			String pathArr[]=paths.split(";");
			params.put("paths", pathArr);
			menuService.del(params);
			params.clear();
			params.put("menuIds", pathArr);
			roleAndMenuService.delete(params);
		}
		try {
			response.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public RoleAndMenuService getRoleAndMenuService() {
		return roleAndMenuService;
	}
	public void setRoleAndMenuService(RoleAndMenuService roleAndMenuService) {
		this.roleAndMenuService = roleAndMenuService;
	}
	public UserAndRoleService getUserAndRoleService() {
		return userAndRoleService;
	}
	public void setUserAndRoleService(UserAndRoleService userAndRoleService) {
		this.userAndRoleService = userAndRoleService;
	}
}
