package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Question;

public interface TestQuestionMapper {

	public List<Question> getQuestionBySelected(Map map);
	public int addQuestionByManage(Question question);
}
