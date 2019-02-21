package com.tcmkb.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Currency;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * 生成主键的类
 * @author Easter
 *
 */
public class KeyGerator {
	private static Map<String,String> keyMap=new HashMap<String,String>();
	private static final long DEFAULT_START_KEY=0;
	static {
		Properties prop=new Properties();
		File file=new File("E:\\WebWorkspace\\tcmkb\\src\\tableKeys.properties");
		System.out.println(file.getAbsolutePath());
		InputStream is;
		try {
			is = new FileInputStream(file);
			prop.load(is);
			for(Object key:prop.keySet()) {
				String k=(String) key;
				keyMap.put(k, prop.getProperty(k));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
//		List<String> tbs=Arrays.asList("users","roles","province");
//		for(int i=0;i<100000;i++) {
//			int index=new Random().nextInt(2)+1;
//			System.out.println(tbs.get(index)+"\t:\t"+getNextKey(tbs.get(index), 14, true));
//		}
		for(int i=0;i<5;i++) {
			Thread t= new Thread(new Runnable() {
				@Override
				public void run() {
					while(true) {
						System.out.println(Thread.currentThread().getName()+"\t:\t"+getNextKey("aaaaaa", 15, true));
						
					}
					
				}
			});
			t.start();
		}
	}
	
	public static synchronized String getNextKey(String tableName,int keyMaxLen, boolean fixedLen) {
		char patternChar=fixedLen?'0':'#';
		String pattern="";
		for(int i=1;i<=keyMaxLen;i++) {
			pattern+=patternChar;
		}
		String key="";
		DecimalFormat format=new DecimalFormat(pattern);
		if(!keyMap.containsKey(tableName)) {
			key=format.format(DEFAULT_START_KEY);
			keyMap.put(tableName, format.format(DEFAULT_START_KEY));
		}else {
			String oldKey=keyMap.get(tableName);
			String newKey;
			try {
				newKey = format.format(format.parse(oldKey).longValue()+1);
				keyMap.put(tableName, newKey);
				key=newKey;
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		flush();
		return key;
	} 
	
	private static void flush() {
		Properties prop=new Properties();
		prop=new Properties();
		Set<String> keys=keyMap.keySet();
		for(String key:keys) {
			prop.put(key, keyMap.get(key));
		}
		File file=new File("E:\\WebWorkspace\\tcmkb\\src\\tableKeys.properties");
		if(!file.exists()) {
			file.mkdirs();
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			prop.store(new FileOutputStream(file), "Last Modified:"+new Date());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
