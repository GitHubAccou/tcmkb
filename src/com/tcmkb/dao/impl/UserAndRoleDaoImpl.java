package com.tcmkb.dao.impl;

import java.util.HashMap;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.UserAndRoleDao;
import com.tcmkb.service.UserAndRoleService;

public class UserAndRoleDaoImpl extends BaseDao implements UserAndRoleDao {

	@Override
	public void add(Map<String, Object> row) {
		getSqlSession().insert("userAndRole.add", row);
	}
	@Override
	public Map<String, Object> getRoleByUserId(String userId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("userId", userId);
		return (Map<String, Object>) this.queryOne("userAndRole.getRoleByUserId", params);
	}
	@Override
	public void del(Map<String, Object> row) {
		 this.deleteRow("userAndRole.delete", row);
	} 
}
