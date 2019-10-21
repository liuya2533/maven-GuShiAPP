package com.controller;
import com.bean.*;
import com.service.UserInfoService;
import com.util.MD5;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserInfoController {

	@Autowired
	UserInfoService us;
	@RequestMapping(value="/login",method= {RequestMethod.POST})
	public String userLogin(String email,String password,HttpSession session) {
		System.out.println(email+":"+password);
		UserInfo userinfo=new UserInfo();
		userinfo.setPassword(MD5.MD5(password));
		userinfo.setEmail(email);
		userinfo=us.checkUserLogin(userinfo);
		if(userinfo==null) {
			System.out.println("登录失败");

				return "/jsp/login";

			
		}else {
			System.out.println("登录成功");
			session.setAttribute("userinfo", userinfo);
			return "redirect:/article/recommend";
			
		}
	}
	@RequestMapping(value="/managerlogin",method= {RequestMethod.POST})
	public String managerLogin(String email,String password,HttpSession session) {
		System.out.println(email+":"+password);
		UserInfo userinfo=new UserInfo();
		System.out.println(MD5.MD5(password));
		userinfo.setPassword(MD5.MD5(password));
		userinfo.setEmail(email);
		userinfo=us.checkUserLogin(userinfo);
		if(userinfo==null) {
			System.out.println("登录失败");
				return "/jsp/manageindex";
		}else {
		if(userinfo.getPower()==1) {
				System.out.println("登录成功");
				session.setAttribute("userinfo", userinfo);
				return "/jsp/manageAddPage";
		}else {
			return "/jsp/manageindex";
		}
		}
	}
	@RequestMapping(value="/register",method= {RequestMethod.POST})
	public String userRegister(UserInfo userinfo) {
		System.out.println(MD5.MD5(userinfo.getPassword()));
		userinfo.setPassword(MD5.MD5(userinfo.getPassword()));
		int num=us.userRegister(userinfo);
		if(num==1) {
			System.out.println("注册成功");
			return "/jsp/login";
		}else {
			System.out.println("失败成功");
			return "/jsp/registerpage";
		}
	}
	@RequestMapping(value="/loginout",method= {RequestMethod.GET})
	public String userloginout(HttpSession session) {
		
		 session.invalidate();
		 return "redirect:/article/recommend";
		
	}
	
	@RequestMapping(value="/checkemail",method= {RequestMethod.GET})
	public void checkEmail(String email,HttpServletResponse response) {
		
		int num=us.checkUserEmail(email);
		
				try {
					response.getWriter().println(num);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
}
