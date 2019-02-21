package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.UserProjectDao;
import com.tcmkb.service.UserProjectService;

public class UserProjectServiceImpl implements UserProjectService {
	private UserProjectDao userProjectDao;
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return userProjectDao.ajaxListAll(params);
	}
	public UserProjectDao getUserProjectDao() {
		return userProjectDao;
	}
	public void setUserProjectDao(UserProjectDao userProjectDao) {
		this.userProjectDao = userProjectDao;
	}
	@Override
	public long selectUnFinishedCount(Map<String, Object> params) {
		return userProjectDao.selectUnFinishedCount(params);
	}
	@Override
	public void add(Map<String, Object> params) {
		userProjectDao.add(params);
	}
	@Override
	public Map<String, Object> querySingle(Map<String, Object> params) {
		return userProjectDao.querySingle(params);
	}
	@Override
	public void approve(Map<String, Object> params) {
		userProjectDao.approve(params);
	}
	@Override
	public List<Map<String, Object>> listAll(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return userProjectDao.listAll(params);
	}

}
