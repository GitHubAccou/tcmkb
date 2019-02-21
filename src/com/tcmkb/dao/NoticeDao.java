package com.tcmkb.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDao {

	public void add(Map<String, Object> row);

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

}
