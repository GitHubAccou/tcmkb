package com.tcmkb.dao;

import java.util.List;
import java.util.Map;

public interface MenuDao {

	public List<Map<String, Object>> listByRole(String roleId);

	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params);

	public List<Map<String, Object>> ajaxAvailableParentNodes();

	public List<Map<String, Object>> getUsedPaths(String parentPath);

	public void add(Map<String, Object> params);

	public void del(Map<String, Object> params);

	public void update(Map<String, Object> params);

	public long ajaxListAllTotal(Map<String, Object> params);

}
