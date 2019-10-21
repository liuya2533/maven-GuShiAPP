package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page")
public class PageController {

	@RequestMapping("/index")
	public String goManageIndex() {
		return "/jsp/manageindex";
	}
	@RequestMapping("/login")
	public String goLogin() {
		return "/jsp/login";
	}
	
	@RequestMapping("/myinfopage")
	public String goMyInfoPage(){
		return "/jsp/myinfopage";
	}
	@RequestMapping("/registerpage")
	public String goRegisterPage(){
		return "/jsp/registerpage";
	}
	@RequestMapping("/searchpage")
	public String goSearchPage(){
		return "/jsp/searchpage";
	}
	
	@RequestMapping("/selectedtestpage")
	public String goTestQuestionPage(){
		return "/jsp/selectedtestpage";
	}
	@RequestMapping("/maganerpage/{page}")
	public String goManagerPage(@PathVariable("page") String page){
		if(page.equals("1")) {
			return "/jsp/manageAddPage";
		}else if(page.equals("2")){
			return "/jsp/AddQuestion";
		}else {
			return "/jsp/manageAddPage";
		}
		
	}
	@RequestMapping("/voice")
	public String goVoiceTestPage(){
		return "/jsp/voicetest";
	}
}
