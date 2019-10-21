package com.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Question;
import com.mapper.*;
import com.service.TestQuestionService;
@Service
public class TestQuestionServiceImpl implements TestQuestionService{

	//自动注入
	@Autowired
	TestQuestionMapper tqm;
	@Override
	public List<Question> getQuestionBySelected(Map map) {
		// TODO Auto-generated method stub
		return tqm.getQuestionBySelected(map);
	}
	@Override
	public int addQuestionByManage(Question question) {
		// TODO Auto-generated method stub
		int num=tqm.addQuestionByManage(question);
		return num;
	}
	

}
