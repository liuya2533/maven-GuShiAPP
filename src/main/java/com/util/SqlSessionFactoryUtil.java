package com.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryUtil {

	private static SqlSessionFactoryUtil ssf;
	private SqlSessionFactoryUtil() {}
	public static SqlSessionFactoryUtil getInstences() {
		if(ssf==null) {
			ssf=new SqlSessionFactoryUtil();
		}
		return ssf;
	}
	public  SqlSession getSqlSession()  {
		
		String resource="SqlMapConfig.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactry=new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession sqlSession=sqlSessionFactry.openSession();
			return sqlSession;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
