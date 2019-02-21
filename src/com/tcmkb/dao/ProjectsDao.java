package com.tcmkb.dao;

import java.util.List;
import java.util.Map;

public interface ProjectsDao {

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

	public void add(Map<String, Object> params);

	public List<Map<String, Object>> getAvailableProjects(Map<String, Object> params);

	public List<Map<String, Object>> approveList(Map<String, Object> params);

	public long approveListTotal(Map<String, Object> params);

	public long ajaxListAllTotal(Map<String, Object> params);

}
