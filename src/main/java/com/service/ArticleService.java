package com.service;

import java.util.List;
import java.util.Map;

import com.bean.ArticleInfo;
import com.bean.ClassifyInfo;
import com.bean.CollectionInfo;

public interface ArticleService {

	public ArticleInfo articleDetails(int atricleId);
	public List<ArticleInfo> recommendArt(String[] str);
	public int addCollect(CollectionInfo collection);
	public List<ArticleInfo> getMyCollect(int userid);
	public List<ArticleInfo> getSelectType(String type);
	//通过选择style加载文章
	public List<ArticleInfo> getArtByStyle(ArticleInfo artinfo);
	//取消个人收藏
	public int removeCollect(CollectionInfo collection);
	//搜索功能
	public List<ArticleInfo> getArtBySearch(ArticleInfo artinfo);
	//查询有名言佳句的古诗
	public List<ArticleInfo> getArtForRhesis();
	//后台管理人员添加文章
	public int addArticleByManage(ArticleInfo articleinfo);
	//通过前台传过来是数据查询是否存在此古诗
	public ArticleInfo checkArtByTitleAndAuther(ArticleInfo articleinfo);
	//根据分类查询出不同类别
	public List<String> getInfoByClassfiy(String classify_name);
	//根据分类查询古诗
	public List<ArticleInfo> getArtByClassify(Map<String,String> map);
	//添加古诗情景类型
	public int addClassify(List<ClassifyInfo> list);
	public int updateArticle(ArticleInfo article);
	//
	public List<ClassifyInfo> getClassifyInfoByArtID(int artid);
}
