package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.RoleAndMenuDao;
import com.tcmkb.service.RoleAndMenuService;

public class RoleAndMenuServiceImpl implements RoleAndMenuService {
	private RoleAndMenuDao roleAndMenuDao;
	@Override
	public List<Map<String, Object>> listAll() {
		
		return roleAndMenuDao.listAll();
	}
	@Override
	public List<Map<String, Object>> roleRightList(String roleId) {
		return roleAndMenuDao.roleRightList(roleId);
	}
	public RoleAndMenuDao getRoleAndMenuDao() {
		return roleAndMenuDao;
	}
	public void setRoleAndMenuDao(RoleAndMenuDao roleAndMenuDao) {
		this.roleAndMenuDao = roleAndMenuDao;
	}
	@Override
	public List<Map<String, Object>> ajaxAllRoleForSelect() {
		
		return roleAndMenuDao.ajaxAllRoleForSelect();
	}
	@Override
	public void deleteAllRightsByRole(String roleId) {
		roleAndMenuDao.deleteAllRightsByRole(roleId);
		
	}
	@Override
	public void addRightToRole(Map<String,Object> row) {
		roleAndMenuDao.addRightToRole(row);
		
	}
	@Override
	public List<Map<String, Object>> listByRole(String roleId) {
		return roleAndMenuDao.listByRole(roleId);
	}
	@Override
	public void delete(Map<String, Object> params) {
		roleAndMenuDao.delete(params);
		
	}
}
