package com.tcmkb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.MenuDao;

public class MenuDaoImpl extends BaseDao implements MenuDao {

	@Override
	public List<Map<String, Object>> listByRole(String roleId) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleId", roleId);
		return query("menu.listByRole", params);
	}

	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String,Object> params) {
		return this.query("menu.ajaxListAll", params);
	}

	@Override
	public List<Map<String, Object>> ajaxAvailableParentNodes() {
		
		return this.queryWithNoParam("menu.ajaxAvailableParentNodes");
	}

	@Override
	public List<Map<String, Object>> getUsedPaths(String parentPath) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("path", parentPath);
		return this.query("menu.getUsedPaths", params);
	}

	@Override
	public void add(Map<String, Object> params) {
		this.insert("menu.add", params);
	}

	@Override
	public void del(Map<String, Object> params) {
		this.deleteRow("menu.del", params);
	}

	@Override
	public void update(Map<String, Object> params) {
		this.updateRow("menu.update", params);
	}

	@Override
	public long ajaxListAllTotal(Map<String, Object> params) {
		return (long) ((Map<String,Object>)this.queryOne("menu.ajaxListAllTotal", params)).get("cnt");
	}

}
