package com.tcmkb.dao;

import java.util.Map;

public interface UserAndRoleDao {

	public void add(Map<String, Object> row);

	public Map<String, Object> getRoleByUserId(String userId);

	public void del(Map<String, Object> row);
	
}
