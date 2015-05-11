package com.flj.house.dao.impl;

import java.util.List;













import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.flj.house.dao.HouseInfoDao;
import com.flj.house.model.HouseInfo;
import com.flj.house.model.User;
@Repository
public class HouseInfoDaoImpl extends BaseDaoImpl<HouseInfo> implements HouseInfoDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<HouseInfo> searchHouseInfo(String searchString) {
		Query q = null;
		Session session = null;
		List<HouseInfo> list = null;
		try {
			String hql = "from HouseInfo house where house.description like:searchString "
					+ "or house.address like:searchString "
					+ "or house.rentStyle like:searchString "
					+ "or house.householdType like:searchString order by house.scores desc";
					
					
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString("searchString", "%" + searchString + "%");
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

	/**
	 * Random为随机页，页码的随机数
	 */

	@Override
	public List<HouseInfo> list_to_ads(int Random, int limit,String address) {
		Criteria criteria = createCriteria();
		criteria.setMaxResults(limit);//查找区间
		criteria.setFirstResult(Random * limit);//随机页作为起点
		criteria.add(Restrictions.like("address", "%"+address+"%"));//通过地点模糊匹配
		criteria.addOrder(Order.asc("id"));//通过id排序
		return criteria.list();
	}

	@Override
	public List<HouseInfo> searchHouseInfo(String rentType, String address) {
		Query q = null;
		Session session = null;
		List<HouseInfo> list = null;
		try {
			String hql = "from HouseInfo house where house.address like:address"
					+ " and house.rentStyle like:searchString "
					+ "order by house.scores desc";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setString("searchString", "%" + rentType + "%");
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
	public List<HouseInfo> searchHouseInfo(int low, int high, String address) {
		Query q = null;
		Session session = null;
		List<HouseInfo> list = null;
		try {
			String hql = "from HouseInfo house where house.price between ? and ?" 
					+ "and house.address like:searchString "
					+ "order by house.scores desc";
			session = super.getSessionFactory().openSession();
			q = session.createQuery(hql);
			session.createQuery(hql);
			q.setInteger(0, low);
			q.setInteger(1, high);
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
