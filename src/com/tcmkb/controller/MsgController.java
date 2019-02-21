package com.tcmkb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tcmkb.base.BaseController;
import com.tcmkb.service.MsgService;
import com.tcmkb.utils.RequestUtil;
@RestController
public class MsgController extends BaseController{
	private MsgService msgService;
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		String userId=(String) request.getSession().getAttribute("userId");
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		params.put("userId", userId);
		List<Map<String,Object>> list=msgService.ajaxListAll(params);
		Long total=msgService.ajaxListAllCount(params);
		JSONArray jsonArray=new JSONArray();
		  jsonArray.addAll(list);
		  JSONObject jsonObject=new JSONObject();
		  jsonObject.put("rows", jsonArray);
		  jsonObject.put("total", total);
		  try {
			  	response.setCharacterEncoding("utf-8");
				response.getWriter().write(jsonObject.toJSONString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		return null;
	}
	
	public ModelAndView getMsgCount(HttpServletRequest request,HttpServletResponse response) {
		String currentUserId=(String) request.getSession().getAttribute("userId");
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("userId", currentUserId);
		Long count=msgService.getMsgCount(params);
		JSONObject result=new JSONObject();
		if(count!=null&&count>=0) {
			result.put("success", true);
			result.put("cnt", count);
		}else {
			result.put("success", false);
			result.put("cnt", 0);
		}
		try {
			response.getWriter().write(result.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ModelAndView updateRead(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object>params=RequestUtil.getParamsMap(request, true);
		if(params!=null&&params.containsKey("ids")&&params.containsKey("ids")) {
			String idsList[]=params.get("ids").toString().split(";");
			params.put("ids", idsList);
			params.put("read", "1");
			msgService.update(params);
		}
		return null;
	}
	public MsgService getMsgService() {
		return msgService;
	}
	public void setMsgService(MsgService msgService) {
		this.msgService = msgService;
	}
}
