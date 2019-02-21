package com.tcmkb.service;

import java.util.List;
import java.util.Map;

public interface RolesService {

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

	public List<Map<String, Object>> ajaxAvailableUsersByRole(Long roleId);

	public List<Map<String, Object>> ajaxAvailableUsers();
	
	public List<Map<String, Object>> selectUsersByRoleId(String roleId);

	public int add(Map<String, Object> row);

	public void del(Map<String, Object> params);

	public Map<String, Object> getRoleByUserId(Map<String, Object> params);

	public void update(Map<String, Object> params);

	public long ajaxListAllTotal(Map<String, Object> params);

}
