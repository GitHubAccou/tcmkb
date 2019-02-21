package com.tcmkb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.RoleAndMenuService;
import com.tcmkb.utils.MenuUtil;
import com.tcmkb.utils.RequestUtil;
public class RoleAndMenuController extends BaseController{
	private RoleAndMenuService roleAndMenuService;
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		List<Map<String,Object>> list=getRoleAndMenuService().listAll();
		  JSONArray jsonArray=new JSONArray();
		  jsonArray.addAll(list);
		  JSONObject jsonObject=new JSONObject();
		  jsonObject.put("rows", jsonArray);
		  jsonObject.put("total", jsonArray.size());
		  try {
			response.getWriter().write(jsonObject.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public ModelAndView roleRightList(HttpServletRequest request,HttpServletResponse response) {
		String roleId=request.getParameter("roleId");
		List<Map<String,Object>> roleMenus=roleAndMenuService.roleRightList(roleId);
		roleMenus=MenuUtil.relations(roleMenus, "path", "checked");
		JSONArray jsonArray=new JSONArray();
		jsonArray.addAll(roleMenus);
		
		try {
			response.getWriter().write(jsonArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView ajaxAllRoleForSelect(HttpServletRequest request,HttpServletResponse response) {
		List<Map<String,Object>> result=roleAndMenuService.ajaxAllRoleForSelect();
		JSONArray jsonArray=new JSONArray();
		jsonArray.addAll(result);
		try {
			response.getWriter().write(jsonArray.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView updateRightByRole(HttpServletRequest request,HttpServletResponse response) {
		String currentUserId=(String) request.getSession().getAttribute("userId");
		String rights=request.getParameter("rights");
		String roleId=request.getParameter("roleId");
		if(rights==null||roleId==null||rights.trim().length()<2||roleId.trim().length()<1) {
			return null;
		}
		rights=rights.trim();
		roleId=roleId.trim();
		JSONArray rightsArray=JSONArray.parseArray(rights);
		if(rights.length()<1) {
			return null;
		}else {
			roleAndMenuService.deleteAllRightsByRole(roleId);
			for(int x=0;x<rightsArray.size();x++) {
				Map<String,Object> row=new HashMap<String,Object>();
				row.put("roleId", roleId);
				row.put("menuId", rightsArray.get(x));
				RequestUtil.putCreateUserAndTimeFields(row, "createUser", "createTime", currentUserId);
				roleAndMenuService.addRightToRole(row);
			}
		}
		
		return null;
	}
	
	public RoleAndMenuService getRoleAndMenuService() {
		return roleAndMenuService;
	}
	public void setRoleAndMenuService(RoleAndMenuService roleAndMenuService) {
		this.roleAndMenuService = roleAndMenuService;
	}
}
