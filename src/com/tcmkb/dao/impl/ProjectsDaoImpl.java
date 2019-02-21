package com.tcmkb.dao.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.ProjectsDao;

public class ProjectsDaoImpl extends BaseDao implements ProjectsDao {

	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return this.query("projects.ajaxListAll", params);
	}

	@Override
	public void add(Map<String, Object> params) {
		//System.out.println(params);
		this.insert("projects.add", params);
	}

	@Override
	public List<Map<String, Object>> getAvailableProjects(Map<String, Object> params) {
		//System.out.println(params);
		return this.query("projects.getAvailableProjects", params);
	}

	@Override
	public List<Map<String, Object>> approveList(Map<String, Object> params) {
		return this.query("projects.approveList", params);
	}

	@Override
	public long approveListTotal(Map<String, Object> params) {
		
		return (long) ((Map<String,Object>)this.queryOne("projects.approveListTotal", params)).get("cnt");
	}

	@Override
	public long ajaxListAllTotal(Map<String, Object> params) {

		return (long) ((Map<String,Object>)this.queryOne("projects.ajaxListAllTotal", params)).get("cnt");
	}

}
