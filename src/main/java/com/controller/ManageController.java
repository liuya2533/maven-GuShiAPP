package com.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.bean.ArticleInfo;
import com.bean.AuthorInfo;
import com.bean.ClassifyInfo;
import com.bean.Question;
import com.bean.UserInfo;
import com.service.ArticleService;
import com.service.TestQuestionService;
import com.service.UserInfoService;
/*
 * 控制后台管理界面
 */
@Controller
@RequestMapping("/manage")
public class ManageController {

	@Autowired
	ArticleService as;
	@Autowired
	TestQuestionService tqs;
	@Autowired
	UserInfoService us;
	//管理员添加文章
	@RequestMapping(value="/addArt",method={RequestMethod.POST})
	public void addArticle(ArticleInfo articleinfo,Model model,HttpServletRequest request,HttpServletResponse response) {
		
		int num2=as.addArticleByManage(articleinfo);
		ArticleInfo art=as.checkArtByTitleAndAuther(articleinfo);
		String classify_name=request.getParameter("classify_name");
		List<ClassifyInfo> list=new ArrayList<>();
		String[] string=classify_name.split("，");
		for(int i=0;i<string.length;i++) {
			ClassifyInfo ci=new ClassifyInfo();
			ci.setArtid(art.getId());
			ci.setClassify_name(string[i]);
			System.out.println(string[i]);
			list.add(ci);
		}
		
		//添加分类信息
		articleinfo.setId(art.getId());
		int num=as.addClassify(list);
		//int num2=as.updateArticle(articleinfo);
		
		if(num>=1 && num2>=1) {
			num=1;
		}else {
			num=0;
		}
		
		try {
			response.getWriter().print(num);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/checkArt",method={RequestMethod.GET})
	public void checkArticle(ArticleInfo articleinfo,Model model,HttpServletResponse response) {
		ArticleInfo art=new ArticleInfo();
		
		art=as.checkArtByTitleAndAuther(articleinfo);
		if(art!=null) {
			try {
				response.getWriter().print(JSON.toJSONString(art));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				response.getWriter().print("不存在该古诗");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	//管理员添加文章
		@RequestMapping(value="/addQuestion",method={RequestMethod.POST})
		public void addQuestion(Question question,HttpServletRequest request,Model model,HttpServletResponse response) {
			
			
			
			int num=tqs.addQuestionByManage(question);
			try {
				response.getWriter().print(num);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		@RequestMapping(value="/addauthor",method={RequestMethod.POST})
		public void addAuthor(AuthorInfo authorinfo,Model model,HttpServletResponse response) {
			
			int num=us.addAuthorInfo(authorinfo);
			try {
				response.getWriter().print(num);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		@RequestMapping(value="/checkauthor",method={RequestMethod.GET})
		public void checkAuthor(AuthorInfo author,Model model,HttpServletResponse response) {
			AuthorInfo authorinfo=us.getAuthorInfo(author);
			
			
			if(authorinfo!=null) {
				try {
					response.getWriter().print(JSON.toJSONString(authorinfo));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				try {
					response.getWriter().print("不存在该作者");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
}
