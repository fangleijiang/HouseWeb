package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.UserWithUserDao;
import com.flj.house.model.UserWithUser;
import com.flj.house.service.UserWithUserService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class UserWithUserServiceImpl implements UserWithUserService{

	private UserWithUserDao userWithuserDao;

	public UserWithUserDao getUserWithuserDao() {
		return userWithuserDao;
	}

	@Resource
	public void setUserWithuserDao(UserWithUserDao userWithuserDao) {
		this.userWithuserDao = userWithuserDao;
	}

	@Override
	public void save(UserWithUser uWu) {
		this.userWithuserDao.add(uWu);
	}

	@Override
	public List<UserWithUser> List_ALL_User_Releation() {
		String sql = "from UserWithUser u_u order by u_u.id desc";
		return this.userWithuserDao.listAll(sql);
	}

	@Override
	public void delete(UserWithUser u_u) {
		this.userWithuserDao.delete(u_u);
	}

	@Override
	public UserWithUser find_U_U_By_userid(int id1, int id2) {
		return this.userWithuserDao.find_U_U_By_userid(id1, id2);
	}
	
	
}
