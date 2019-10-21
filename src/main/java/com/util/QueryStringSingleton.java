package com.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import com.bean.*;
import com.service.ArticleService;
import com.serviceimpl.ArticleServiceImpl;
public class QueryStringSingleton {

	private static ArticleInfo articleinfo;
	private static ArticleService as=new ArticleServiceImpl();
	public static String QueryStringSingleton(UserInfo user,ArticleInfo artinfo,List<ClassifyInfo> list) {
		// TODO Auto-generated method stub

		String str=user.getOperation_record();
		System.out.println(artinfo.getId());
		//List<ClassifyInfo> list=as.getClassifyInfoByArtID(artinfo.getId());
		str=str+artinfo.getTitle()+","+artinfo.getAuthor()+",";
		if(list!=null) {
			for(int i=0;i<list.size();i++) {
				str+=list.get(i).getClassify_name()+",";
			}
		}
		String[] strarr=str.split(",");
		System.out.println(str+":"+strarr);
		if(strarr.length>30) {
			int n=0;
			for(int i=0;i<(2+list.size());i++) {
				str=str.substring(str.indexOf(",")+1,str.length());
			}
		}
		return str;
		
	}
	public static String[] stringSort(String string) {
		
		if(string==null) {
			return null;
		}
		String[] strArr=string.split(",");
		Map<String, Integer> map = new TreeMap<String, Integer>();
	    
		for(int i=0;i<strArr.length;i++) {
			if(map.containsKey(strArr[i])) {
				int num=map.get(strArr[i]);
				num++;
				map.put(strArr[i], num);
			}else {
				map.put(strArr[i], 1);
			}
		}
		System.out.println(map);
		//这里将map.entrySet()转换成list
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(map.entrySet());
        //然后通过比较器来实现排序
        Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
            //升序排序
            public int compare(Entry<String, Integer> o1,
                    Entry<String, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
            
        });
        
        int i=0;
        String[] str=new String[3];
        for(Map.Entry<String,Integer> mapping:list){
        	if(i<3) {
        		str[i]=mapping.getKey(); 
        	}
        	i++;
               
          } 
        return str;
	}

}
