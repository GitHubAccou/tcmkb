package com.tcmkb.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public void addNotice(Map<String,Object> row);

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);
}
