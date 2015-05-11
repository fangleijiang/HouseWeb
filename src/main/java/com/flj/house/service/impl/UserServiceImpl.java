package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.UserDao;
import com.flj.house.model.User;
import com.flj.house.service.UserService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	
	

	public UserDao getUserDao() {
		return userDao;
	}

	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void save(User user) {
		this.userDao.add(user);
	}

	public void delete(User user) {
		this.userDao.delete(user);
	}

	public User find_User_By_id(int id) {
		return this.userDao.getById(id);
	}

	public List<User> List_User() {
		String sql = "from User user order by user.id asc";
		return this.userDao.listAll(sql);
	}

	public boolean checkLogin(User user) {
		if(this.userDao.loginCheck(user)){
			return true;
		}
		return false;
	}

	@Override
	public void update(User user) {
		this.userDao.update(user);
	}

	@Override
	public User find_user_by_LoginName(String name) {
		return this.userDao.find_user_by_loginName(name);
	}

	@Override
	public List<User> find_user_by_address(String address) {
		// TODO Auto-generated method stub
		return this.userDao.find_user_by_address(address);
	}

	@Override
	public void deleteFriends(int user1_id, int user2_id) {
	this.userDao.deleteFriends(user1_id, user2_id);
		
	}

	
}
