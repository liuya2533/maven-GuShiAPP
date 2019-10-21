package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.*;


public interface ArticleInfoMapper {

	public ArticleInfo articleDetails(int atricleId);
	public List<ArticleInfo> recommendArt(String[] str);
	public int addCollect(CollectionInfo collection);
	public List<ArticleInfo> getMyCollect(int userid);
	public List<ArticleInfo> getSelectType(String type);
	public List<ArticleInfo> getArtByStyle(ArticleInfo artinfo);
	public int removeCollect(CollectionInfo collection);
	public List<ArticleInfo> getArtBySearch(ArticleInfo artinfo);
	public List<ArticleInfo> getArtForRhesis();
	public int addArticleByManage(ArticleInfo articleinfo);
	public ArticleInfo checkArtByTitleAndAuther(ArticleInfo articleinfo);
	//查询所有作者
	public List<String> getAuthorByClassfiy();
	//查询所有朝代
	public List<String> getDynastyByClassfiy();
	//查询所有情景分类
	public List<String> getClassifyByClassfiy();
	//查询所有诗集
	public List<String> getPoembookByClassfiy();
	public List<ArticleInfo> getArtByClassify(Map<String,String> map);
	public int addClassify(List<ClassifyInfo> list);
	public int updateArticle(ArticleInfo article);
	public List<ClassifyInfo> getClassifyInfoByArtID(int artid);
	public List<TapeFile> getTapeFile(int userid);
}
