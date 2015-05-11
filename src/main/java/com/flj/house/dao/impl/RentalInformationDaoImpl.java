package com.flj.house.dao.impl;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.flj.house.dao.RentalInformationDao;
import com.flj.house.model.HouseInfo;
import com.flj.house.model.RentalInformation;

@Repository
public class RentalInformationDaoImpl extends BaseDaoImpl<RentalInformation> implements RentalInformationDao {

	@Override
	public List<RentalInformation> searchRentalInfo(String address) {
		Query q = null;
		Session session = null;
		List<RentalInformation> list = null;
		try {
			String hql = "from RentalInformation rf where rf.address like:searchString order by rf.id desc";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString("searchString", "%" + address + "%");
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

	
}
