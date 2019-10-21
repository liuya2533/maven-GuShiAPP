package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.AuthorInfo;
import com.bean.TapeFile;
import com.bean.UserInfo;
import com.mapper.UserInfoMapper;
import com.service.UserInfoService;
@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	UserInfoMapper um;
	public UserInfo checkUserLogin(UserInfo userinfo) {
		// TODO Auto-generated method stub
		return um.checkUserLogin(userinfo);
	}
	@Override
	public int userRegister(UserInfo userinfo) {
		// TODO Auto-generated method stub
		int num=um.userRegister(userinfo);
		return num;
	}
	@Override
	public int updateUserInfo(UserInfo userifo) {
		// TODO Auto-generated method stub
		return um.updateUserInfo(userifo);
	}
	@Override
	public int addAuthorInfo(AuthorInfo author) {
		// TODO Auto-generated method stub
		return um.addAuthorInfo(author);
	}
	@Override
	public AuthorInfo getAuthorInfo(AuthorInfo author) {
		// TODO Auto-generated method stub
		return um.getAuthorInfo(author);
	}
	@Override
	public int checkUserEmail(String email) {
		// TODO Auto-generated method stub
		return um.checkUserEmail(email);
	}
	@Override
	public int addtapefile(TapeFile tapefile) {
		// TODO Auto-generated method stub
		return um.addtapefile(tapefile);
	}
	@Override
	public int deleteTape(TapeFile tapefile) {
		// TODO Auto-generated method stub
		return um.deleteTape(tapefile);
	}
	@Override
	public List<TapeFile> getTapeFile(int userid) {
		// TODO Auto-generated method stub
		return um.getTapeFile(userid);
	}

	
}
