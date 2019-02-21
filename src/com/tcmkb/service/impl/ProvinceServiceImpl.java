package com.tcmkb.service.impl;

import java.util.List;
import java.util.Map;

import com.tcmkb.dao.ProvinceDao;
import com.tcmkb.service.ProvinceService;

public class ProvinceServiceImpl implements ProvinceService {
	private ProvinceDao provinceDao;
	@Override
	public List<Map<String, Object>> ajaxList(Map<String, Object> params) {
		return provinceDao.ajaxList(params);
	}
	public ProvinceDao getProvinceDao() {
		return provinceDao;
	}
	public void setProvinceDao(ProvinceDao provinceDao) {
		this.provinceDao = provinceDao;
	}

}
