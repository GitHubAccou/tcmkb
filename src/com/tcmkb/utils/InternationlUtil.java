package com.tcmkb.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.http.HttpSession;

/**
 * 国际化工具类
 * @author Easter
 *
 */
public class InternationlUtil {
	public static void  main(String args[]) {

	}
	
	/**
	 * 国际化用到的方法，默认返回中文值
	 * @param session
	 * @param key
	 * @return
	 */
	public static String getMsg(HttpSession session,String key) {
		String result="";
		String local=null;
		if(session==null||session.getAttribute("locale")==null) {
			local=Locale.CHINA.toString();
		}
		local=session.getAttribute("locale").toString();
		InputStream is;
		try {
			is = new FileInputStream(new File("E:\\WebWorkspace\\tcmkb\\src\\conf\\international\\i18n_"+local+".properties"));
			Properties property=new Properties();
			property.load(is);
			result= property.getProperty(key);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return key;
		} catch (IOException e) {
			e.printStackTrace();
			return key;
		}
		return result==null?key:result;
	}
}
