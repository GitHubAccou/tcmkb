package com.tcmkb.service;

import java.util.List;
import java.util.Map;

public interface UserProjectService {
	public List<Map<String,Object>> ajaxListAll(Map<String,Object> params);

	public long selectUnFinishedCount(Map<String, Object> params);

	public void add(Map<String, Object> params);

	public Map<String, Object> querySingle(Map<String, Object> params);

	public void approve(Map<String, Object> params);
	//图表统计
	public List<Map<String, Object>> listAll(Map<String, Object> params);
}
