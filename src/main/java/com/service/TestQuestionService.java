package com.service;
import java.util.List;
import java.util.Map;

import com.bean.*;

public interface TestQuestionService {

	public List<Question> getQuestionBySelected(Map map);
	public int addQuestionByManage(Question question);
}
