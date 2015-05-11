package com.flj.house.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.flj.house.dao.CityDao;
import com.flj.house.model.City;
import com.flj.house.model.User;

@Repository
public class CityDaoImpl extends BaseDaoImpl<City> implements CityDao {
	public City find_City_by_CityName(String cityName){
		Query q = null;
		Session session = null;
		List list = null;
		try {
			String hql = "from City city where city.cityName = ?";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString(0, cityName);
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
			return (City) list.get(0);
		}
	

	}
	
}
