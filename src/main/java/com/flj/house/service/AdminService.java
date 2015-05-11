package com.flj.house.service;

import java.util.List;

import com.flj.house.model.Admin;

public interface AdminService {

	public boolean loginCheck(Admin admin);

	public Admin find_admin_by_loginName(String name);

	public void save(Admin admin);

	public void delete(Admin admin);

	public Admin find_Admin_By_id(int id);

	public List<Admin> List_Admin();

	public void update(Admin admin);
}
