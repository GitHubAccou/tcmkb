package com.tcmkb.dao.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.NoticeDao;

public class NoticeDaoImpl extends BaseDao implements NoticeDao{

	@Override
	public void add(Map<String, Object> row) {
		this.insert("notice.add", row);
	}
	@Override
	public List<Map<String,Object>> ajaxListAll(Map<String,Object> params){
		return this.query("notice.ajaxListAll", params);
	}

}
