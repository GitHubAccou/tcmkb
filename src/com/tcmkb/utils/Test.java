package com.tcmkb.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.mvc.multiaction.InternalPathMethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.MethodNameResolver;
import org.springframework.web.servlet.mvc.multiaction.PropertiesMethodNameResolver;

import com.alibaba.fastjson.JSON;

import freemarker.cache.FileTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

public class Test  implements Runnable{
  public static void main(String[] args) {
//	  File f=new File("D:\\WebWorkspace\\tcmkb\\WebRoot\\images\\index.png");
//	  String result="";
//	  Base64.Encoder be=Base64.getEncoder();
//	  byte bs[]=new byte[1024*1024];
//	  try {
//		InputStream is=new FileInputStream(f);
//		int len=0;
//		while((len=is.read(bs, 0, bs.length))>0) {
//			byte bs1[]=Arrays.copyOfRange(bs, 0, len);
//			result+=be.encodeToString(bs1);
//		} 
//	} catch (FileNotFoundException e) {
//		e.printStackTrace();
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
//	
//	  System.out.println(result);
//	  Map<String,Object> dataMap=new HashMap<String,Object>();
//	  dataMap.put("name", "椹簯");
//	  dataMap.put("position", "java绋嬪簭鍛�");
//	  dataMap.put("company", "闃块噷宸村反");
//	  dataMap.put("phone", "15714402393");
//	  dataMap.put("mail", "1280037372@qq.com");
//	  Configuration configuration = new Configuration();
//      configuration.setDefaultEncoding("UTF-8");
//	  Template template;
//	try {
//		TemplateLoader loader=new FileTemplateLoader(new File("C:/users/easter/desktop"));
//		configuration.setTemplateLoader(loader);
//		template = configuration.getTemplate("jianli.ftl");
//		File outFile = new File("C:/users/easter/desktop/jianli.doc");
//		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8"));
//		template.process(dataMap, out);
//		out.close();
//	} catch (TemplateNotFoundException e) {
//		e.printStackTrace();
//	} catch (MalformedTemplateNameException e) {
//		e.printStackTrace();
//	} catch (ParseException e) {
//		e.printStackTrace();
//	} catch (IOException e) {
//		e.printStackTrace();
//	} catch (TemplateException e) {
//		e.printStackTrace();
//	}
	MethodNameResolver mr;  
	  
	  InternalPathMethodNameResolver resolver=new InternalPathMethodNameResolver();
	  PropertiesMethodNameResolver pResolver=new PropertiesMethodNameResolver();
	  HttpURLConnection conn=null;
	    try {
	      URL url=new URL("http://1.202.5.48:801/tcmkb/webapi/PrismOrderServer/send");
	      conn=(HttpURLConnection) url.openConnection();
	      conn.setDoInput(true);
	      conn.setDoOutput(true);
	      Map<String,Object> map=new HashMap<String,Object>();
	      map.put("userId", 1525250003);
	      map.put("rptDate", "2017-12-05");
	      map.put("rptDate", "2017-12-05");
	      List<Map<String,Object>> stations=new ArrayList<Map<String,Object>>();
	      Map<String,Object> station1=new HashMap<String,Object>();
	      station1.put("code", "111");
	      station1.put("name", "绔欑偣1");
	      station1.put("countyType", "1");
	      Map<String,Object> station2=new HashMap<String,Object>();
	      station1.put("code", "222");
	      station1.put("name", "绔欑偣2");
	      station1.put("countyType", "3");
	      stations.add(station1);
	      stations.add(station2);
	      map.put("stations", stations);
	      conn.setRequestProperty("content-Type", "application/json");
	      conn.connect();
	      String data=JSON.toJSONString(map);
	      conn.getOutputStream().write(data.getBytes("utf-8"));
	      InputStream is=conn.getInputStream();
	      InputStreamReader isr=new InputStreamReader(is);
	      BufferedReader br=new BufferedReader(isr);
	      StringBuffer sb=new StringBuffer();
	      String line=null;
	      while((line=br.readLine())!=null) {
	        sb.append(line);
	      }
	      System.out.println(sb.toString());
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
  }

@Override
public void run() {
	
	Long x=0L;
	while(true) {
		URL url;
		try {
			url = new URL("https://passport.baidu.com/cgi-bin/genimage?tcG3e07e265e23ac1c70222146b9801687b420844067b0431f9");
			URLConnection uc=url.openConnection();
			uc.connect();
			System.out.println(Thread.currentThread().getName()+":"+x++);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
}
