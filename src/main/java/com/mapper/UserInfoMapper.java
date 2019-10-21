package com.mapper;
import java.util.List;

import com.bean.*;
/*
 * �û���Ϣ�ӿ�
 */
public interface UserInfoMapper {

	public UserInfo checkUserLogin(UserInfo userinfo);
	public int userRegister(UserInfo userinfo);
	public int updateUserInfo(UserInfo userifo);
	public int addAuthorInfo(AuthorInfo author);
	public AuthorInfo getAuthorInfo(AuthorInfo author);
	public int checkUserEmail(String email);
	public int addtapefile(TapeFile tapefile);
	public int deleteTape(TapeFile tapefile);
	public List<TapeFile> getTapeFile(int userid);
}
