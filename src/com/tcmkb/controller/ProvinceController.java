package com.tcmkb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.ProvinceService;
public class ProvinceController extends BaseController{
	private ProvinceService provinceService; 
	public ModelAndView ajaxList(HttpServletRequest request,HttpServletResponse response) {
		List<Map<String,Object>> list=provinceService.ajaxList(new HashMap<String,Object>());
		JSONArray jsonArray=new JSONArray();
		jsonArray.addAll(list);
		try {
			response.getWriter().write(jsonArray.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public ProvinceService getProvinceService() {
		return provinceService;
	}
	public void setProvinceService(ProvinceService provinceService) {
		this.provinceService = provinceService;
	}
}
