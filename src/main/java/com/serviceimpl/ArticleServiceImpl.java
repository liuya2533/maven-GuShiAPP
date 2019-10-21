package com.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.ArticleInfo;
import com.bean.ClassifyInfo;
import com.bean.CollectionInfo;
import com.mapper.ArticleInfoMapper;
import com.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{

	//自动注入
	@Autowired
	ArticleInfoMapper am;
	

	@Override
	public ArticleInfo articleDetails(int atricleId) {
		// TODO Auto-generated method stub
		return am.articleDetails(atricleId);
	}

	@Override
	public List<ArticleInfo> recommendArt(String[] str) {
		// TODO Auto-generated method stub
		return am.recommendArt(str);
	}

	@Override
	public int addCollect(CollectionInfo collection) {
		// TODO Auto-generated method stub
		return am.addCollect(collection);
	}

	@Override
	public List<ArticleInfo> getMyCollect(int userid) {
		// TODO Auto-generated method stub
		return am.getMyCollect(userid);
	}

	@Override
	public List<ArticleInfo> getSelectType(String type) {
		// TODO Auto-generated method stub
		return am.getSelectType(type);
	}

	@Override
	public List<ArticleInfo> getArtByStyle(ArticleInfo artinfo) {
		// TODO Auto-generated method stub
		return am.getArtByStyle(artinfo);
	}

	@Override
	public int removeCollect(CollectionInfo collection) {
		// TODO Auto-generated method stub
		
		return am.removeCollect(collection);
	}

	@Override
	public List<ArticleInfo> getArtBySearch(ArticleInfo artinfo) {
		// TODO Auto-generated method stub
		return am.getArtBySearch(artinfo);
	}

	@Override
	public List<ArticleInfo> getArtForRhesis() {
		// TODO Auto-generated method stub
		return am.getArtForRhesis();
	}

	@Override
	public int addArticleByManage(ArticleInfo articleinfo) {
		// TODO Auto-generated method stub
		return am.addArticleByManage(articleinfo);
	}

	@Override
	public ArticleInfo checkArtByTitleAndAuther(ArticleInfo articleinfo) {
		// TODO Auto-generated method stub
		return am.checkArtByTitleAndAuther(articleinfo);
	}

	@Override
	public List<String> getInfoByClassfiy(String classify_name) {
		if(classify_name.equals("作者")) {
			return am.getAuthorByClassfiy();
		}else if(classify_name.equals("朝代")) {
			return am.getDynastyByClassfiy();
		}else if(classify_name.equals("类型")) {
			return am.getClassifyByClassfiy();
		}else {
			//诗集
			return am.getPoembookByClassfiy();
		}
		
	}

	@Override
	public List<ArticleInfo> getArtByClassify(Map<String,String> map) {
		// TODO Auto-generated method stub
		return am.getArtByClassify(map);
	}

	@Override
	public int addClassify(List<ClassifyInfo> list) {
		// TODO Auto-generated method stub
		return am.addClassify(list);
	}

	@Override
	public int updateArticle(ArticleInfo article) {
		// TODO Auto-generated method stub
		return am.updateArticle(article);
	}

	@Override
	public List<ClassifyInfo> getClassifyInfoByArtID(int artid) {
		// TODO Auto-generated method stub
		return am.getClassifyInfoByArtID(artid);
	}
	
	
	
}
