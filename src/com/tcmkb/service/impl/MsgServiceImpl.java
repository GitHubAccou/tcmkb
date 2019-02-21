package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.MsgDao;
import com.tcmkb.service.MsgService;

public class MsgServiceImpl implements MsgService {
	private MsgDao msgDao;
	@Override
	public List<Map<String, Object>> ajaxListAll(Map<String, Object> params) {
		return msgDao.ajaxListAll(params);
	}
	public MsgDao getMsgDao() {
		return msgDao;
	}
	public void setMsgDao(MsgDao msgDao) {
		this.msgDao = msgDao;
	}
	@Override
	public void update(Map<String, Object> params) {
		msgDao.update(params);
	}
	@Override
	public void addMsg(Map<String, Object> row) {
		msgDao.addMsg(row);
	}
	@Override
	public Long ajaxListAllCount(Map<String, Object> params) {
		return msgDao.ajaxListAllCount(params);
	}
	@Override
	public Long getMsgCount(Map<String, Object> params) {
		return msgDao.getMsgCount(params);
	}

}
