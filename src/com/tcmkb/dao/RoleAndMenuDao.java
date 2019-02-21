package com.tcmkb.dao;

import java.util.List;
import java.util.Map;

public interface RoleAndMenuDao {
	public List<Map<String,Object>> listAll();

	public List<Map<String, Object>> roleRightList(String roleId);

	public List<Map<String, Object>> ajaxAllRoleForSelect();

	public void deleteAllRightsByRole(String roleId);

	public void addRightToRole(Map<String, Object> row);

	public List<Map<String, Object>> listByRole(String roleId);

	public void delete(Map<String, Object> params);
}
