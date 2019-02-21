package com.tcmkb.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class RequestUtil {
	public static final String DEFAULT_CREATE_USER_KEY="createUser";
	public static final String DEFAULT_CREATE_TIME_KEY="createTime";
	public static final String DEFAULT_UPDATE_USER_KEY="updateUser";
	public static final String DEFAULT_UPDATE_TIME_KEY="updateTime";
	public static final SimpleDateFormat DEFAULT_DATE_FORMAT=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	public static void main(String[] args) {
		
	}
	/**
	 * 请求参数封装到Map当中
	 * @param request
	 * @param ignoreEptString 空字符串是否忽略掉（<font style='color:red;font-weight:bold'>这里空字符串也包含全是空格的字符串</font>）
	 * @return 返回封装的请求参数的key-value键值对
	 */
	public static Map<String,Object> getParamsMap(HttpServletRequest request,boolean ignoreEptString) {
		Map<String,Object> params=new HashMap<String,Object>();
		Enumeration<String> keys = request.getParameterNames();
		while(keys.hasMoreElements()) {
			String next=keys.nextElement();
			String value=request.getParameter(next);
			if(ignoreEptString&&value.trim().length()==0) {
				continue;
			}else if(next.equals("offset")||next.equals("limit")) {
				params.put(next, Integer.parseInt(request.getParameter(next)));
			}else {
				params.put(next, request.getParameter(next));
			}
		}
		return params;
	}
	
	/**
	 * 从request的输入流当中读取参数和文件流
	 * @param request
	 * @param ignoreEptString
	 * @param fileKey
	 * @param charset 
	 * @return
	 */
	public static Map<String,Object> getParamsFromReqStream(HttpServletRequest request,boolean ignoreEptString,String fileKey,String charset) {
		Map<String,Object> params=new HashMap<String,Object>();
		Map<String,Object> files=new HashMap<String,Object>();
		params.put(fileKey, files);
		int size=request.getContentLength();
		byte bs[]=new byte[size];
		try {
			ServletInputStream is=request.getInputStream();
			int len=0;
			//只要有数据，进行读取
			while((len=is.readLine(bs, 0, Integer.MAX_VALUE))!=-1) {
				String line=new String(bs,0,len,charset);
				if(line.startsWith("------WebKitFormBoundary")) {
					if(line.endsWith("--")) {
						//结束
						break;
					}else {
						//非数据行和结束行则读下一行
						continue;
					}
				}else if(line.startsWith("Content-Disposition: form-data;")) {
					line=line.substring(0, line.length()-3);
					String parts[]=line.split(";\\s");
					if(parts.length==3&&parts[2].split("=")[0].trim().equals("filename")) {
						String keyPair[]=parts[2].split("=");
						//去除双引号
						String fileName=keyPair[1].substring(1);
						//跳过内容之前的空行
						is.readLine(bs, 0, Integer.MAX_VALUE);
						
						byte contentBytes[]=new byte[Integer.MAX_VALUE/32];
						int contentLen=0;
						while((len=is.readLine(bs, 0, Integer.MAX_VALUE))!=-1) {
							if(line.startsWith("------WebKitFormBoundary")) {
								//内容结束跳出取值循环
								break;
							}else {
								System.arraycopy(bs, 0, contentBytes, contentLen, len);
								contentLen+=len;
							}
						}
						files.put(fileName, contentBytes);
					}else if(parts.length==2&&parts[1].contains("=")) {
						String keyPair[]=parts[1].split("=");
						//去除双引号
						String key=keyPair[1].substring(1);
						//跳过内容之前的空行
						is.readLine(bs, 0, Integer.MAX_VALUE);
						
						String value="";
						while((len=is.readLine(bs, 0, Integer.MAX_VALUE))!=-1) {
							line=new String(bs,0,len,charset);
							line=line.substring(0, line.length()-2);
							if(line.startsWith("------WebKitFormBoundary")) {
								//内容结束跳出取值循环
								break;
							}else {
								value+=line;
							}
						}
						if("".equals(value.trim())&&ignoreEptString) {

						}else {
							params.put(key, value);
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return params;
	}
	
	/**
	 *请求参数中添加 “创建改人”，“创建时间”等字段
	 * @param params
	 * @param createUserKey
	 * @param createTimeKey 
	 * @return
	 */
	public static Map<String,Object> putCreateUserAndTimeFields(Map<String,Object> params,String createUserKey,String createTimeKey,String currentUserIdValue){
		
		if(createUserKey==null) {
			createUserKey=DEFAULT_CREATE_USER_KEY;
		}
		if(createTimeKey==null) {
			createTimeKey=DEFAULT_CREATE_TIME_KEY;
		}
		if(params==null) {
			params=new HashMap<String,Object>();
		}
		params.put(createUserKey, currentUserIdValue);
		params.put(createTimeKey, DEFAULT_DATE_FORMAT.format(new Date()));
		return params;
	}
	/**
	 *请求参数中添加 “修改人”，“修改时间”等字段
	 * @param params
	 * @param updateUserKey
	 * @param updateTimeKey
	 * @return
	 */
	public static Map<String,Object> putUpdateUserAndTimeFields(Map<String,Object> params,String updateUserKey,String updateTimeKey,String currentUserIdValue){
		
		if(updateUserKey==null) {
			updateUserKey=DEFAULT_CREATE_USER_KEY;
		}
		if(updateTimeKey==null) {
			updateTimeKey=DEFAULT_CREATE_TIME_KEY;
		}
		if(params==null) {
			params=new HashMap<String,Object>();
		}
		params.put(updateUserKey, currentUserIdValue);
		params.put(updateTimeKey, DEFAULT_DATE_FORMAT.format(new Date()));
		return params;
	}
	public static List<Map<String,Object>> removeUnUseableFields(List<Map<String,Object>> list,String ... useableFields ){
		if(list==null) {
			return null;
		}else if(list.isEmpty()) {
			return list;
		}else {
			List<String> useableList=Arrays.asList(useableFields);
			for(int i=0;i<list.size();i++) {
				Map<String,Object> map=list.get(i);
				Set<String> keys=map.keySet();
				Iterator<String> it=keys.iterator();
				while(it.hasNext()) {
					String key=it.next();
					if(useableList.indexOf(key)==-1) {
						it.remove();
					}
				}
			}
			return list;
		}
	}
	//渲染分页
	public static void renderPage(HttpServletResponse response,List<Map<String,Object>> dataList,long total) {
		JSONArray jsonArray=new JSONArray();
		jsonArray.addAll(dataList);
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", jsonArray);
		jsonObject.put("total", total);
		try {
			response.getWriter().write(jsonObject.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void download(HttpServletResponse response,File file) {
		//设置响应头，控制浏览器下载该文件
		try {
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(file.getName(), "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//读取要下载的文件，保存到文件输入流
		FileInputStream in = null;
		try {
			in = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		//创建输出流
		OutputStream out = null;
		try {
			out = response.getOutputStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		//创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		//循环将输入流中的内容读取到缓冲区当中
		try {
			while((len=in.read(buffer))>0){
			    //输出缓冲区的内容到浏览器，实现文件下载
			    out.write(buffer, 0, len);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//关闭文件输入流
		try {
			in.close();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//关闭输出流
	}
	
	/**
	 * 完成上传文件的生成文件操作，如果目录不存在，会自动创建
	 * @param data
	 * @param dir
	 */
	public static void upload(Map<String,byte[]> data,String dir) {
		File dirFile=new File(dir);
		if(!dirFile.exists()) {
			dirFile.mkdirs();
		}
		Set<String> fileNames=data.keySet();
		for(String name:fileNames) {
			File file=new File(dirFile,name);
			OutputStream os = null;
			try {
				os = new FileOutputStream(file);
				os.write(data.get(name));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e){
				e.printStackTrace();
			}finally {
				if(os!=null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
