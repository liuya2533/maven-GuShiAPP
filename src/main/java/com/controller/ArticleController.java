package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.bean.*;
import com.bean.CollectionInfo;
import com.service.ArticleService;
import com.service.UserInfoService;
import com.util.QueryStringSingleton;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	ArticleService as;
	@Autowired
	UserInfoService us;
	@RequestMapping(value="/detail/{artid}",method={RequestMethod.GET})
	public String loadArticle(@PathVariable("artid") Integer artid,Model model,HttpSession session) {
		Map<String,Object> map=new TreeMap<String,Object>();
		UserInfo userinfo=((UserInfo)session.getAttribute("userinfo"));
		if(userinfo!=null) {
			List<ArticleInfo> artList=as.getMyCollect(userinfo.getId());
			//记录收藏信息
			List<ClassifyInfo> list=as.getClassifyInfoByArtID(artid);
			String str=QueryStringSingleton.QueryStringSingleton(userinfo, as.articleDetails(artid),list);
			userinfo.setOperation_record(str);
			//同时更新个人操作记录
			us.updateUserInfo(userinfo);
			if(!artList.isEmpty()) {
				for(int i=0;i<artList.size();i++) {
					//如果在登录的情况下存在有收藏的古诗与当前古诗id一样的说明，当前古诗已被此人收藏
					if(artList.get(i).getId()==artid) {
						map.put("userid", userinfo.getId());
						
					}
				}
				
			}
		}
		ArticleInfo articleInfo=as.articleDetails(artid);
		map.put("articleInfo", articleInfo);
		List<ClassifyInfo> classifyList=as.getClassifyInfoByArtID(artid);
		map.put("classifyList", classifyList);
		model.addAttribute("articleInfomap",map);
		return "/jsp/details";
	}
	@RequestMapping(value="/recommend")
	public String loadRecommendArt(Model model,HttpSession session) {
		UserInfo user=(UserInfo)session.getAttribute("userinfo");
		List<ArticleInfo> artList;
		if(user!=null) {
			//用户登录的情况下，推荐
			artList=as.recommendArt(QueryStringSingleton.stringSort(user.getOperation_record()));
		}else {
			artList=as.recommendArt(null);
		}
		
		model.addAttribute("artList", artList);
		return "/jsp/main";
	}
	//添加收藏操作
	@RequestMapping(value="/collect")
	public void addCollect(CollectionInfo collectioninfo,Model model,HttpSession session,HttpServletResponse response) {
		collectioninfo.setUserid(((UserInfo)session.getAttribute("userinfo")).id);
		UserInfo user=(UserInfo)session.getAttribute("userinfo");
		
		int artid=collectioninfo.getArtid();
		System.out.println(artid);
		//记录收藏信息
		List<ClassifyInfo> list=as.getClassifyInfoByArtID(artid);
		String str=QueryStringSingleton.QueryStringSingleton(user, as.articleDetails(artid),list);
		user.setOperation_record(str);
		//同时更新个人操作记录
		us.updateUserInfo(user);
		int num=as.addCollect(collectioninfo);
		try {
			response.getWriter().println(num);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/removecollect")
	public void removeCollect(CollectionInfo collectioninfo,Model model,HttpSession session,HttpServletResponse response) {
		collectioninfo.setUserid(((UserInfo)session.getAttribute("userinfo")).id);
		int num=as.removeCollect(collectioninfo);
		try {
			response.getWriter().println(num);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	@RequestMapping(value="/mycollect")
	public String loadMycollect(Model model,HttpSession session) {
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		List<ArticleInfo> artList=as.getMyCollect(userinfo.getId());
		model.addAttribute("artList",artList);
		return "/jsp/collectpage";
	}
	@RequestMapping(value="/select/{type}")
	public String loadSelectPage(@PathVariable("type") String type,Model model,HttpSession session) {
		List<ArticleInfo> artList=as.getSelectType(type);
		model.addAttribute("artList",artList);
		if(type.equals("古诗")) {
			return "/jsp/potreypage";
		}else if(type.equals("近现代诗")){
			return "/jsp/modernpage";
		}else if(type.equals("文言文")){
			return "/jsp/wenyanwenpage";
		}else if(type.equals("名句")) {
			List<ArticleInfo> rhesisList=as.getArtForRhesis();
			model.addAttribute("rhesisList", rhesisList);
			return "/jsp/rhesispage";
		}else {
			return "/jsp/classifypage";
		}
		
	}
	@RequestMapping(value="/byStyle")
	public void loadArtByStyle(ArticleInfo artinfo,HttpServletResponse response) {
		List<ArticleInfo> artList=as.getArtByStyle(artinfo);
		System.out.println(artList);
		ArticleNumInfo artNumInfo=new ArticleNumInfo();
		artNumInfo.setList(artList);
		try {
			//这里需要注意转换后的json格式
			response.getWriter().println(JSON.toJSONString(artNumInfo));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/search",method={RequestMethod.POST})
	public void loadSearchPage(HttpServletRequest request,HttpServletResponse response) {
		
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		content="%"+content+"%";
		ArticleInfo artinfo=new ArticleInfo();
		if(type.equals("作者")) {
			artinfo.setAuthor(content);
		}else if(type.equals("标题")) {
			artinfo.setTitle(content);
		}else {
			artinfo.setContent(content);
		}
		
		List<ArticleInfo> artList=artList=as.getArtBySearch(artinfo);
		ArticleNumInfo artNumInfo=new ArticleNumInfo();
		artNumInfo.setList(artList);
		try {
			//这里需要注意转换后的json格式
			response.getWriter().println(JSON.toJSONString(artNumInfo));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/byclassify",method={RequestMethod.GET})
	public void loadinfoByClassify(String classify_name,HttpServletResponse response) {
		List<String> list=as.getInfoByClassfiy(classify_name);
		System.out.println(list);
		ArticleNumInfo artNumInfo=new ArticleNumInfo();
		artNumInfo.setStrList(list);
		try {
			//这里需要注意转换后的json格式
			response.getWriter().println(JSON.toJSONString(artNumInfo));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/artbyclassify",method={RequestMethod.GET})
	public String loadArticle(HttpServletRequest request,Model model,HttpSession session) {
		Map<String,String> map1=new TreeMap<String,String>();
		map1.put("classify", request.getParameter("classify"));
		map1.put("classify_name",request.getParameter("classify_name"));
		List<ArticleInfo> artList=as.getArtByClassify(map1);
		Map<String,Object> map2=new TreeMap<String,Object>();	
		map2.put("classify_name", request.getParameter("classify_name"));
		map2.put("artList", artList);
		model.addAttribute("infomap",map2);
		return "/jsp/classifypage2";
	}
	
}
