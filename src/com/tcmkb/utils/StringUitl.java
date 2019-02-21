package com.tcmkb.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 字符串工具类
 * @author Easter
 *
 */
public class StringUitl {
  public static String camelStyle(boolean capital,String str){
    List<String> toBeReplace=new ArrayList<String>();
    str=str.toLowerCase();
    
    Pattern p=Pattern.compile("_[a-z0-9]");
    Matcher matcher = p.matcher(str);
    while(matcher.find()){
      toBeReplace.add(matcher.group());
    }
    if(!toBeReplace.isEmpty()){
      for(String x:toBeReplace){
        String x1=x.substring(1).toUpperCase();
        str=str.replaceFirst(x, x1);
      }
    }
    if(capital){
      str=str.substring(0, 1).toUpperCase()+str.substring(1);
    }
    return str;
  }
  /**
   * MD5加密字符串，可用于密码验证
   * @param src
   * @return
   */
  public static String md5Ency(String src) {
	  String result="";
	try {
		MessageDigest md=MessageDigest.getInstance("MD5");
		md.update(src.getBytes("utf-8"));
		byte[] bs=md.digest();
		for(int i=0;i<bs.length;i++) {
			int num=bs[i]<0?(bs[i]+256):bs[i];
			String str=Integer.toHexString(num);
			result+=str.length()==1?"0"+str:str;
		}
	} catch (NoSuchAlgorithmException e) {
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	 return result; 
  }
  /**
   * 图标统计工具类
   * @return
   */
  public static List<String> startAndEnd(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		Date dNow = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(now);
		calendar.add(Calendar.YEAR, -4); 
		dNow = calendar.getTime();
		String a = sdf.format(dNow);
		List<String> list = new ArrayList<String>();
		int c = 0;
		for (int i = 0; i < 5; i++) {
			if (i == 0) {
				c = Integer.parseInt(a.split("-")[0]);
			}
			list.add(String.valueOf(c) + "-" + a.split("-")[1] + "-"
					+ a.split("-")[2]);
			c++;
		}
		return list;
  }
  
  public static void main(String[] args) {
   // List str=Arrays.asList("users_log_action","create_name","create_ip","create_time","asthma_english_journals","clinic_jianbie","already_read","asthma_journals","clinic_xtpj","case_record","areas","users_roles","gastritis_diagnosis_treatment_standard","asthma_evaluation_diagnosis_treatment","asthma_traditional_chinese_medicine","email_status","create_os","users_groups");
    System.out.println(md5Ency("password"));
  }
}
