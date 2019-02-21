package com.tcmkb.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.RoleAndMenuDao;

public class RoleAndMenuDaoImpl extends BaseDao implements RoleAndMenuDao{

	@Override
	public List<Map<String, Object>> listAll() {
		
		return this.queryWithNoParam("roleAndMenu.listAll");
	}

	@Override
	public List<Map<String, Object>> roleRightList(String roleId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleId", roleId);
		return this.query("roleAndMenu.roleRightList", params);
	}

	@Override
	public List<Map<String, Object>> ajaxAllRoleForSelect() {
		Map<String,Object> params=new HashMap<String,Object>();
		return this.query("roleAndMenu.ajaxAllRoleForSelect", params);
	}

	@Override
	public void deleteAllRightsByRole(String roleId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleId", roleId);
		this.deleteRow("roleAndMenu.deleteRigthByRole", params);
	}

	@Override
	public void addRightToRole(Map<String,Object> row) {
		this.insert("roleAndMenu.addRightToRole", row);
	}

	@Override
	public List<Map<String, Object>> listByRole(String roleId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleId", roleId);
		return this.query("roleAndMenu.listByRole", params);
	}

	@Override
	public void delete(Map<String, Object> params) {
		this.deleteRow("roleAndMenu.delete", params);
	}
}
