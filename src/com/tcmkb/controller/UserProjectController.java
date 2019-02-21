package com.tcmkb.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.tcmkb.base.BaseController;
import com.tcmkb.model.Census;
import com.tcmkb.service.NoticeService;
import com.tcmkb.service.UserProjectService;
import com.tcmkb.utils.KeyGerator;
import com.tcmkb.utils.RequestUtil;
import com.tcmkb.utils.StringUitl;

import freemarker.cache.FileTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;
public class UserProjectController extends BaseController{
	private UserProjectService userProjectService;
	private NoticeService noticeService;
	public ModelAndView ajaxListAll(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		params.put("userId", request.getSession().getAttribute("userId"));
		List<Map<String,Object>> list=userProjectService.ajaxListAll(params);
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", list);
		jsonObject.put("total", list.size());
		try {
			response.getWriter().write(jsonObject.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 瀹℃壒鍓嶆煡鐪嬮」鐩缁嗕俊鎭�
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView getInfo(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		Map<String,Object> data=userProjectService.querySingle(params);
		try {
			response.getWriter().write(JSON.toJSONString(data));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public ModelAndView approve(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> currentUserInfo=(Map<String, Object>) request.getSession().getAttribute("user");
		String provinceId=  (String) currentUserInfo.get("provinceId");
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		String userId=(String) params.get("userId");
		String projectId=(String) params.get("projectId");
		String pass=(String) params.get("pass");
		String suggestion=(String) params.get("suggestion");
		if(userId==null||projectId==null||userId.trim().length()==0||projectId.trim().equals("")) {
			return null;
		}else if(!pass.equals("1")&&!pass.equals("0")) {
			
		}else if(!provinceId.equals("-1")){
			params.remove("pass");
			params.remove("suggestion");
			params.put("status", pass.equals("1")?3:2);
			params.put("provinceSuggestion", suggestion);
			userProjectService.approve(params);
		}else {
			params.remove("pass");
			params.remove("suggestion");
			params.put("status", pass.equals("1")?5:4);
			params.put("finalSuggestion", suggestion);
			userProjectService.approve(params);
		}
		
		//娣诲姞鍒伴�氱煡琛�
		Map<String,Object> noticeRow=new HashMap<String,Object>();
		noticeRow.put("id", KeyGerator.getNextKey("notice", 15, true));
		noticeRow.put("title", "椤圭洰銆�"+params.get("name")+"銆嬫柊杩涘睍");
		noticeRow.put("content", (provinceId.equals("-1")?"鍥藉":"鐪佺骇")+"瀹℃牳浜嗛」鐩�,"+(pass.equals("1")?"瀹℃牳閫氳繃":"瀹℃牳鏈�氳繃"));
		RequestUtil.putCreateUserAndTimeFields(noticeRow, "createUser", "createTime", (String) request.getSession().getAttribute("userId"));
		getNoticeService().addNotice(noticeRow);
		
		return null;
	}
	
	public ModelAndView export(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		Map<String,Object> data=userProjectService.querySingle(params);
		Configuration configuration = new Configuration();
  		configuration.setDefaultEncoding("UTF-8");
  		Template template;
		try {
			TemplateLoader loader=new FileTemplateLoader(new File("E:\\WebWorkspace\\tcmkb\\src\\"));
			configuration.setTemplateLoader(loader);
			template = configuration.getTemplate("template1.ftl");
			//System.out.println("she");
			File outFile = new File("E:/export"+System.currentTimeMillis()+".doc");
			outFile.getParentFile().mkdirs();
			outFile.createNewFile();
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8"));
			template.process(data, out);
			out.close();
			RequestUtil.download(response, outFile);
		} catch (TemplateNotFoundException e) {
			e.printStackTrace();
		} catch (MalformedTemplateNameException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}

		return null;
	}
	/**
	 * 鍥捐〃缁熻
	 * @param request
	 * @param response
	 * @return
	 */
	public ModelAndView listAll(HttpServletRequest request,HttpServletResponse response) {
		Map<String,Object> params=RequestUtil.getParamsMap(request, true);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		List<String> listparams = StringUitl.startAndEnd();
		List<Census> listCensus = new ArrayList<Census>();
		List<String> dateList = new ArrayList<String>();
		List<String> sumList = new ArrayList<String>();
		for(int i=0;i<listparams.size();i++){
			String startTime = listparams.get(i);
			if(i==4){
				break;
			}
			String endTime = listparams.get(i+1);
			params.put("startTime", startTime);
			params.put("endTime", endTime);
			list=userProjectService.listAll(params);
			if(list.size()==0){
				sumList.add("0");
				dateList.add(startTime.split("-")[0]);
			}else{
				for(int j=0;j<list.size();j++){
					Census census = new Census();
					if(j==1){
						dateList.add(listparams.get(i+1).split("-")[0]);
					}else{
						dateList.add(startTime.split("-")[0]);
					}
					sumList.add(list.get(j).get("sun").toString());
					census.setData(sumList);
					census.setName(list.get(j).get("projectName").toString());
					census.setStack("脳脺脕驴");
					census.setType("line");
					listCensus.add(census);
				}
			}
		}
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", listCensus);
		jsonObject.put("startDate", dateList);
		try {
			response.getWriter().write(jsonObject.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public UserProjectService getUserProjectService() {
		return userProjectService;
	}
	public void setUserProjectService(UserProjectService userProjectService) {
		this.userProjectService = userProjectService;
	}
	public NoticeService getNoticeService() {
		return noticeService;
	}
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
}
