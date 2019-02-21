package com.tcmkb.dao.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.UsersDao;
public class UsersDaoImpl extends BaseDao implements UsersDao{

	@Override
	public Map<String, Object> getUserById(String username) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("username", username);
		//System.out.println(params);
		return (Map<String, Object>) queryOne("users.queryById", params);
	}

	@Override
	public void update(Map<String, Object> params) {
		this.updateRow("users.update", params);
	}

	@Override
	public void lockUsers(Map<String, Object> params) {
		this.updateRow("users.lockUsers", params);
	}

	@Override
	public void unLockUsers(Map<String, Object> params) {
		this.updateRow("users.unLockUsers", params);
	}

	@Override
	public void addUser(Map<String, Object> params) {
		this.insert("users.addUser", params);
	}

	@Override
	public long ajaxListAllTotal(Map<String, Object> params) {
		return (long) ((Map<String,Object>)this.queryOne("users.ajaxListAllTotal", params)).get("cnt");
	}

	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return this.query("users.ajaxListAll", params);
	}

	
}