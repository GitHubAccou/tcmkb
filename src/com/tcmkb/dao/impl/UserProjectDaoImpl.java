package com.tcmkb.dao.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.UserProjectDao;

public class UserProjectDaoImpl extends BaseDao implements UserProjectDao {

	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return this.query("userProjects.ajaxListAll", params);
	}

	@Override
	public long selectUnFinishedCount(Map<String, Object> params) {
		System.out.println(params);
		
		return (long) ((Map<String,Object>)this.queryOne("userProjects.selectUnFinishedCount", params)).get("cnt");
	}

	@Override
	public void add(Map<String, Object> params) {
		this.insert("userProjects.add", params);
	}

	@Override
	public Map<String, Object> querySingle(Map<String, Object> params) {
		return (Map<String, Object>) this.queryOne("userProjects.querySingle", params);
	}

	@Override
	public void approve(Map<String, Object> params) {
		this.updateRow("userProjects.approve", params);
	}
	
	@Override
	public List<Map<String, Object>> listAll(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.query("userProjects.listAll", params);
	}
}
