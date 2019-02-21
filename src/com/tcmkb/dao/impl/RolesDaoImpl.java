package com.tcmkb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.RolesDao;

public class RolesDaoImpl extends BaseDao implements RolesDao {

	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String,Object> params) {
		return this.query("roles.ajaxListAll", params);
	}

	@Override
	public List<Map<String,Object>> ajaxAvailableUsersByRole(Long roleId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleId", roleId);
		return this.query("roles.ajaxAvailableUsersByRole", params);
	}

	@Override
	public List<Map<String,Object>> ajaxAvailableUsers() {
		Map<String,Object> params=new HashMap<String,Object>();
		return this.query("roles.ajaxAvailableUsers", params);
	}

	@Override
	public List<Map<String, Object>> selectUsersByRoleId(String roleId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleId", roleId);
		return this.query("roles.selectUsersByRoleId", params);
	}

	@Override
	public int add(Map<String, Object> row) {
		return this.getSqlSession().insert("roles.add", row);
	}

	@Override
	public void del(Map<String, Object> params) {
		this.deleteRow("roles.del", params);
	}

	@Override
	public Map<String, Object> getRoleByUserId(Map<String, Object> params) {
		return (Map<String, Object>) this.queryOne("roles.getRoleByUserId", params);
	}

	@Override
	public void update(Map<String, Object> params) {
		this.updateRow("roles.update", params);
	}


	@Override
	public Map<String, Object> AjaxListAllTotal(Map<String, Object> params) {
		return (Map<String, Object>) this.queryOne("roles.ajaxListAllTotal", params);
	}

}
