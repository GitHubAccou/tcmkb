package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.NoticeDao;
import com.tcmkb.service.NoticeService;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDao noticeDao;
	@Override
	public void addNotice(Map<String, Object> row) {
		noticeDao.add(row);
	}
	@Override
	public List<Map<String,Object>> ajaxListAll(Map<String,Object> params){
		return noticeDao.ajaxListAll(params);
	}
	public NoticeDao getNoticeDao() {
		return noticeDao;
	}
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

}
