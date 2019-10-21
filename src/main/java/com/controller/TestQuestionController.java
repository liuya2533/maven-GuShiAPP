package com.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bean.Question;
import com.service.TestQuestionService;

@Controller
@RequestMapping("/selectedTest")
public class TestQuestionController {

	@Autowired
	TestQuestionService tqs;
	@RequestMapping(value="/",method={RequestMethod.GET})
	public String loadTestQuestion(HttpServletRequest request,Model model,HttpSession session) {
		String type=request.getParameter("type");
		String dynasty=request.getParameter("dynasty");
		Map<String,String> map=new TreeMap();
		map.put("selectType", type);
		if(dynasty.equals("唐诗")) {
			map.put("dynasty", "唐");
		}else if(dynasty.equals("宋词")) {
			map.put("dynasty", "宋");
		}else if(dynasty.equals("文言文")) {
			map.put("type", dynasty);
		}else if(dynasty.equals("随机测试")){
			//map.put("dynasty", dynasty);
		}
		Map questionMap=new TreeMap();
		questionMap.put("type", type);
		questionMap.put("dynasty", dynasty);
		List<Question> questionList=tqs.getQuestionBySelected(map);
        questionMap.put("questionList", questionList);
		model.addAttribute("questionMap", questionMap);
		return "/jsp/testquestionpage";
	}
	@RequestMapping(value = "/servehotselectiveajax")
    @ResponseBody
    public void servehotselectiveajax(HttpServletRequest req,HttpServletResponse resp,@RequestBody JSONObject obj) {
        int count=0;
    	String data=obj.toJSONString();
    	//解析json数据
    	JSONObject json = JSON.parseObject(data);
    	
    	int grade=json.getInteger("grade");
    	//int[] queArr=json.getString("modifyArr");
	}
}
