package com.flj.house.service;

import java.util.List;

import com.flj.house.model.User;
import com.flj.house.model.UserWithUser;


public interface UserWithUserService {

	public void save(UserWithUser uWu);
	
	public List<UserWithUser>  List_ALL_User_Releation();
	
	public void delete(UserWithUser u_u);
	
	public UserWithUser find_U_U_By_userid(int id1, int id2);
}
