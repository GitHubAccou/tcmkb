package com.tcmkb.service.impl;

import java.util.Map;

import com.tcmkb.dao.UserAndRoleDao;
import com.tcmkb.service.UserAndRoleService;

public class UserAndRoleServiceImpl implements UserAndRoleService {
	private UserAndRoleDao userAndRoleDao;
	@Override
	public void add(Map<String, Object> row) {
		userAndRoleDao.add(row);
	}
	public UserAndRoleDao getUserAndRoleDao() {
		return userAndRoleDao;
	}
	public void setUserAndRoleDao(UserAndRoleDao userAndRoleDao) {
		this.userAndRoleDao = userAndRoleDao;
	}
	@Override
	public Map<String, Object> getRoleByUserId(String userId) {
		return userAndRoleDao.getRoleByUserId(userId);
	}
	@Override
	public void del(Map<String, Object> row) {
		 userAndRoleDao.del(row);
	}
}
