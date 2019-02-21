package com.tcmkb.dao;

import java.util.List;
import java.util.Map;

public interface MsgDao {

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

	public void update(Map<String, Object> params);

	public void addMsg(Map<String, Object> row);

	public Long ajaxListAllCount(Map<String, Object> params);

	public Long getMsgCount(Map<String, Object> params);
}
