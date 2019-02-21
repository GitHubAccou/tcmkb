package com.tcmkb.dao.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.base.BaseDao;
import com.tcmkb.dao.MsgDao;

public class MsgDaoImpl extends BaseDao implements MsgDao {
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return this.query("msgs.ajaxListAll", params);
	}

	@Override
	public void update(Map<String, Object> params) {
		this.updateRow("msgs.updateReadField", params);
		
	}

	@Override
	public void addMsg(Map<String, Object> row) {
		this.insert("msgs.insertMsg", row);
	}

	@Override
	public Long ajaxListAllCount(Map<String, Object> params) {
		return (Long) ((Map<String,Object>)this.queryOne("msgs.ajaxListAllCount", params)).get("cnt");
	}

	@Override
	public Long getMsgCount(Map<String, Object> params) {
		return (Long) ((Map<String,Object>)this.queryOne("msgs.getMsgCount", params)).get("cnt");
	}

}
