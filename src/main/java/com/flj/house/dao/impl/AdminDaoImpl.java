package com.flj.house.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.flj.house.dao.AdminDao;
import com.flj.house.model.Admin;

@Repository
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao{

	@Override
	public boolean loginCheck(Admin admin) {
			Query q = null;
			Session session = null;
			List list = null;
			try {
				String hql = "from Admin admin where admin.loginName = ? and admin.password = ? and admin.state = ?";
				session = super.getSessionFactory().openSession();
				q = session.createQuery(hql);
				session.createQuery(hql);
				q.setString(0, admin.getLoginName());
				q.setString(1, admin.getPassword());
				q.setString(2, "ÒÑ¼¤»î");
				list = q.list();

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
				if(session!=null){
					session.close();
				}
			}
			if (list.size() == 0) {
				return false;
			} else {
				return true;
			}
	}

	@Override
	public Admin find_admin_by_loginName(String name) {
		Query q = null;
		Session session = null;
		List list = null;
		try {
			String hql = "from Admin admin where admin.loginName = ?";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString(0, name);
			list = q.list();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		if (list.size() == 0) {
			return null;
		} else {
			return (Admin) list.get(0);
		}
	}

	
}
