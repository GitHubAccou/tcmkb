package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.ProjectsDao;
import com.tcmkb.service.ProjectsService;

public class ProjectsServiceImpl implements ProjectsService {
	private ProjectsDao projectsDao;
	public ProjectsDao getProjectsDao() {
		return projectsDao;
	}
	public void setProjectsDao(ProjectsDao projectsDao) {
		this.projectsDao = projectsDao;
	}
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return projectsDao.ajaxListAll(params);
	}
	
	@Override
	public void add(Map<String, Object> params) {
		projectsDao.add(params);
	}
	@Override
	public List<Map<String, Object>> getAvailableProjects(Map<String, Object> params) {
		return projectsDao.getAvailableProjects(params);
	}
	@Override
	public List<Map<String, Object>> approveList(Map<String, Object> params) {
		return projectsDao.approveList(params);
	}
	@Override
	public long approveListTotal(Map<String, Object> params) {
		return projectsDao.approveListTotal(params);
	}
	@Override
	public long ajaxListAllTotal(Map<String, Object> params) {
		
		return projectsDao.ajaxListAllTotal(params);
	}
}
