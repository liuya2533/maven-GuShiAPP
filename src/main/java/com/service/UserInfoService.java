package com.service;
import java.util.List;

import com.bean.*;
public interface UserInfoService {

	public UserInfo checkUserLogin(UserInfo userinfo);
	public int userRegister(UserInfo userinfo);
	public int updateUserInfo(UserInfo userifo);
	public int addAuthorInfo(AuthorInfo author);
	public AuthorInfo getAuthorInfo(AuthorInfo author);
	//查询邮箱
	public int checkUserEmail(String email);
	public int addtapefile(TapeFile tapefile);
	public int deleteTape(TapeFile tapefile);
	public List<TapeFile> getTapeFile(int userid);
}
