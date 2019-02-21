package com.tcmkb.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
/**
 * 菜单工具类
 * @author Easter
 *
 */
public class MenuUtil {

	public static void main(String[] args) {
		List<Map<String,Object>> list=new LinkedList<Map<String,Object>>();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("path", "1");
		Map<String,Object> map1=new HashMap<String,Object>();
		map1.put("path", "2");
		Map<String,Object> map2=new HashMap<String,Object>();
		map2.put("path", "1-1");
		Map<String,Object> map3=new HashMap<String,Object>();
		map3.put("path", "1-1-1");
		Map<String,Object> map4=new HashMap<String,Object>();
		map4.put("path", "1-1-2");
		Map<String,Object> map5=new HashMap<String,Object>();
		map5.put("path", "1-2");
		Map<String,Object> map6=new HashMap<String,Object>();
		map6.put("path", "1-2-1");
		Map<String,Object> map7=new HashMap<String,Object>();
		map7.put("path", "1-2-2");
		Map<String,Object> map8=new HashMap<String,Object>();
		map8.put("path", "3");
		Map<String,Object> map9=new HashMap<String,Object>();
		map9.put("path", "4");
		Map<String,Object> map0=new HashMap<String,Object>();
		map0.put("path", "4-1");
		Map<String,Object> map10=new HashMap<String,Object>();
		map10.put("path", "4-1-2");
		Map<String,Object> map11=new HashMap<String,Object>();
		map11.put("path", "4-1-1");
		list.add(map);
		list.add(map0);
		list.add(map1);
		list.add(map2);
		list.add(map3);
		list.add(map4);
		list.add(map5);
		list.add(map6);
		list.add(map7);
		list.add(map8);
		list.add(map9);
		list.add(map10);
		list.add(map11);
		JSONArray jsonArray =getChildrenStyleMenuJSON(list, "path", "-", "pchildren");
		System.out.println(jsonArray.toJSONString());
	}
	/**
	 * 根据查询到的菜单数据，设置是否选中，已经层次关系，前台页面渲染树形结构会用到
	 * @param list
	 * @param pathKey
	 * @param checkedKey
	 * @return
	 */
	public static List<Map<String,Object>> relations(List<Map<String,Object>> list,String pathKey,String checkedKey) {
//		Set<String> checked=new HashSet<String>();
		for(Map<String,Object> map:list) {
			if((Long)map.get("checked")==1L) {
				map.put("checked", true);
			}else {
				map.put("checked", false);
			}
			String path=((String) map.get(pathKey)).trim();
			if(!map.containsKey(pathKey)||path==null||path.length()<1) {
				list.remove(map);
			}
			if(path.indexOf("-")==-1) {
				map.put("parent", "#");
			}else {
				map.put("parent", path.substring(0, path.lastIndexOf("-")));
//				checked.addAll(allParent(path));
			}
		}
//		Iterator<String> it=checked.iterator();
//		while(it.hasNext()) {
//			String next=it.next();
//			for(Map<String,Object> map:list) {
//				if(next.equalsIgnoreCase((String) map.get(pathKey))) {
//					map.put("checked", true);
//					break;
//				}
//			}
//		}
		
		return list;
	}
	/**
	 * 返回一个菜单层次路径的所有上级层级路径:比如参数路径为1-2-3-4-6-3 ，则它的所有上级层次路径有：
	 * 1-2-3-4-6、 1-2-3-4 、1-2-3 、1-2 、1
	 * @param path 要获取上级层次路径的 菜单层次路径
	 * @return 所有的上级层次路径
	 */
	public static Set<String> allParent(String path){
		if(path==null||path.indexOf("-")==-1) {
			return new HashSet<String>();
		}
		path=path.trim();
		Set<String> result=new HashSet<String>();
		do {
			path=path.substring(0, path.lastIndexOf("-"));
			result.add(path);
		}while(path.indexOf("-")>0);
		return result;
	}
	/**
	 * 获取直接上级的path
	 * @param path
	 * @return
	 */
	public static String getParent(String path) {
		if(path==null||path.indexOf("-")==-1) {
			return null;
		}else {
			int index=path.lastIndexOf("-");
			return path.substring(0, index);
		}
	}
	
	/**
	 * 将list结构的数据根据pathKey值表示的层次关系转换成JSON对象。
	 * @param list
	 * @param pathKey
	 * @param regSeparator
	 * @return
	 */
	public static JSONArray getChildrenStyleMenuJSON(List<Map<String,Object>> list,String pathKey,String separator,String childrenKey) {
		JSONArray jsonArray=new JSONArray();
		Set<String> toBeRemoved=new HashSet<String>();
		for(Map<String,Object> map:list) {
			String path=(String) map.get(pathKey);
			if(path.indexOf(separator)==-1) {
				continue;
			}
			String parentPath=path.substring(0, path.lastIndexOf(separator));
			for(Map<String,Object> map1:list) {
				if(map1.get(pathKey).equals(parentPath)) {
					toBeRemoved.add(path);
					if(map1.containsKey(childrenKey)) {
						((List<Map<String,Object>>)map1.get(childrenKey)).add(map);
					}else {
						List<Map<String,Object>> childrenList=new ArrayList<Map<String,Object>>();
						childrenList.add(map);
						map1.put(childrenKey, childrenList);
					}
				}
			}
		}
		Iterator<String> it=toBeRemoved.iterator();
		while(it.hasNext()) {
			String next=it.next();
			for(int i=0;i<list.size();i++) {
				if(list.get(i).get(pathKey).equals(next)) {
					list.remove(i);
					break;
				}
			}
		}
		jsonArray.addAll(list);
		return jsonArray;
	}
	/**
	 * 获取下一个可用path,新建菜单时调用
	 * @param parentPath
	 * @param usedPaths
	 * @return
	 */
	public static String nextAvailablePath(String parentPath,Set<String> usedPaths) {
		String str="123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz";
		for(String up:usedPaths) {
			str=str.replace(up.charAt(up.length()-1)+"", "");
		}
		if(str.length()==0) {
			throw new RuntimeException("没有可以分配的路径");
		}
		return parentPath+"-"+str.charAt(0);
	}
	/**
	 * 渲染菜单数据
	 * @param list
	 * @return
	 */
	public static List<Map<String,Object>> render(List<Map<String,Object>> list){
		if(list!=null&&!list.isEmpty()) {
			for(Map<String,Object> map:list) {
				String dataMAttr=(String) (map.containsKey("url")&&map.get("url")!=null?map.get("url"):"");
				map.put("html", "<a href='#' data-m='"+dataMAttr+"'><i class='icon "+map.get("icon")+"'></i>"+map.get("name")+"</a>");
			}
		}
		
		return list;
	} 
	public static void render(JSONArray array,String childKey) {
		for(int i=0;i<array.size();i++) {
			Object o=array.get(i);
			if(o instanceof JSONArray) {
				render((JSONArray)o,childKey);
			}else if(o instanceof List) {
				JSONArray arry=new JSONArray();
				arry.addAll((List)o);
				render(arry, childKey);
			}else if(o instanceof JSONObject) {
				JSONObject json=(JSONObject)o;
				if(!json.containsKey(childKey)) {
					String dataMAttr=(String) (json.containsKey("url")&&json.get("url")!=null?json.get("url"):"");
					json.put("html", "<a href='#' data-m='"+dataMAttr+"'><i class='icon "+json.get("icon")+"'></i>"+json.get("name")+"</a>");
				}else {
					render(json.getJSONArray(childKey), childKey);
				}
			}else if(o instanceof Map){
				Map json=(Map)o;
				if(!json.containsKey(childKey)) {
					String dataMAttr=(String) (json.containsKey("url")&&json.get("url")!=null?json.get("url"):"");
					json.put("html", "<a href='#' data-m='"+dataMAttr+"'><i class='icon "+json.get("icon")+"'></i>"+json.get("name")+"</a>");
				}else {
					json.put("html", "<a href='#'><i class='icon "+json.get("icon")+"'></i>"+json.get("name")+"</a>");
					JSONArray arry=new JSONArray();
					arry.addAll((List)json.get(childKey));
					render(arry, childKey);
				}
			}else {
				continue;
			}
		}
	}
}
