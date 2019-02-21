package com.tcmkb.dao;

import java.util.List;
import java.util.Map;

public interface UserProjectDao {

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

	public long selectUnFinishedCount(Map<String, Object> params);

	public void add(Map<String, Object> params);

	public Map<String, Object> querySingle(Map<String, Object> params);

	public void approve(Map<String, Object> params);
	
	public List<Map<String, Object>> listAll(Map<String, Object> params);
}
