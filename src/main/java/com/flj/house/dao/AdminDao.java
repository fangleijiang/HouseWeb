package com.flj.house.dao;

import com.flj.house.model.Admin;

public interface AdminDao extends BaseDao<Admin> {

	public boolean loginCheck(Admin admin);//��֤��¼

	public Admin find_admin_by_loginName(String name);//ͨ�����ֲ���
}
