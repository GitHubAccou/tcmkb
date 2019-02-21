package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.MenuDao;
import com.tcmkb.service.MenuService;

public class MenuServiceImpl implements MenuService {
	private MenuDao menuDao;
	@Override
	public List<Map<String, Object>> listByRole(String roleId) {
		return menuDao.listByRole(roleId);
	}
	public MenuDao getMenuDao() {
		return menuDao;
	}
	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String,Object> params) {
		return menuDao.ajaxListAll(params);
	}
	@Override
	public List<Map<String, Object>> ajaxAvailableParentNodes() {
		return menuDao.ajaxAvailableParentNodes();
	}
	@Override
	public List<Map<String, Object>> getUsedPaths(String parentPath) {
		
		return menuDao.getUsedPaths(parentPath);
	}
	@Override
	public void add(Map<String, Object> params) {
		menuDao.add(params);
	}
	@Override
	public void del(Map<String, Object> params) {
		menuDao.del(params);
	}
	@Override
	public void update(Map<String, Object> params) {
		menuDao.update(params);
	}
	@Override
	public long ajaxListTotal(Map<String, Object> params) {
		return menuDao.ajaxListAllTotal(params);
	}

}
