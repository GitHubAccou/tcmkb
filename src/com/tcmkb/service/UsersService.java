package com.tcmkb.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface UsersService{

	public Map<String, Object> getUserById(String username);

	public void update(Map<String, Object> params);

	public void lockUsers(Map<String, Object> params);

	public void unLockUsers(Map<String, Object> params);

	public void addUser(Map<String, Object> params);

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

	public long ajaxListAllTotal(Map<String, Object> params);
}