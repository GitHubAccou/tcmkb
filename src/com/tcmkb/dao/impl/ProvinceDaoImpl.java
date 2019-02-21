package com.tcmkb.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.ProvinceDao;

public class ProvinceDaoImpl extends BaseDao implements ProvinceDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> ajaxList(Map<String, Object> params) {
		if(params==null) {
			params=new HashMap<String,Object>();
		}
		return this.query("province.ajaxList", params);
	}

}
