package com.flj.house.dao;



import java.util.List;

import com.flj.house.model.User;

public interface UserDao extends BaseDao<User>{
	
	public boolean loginCheck(User user);//用户登录
	
	public User find_user_by_loginName(String name);//通过名字查找对象
	
	public List<User> find_user_by_address(String address);//通过地点查找对象
	
	public void deleteFriends(int user1_id,int user2_id);//删除好友
	
}
