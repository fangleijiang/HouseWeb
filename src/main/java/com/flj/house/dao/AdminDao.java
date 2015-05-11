package com.flj.house.dao;

import com.flj.house.model.Admin;

public interface AdminDao extends BaseDao<Admin> {

	public boolean loginCheck(Admin admin);//验证登录

	public Admin find_admin_by_loginName(String name);//通过名字查找
}
