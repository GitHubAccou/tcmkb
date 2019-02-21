package com.tcmkb.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.NoticeService;
import com.tcmkb.utils.RequestUtil;
public class NoticeController extends BaseController{
	private NoticeService noticeService;
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		List<Map<String,Object>> data=noticeService.ajaxListAll(params);
		JSONObject json=new JSONObject();
		if(data==null||data.isEmpty()) {
			json.put("success", 0);
		}else {
			json.put("success", 1);
			json.put("data", data);
		}
		try {
			response.getWriter().write(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public NoticeService getNoticeService() {
		return noticeService;
	}
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
}
