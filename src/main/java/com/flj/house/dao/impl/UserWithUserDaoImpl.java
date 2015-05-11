package com.flj.house.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.flj.house.dao.UserWithUserDao;
import com.flj.house.model.User;
import com.flj.house.model.UserWithUser;

@Repository
public class UserWithUserDaoImpl extends BaseDaoImpl<UserWithUser> implements UserWithUserDao{

	@Override
	public UserWithUser find_U_U_By_userid(int id1, int id2) {
		Query q = null;
		Session session = null;
		List list = null;
		try {
			String hql = "from UserWithUser u_u where u_u.user1.id = ? and u_u.user2.id = ?";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setInteger(0, id1);
			q.setInteger(1, id2);
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
			return (UserWithUser) list.get(0);
		}
	}

}
