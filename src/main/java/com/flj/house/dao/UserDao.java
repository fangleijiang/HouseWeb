package com.flj.house.dao;



import java.util.List;

import com.flj.house.model.User;

public interface UserDao extends BaseDao<User>{
	
	public boolean loginCheck(User user);//�û���¼
	
	public User find_user_by_loginName(String name);//ͨ�����ֲ��Ҷ���
	
	public List<User> find_user_by_address(String address);//ͨ���ص���Ҷ���
	
	public void deleteFriends(int user1_id,int user2_id);//ɾ������
	
}
