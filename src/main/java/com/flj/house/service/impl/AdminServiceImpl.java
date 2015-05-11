package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.AdminDao;
import com.flj.house.model.Admin;
import com.flj.house.service.AdminService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}

	@Resource
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public boolean loginCheck(Admin admin) {
		return this.adminDao.loginCheck(admin);
	}

	@Override
	public Admin find_admin_by_loginName(String name) {
		return this.adminDao.find_admin_by_loginName(name);
	}

	@Override
	public void save(Admin admin) {
		this.adminDao.add(admin);
	}

	@Override
	public void delete(Admin admin) {
		this.adminDao.delete(admin);
	}

	@Override
	public Admin find_Admin_By_id(int id) {
		return this.adminDao.getById(id);
	}

	@Override
	public List<Admin> List_Admin() {
		String sql = "from Admin admin order by admin.id asc";
		return this.adminDao.listAll(sql);
	}

	@Override
	public void update(Admin admin) {
		this.adminDao.update(admin);
	}

}
