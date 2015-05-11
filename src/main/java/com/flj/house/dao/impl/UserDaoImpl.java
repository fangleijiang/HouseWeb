package com.flj.house.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.flj.house.dao.UserDao;
import com.flj.house.model.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public boolean loginCheck(User user) {
		Query q = null;
		Session session = null;
		List list = null;
		try {
			String hql = "from User user where user.loginName = ? and user.password = ?";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString(0, user.getLoginName());
			q.setString(1, user.getPassword());
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
	public User find_user_by_loginName(String name) {
		Query q = null;
		Session session = null;
		List list = null;
		try {
			String hql = "from User user where user.loginName = ?";
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
			return (User) list.get(0);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> find_user_by_address(String address) {
		Query q = null;
		Session session = null;
		List<User> list = null;
		try {
			String hql = "from User user where user.address like:address order by user.score desc";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString("address", "%" + address + "%");
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
			return list;
		}
	}

	@Override
	public void deleteFriends(int user1_id, int user2_id) {
		Query q = null;
		Session session = null;
		try {
			String hql = "delete from u_u u where u.user1_id = ? and u.user2_id = ?";
			session = super.getSessionFactory().openSession();
			session.beginTransaction();
			q = session.createQuery(hql);
			q.setInteger(0, user1_id);
			q.setInteger(1, user2_id);
			q.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		
	}

}
