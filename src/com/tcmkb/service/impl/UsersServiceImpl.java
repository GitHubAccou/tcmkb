package com.tcmkb.service.impl;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tcmkb.dao.UsersDao;
import com.tcmkb.service.UsersService;
public class UsersServiceImpl implements UsersService{
	private UsersDao usersDao;
	public UsersDao getUsersDao() {
		return usersDao;
	}
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	@Override
	public Map<String, Object> getUserById(String username) {
		
		return usersDao.getUserById(username);
	}
	@Override
	public void update(Map<String, Object> params) {
		usersDao.update(params);
		
	}
	@Override
	public void lockUsers(Map<String, Object> params) {
		usersDao.lockUsers(params);
	}
	@Override
	public void unLockUsers(Map<String, Object> params) {
		usersDao.unLockUsers(params);
	}
	@Override
	public void addUser(Map<String, Object> params) {
		usersDao.addUser(params);
	}
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return usersDao.ajaxListAll(params);
	}
	@Override
	public long ajaxListAllTotal(Map<String, Object> params) {
		return usersDao.ajaxListAllTotal(params);
	}

}