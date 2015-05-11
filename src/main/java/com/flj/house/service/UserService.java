package com.flj.house.service;

import java.util.List;

import com.flj.house.model.HouseInfo;
import com.flj.house.model.User;

public interface UserService {

	public void save(User user);
	
	public void delete(User user);
	
	public User find_User_By_id(int id);
	
	public List<User> List_User();
	
	public void update(User user);
	
	public boolean checkLogin(User user);
	
	public User find_user_by_LoginName(String name);
	
	public List<User> find_user_by_address(String address);
	
	public void deleteFriends(int user1_id,int user2_id);
}
