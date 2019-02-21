package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.RolesDao;
import com.tcmkb.service.RolesService;

public class RolesServiceImpl implements RolesService {
	private RolesDao rolesDao;
	public RolesDao getRolesDao() {
		return rolesDao;
	}
	public void setRolesDao(RolesDao rolesDao) {
		this.rolesDao = rolesDao;
	}
	@Override
	public List<Map<String, Object>> ajaxAvailableUsersByRole(Long roleId) {
		return rolesDao.ajaxAvailableUsersByRole(roleId);
	}
	@Override
	public List<Map<String, Object>> ajaxAvailableUsers() {
		return rolesDao.ajaxAvailableUsers();
	}
	@Override
	public List<Map<String, Object>> selectUsersByRoleId(String roleId) {
		return rolesDao.selectUsersByRoleId(roleId);
	}
	@Override
	public int add(Map<String, Object> row) {
		return rolesDao.add(row);
	}
	@Override
	public void del(Map<String, Object> params) {
		rolesDao.del(params);	
	}
	@Override
	public Map<String, Object> getRoleByUserId(Map<String, Object> params) {
		
		return rolesDao.getRoleByUserId(params);
	}
	@Override
	public void update(Map<String, Object> params) {
		rolesDao.update(params);
	}
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		
		return rolesDao.ajaxListAll(params);
	}
	@Override
	public long ajaxListAllTotal(Map<String, Object> params) {
		return (long) ((Map<String,Object>)rolesDao.AjaxListAllTotal(params)).get("cnt");
	}

}
