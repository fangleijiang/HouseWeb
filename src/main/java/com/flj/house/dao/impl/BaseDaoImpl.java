package com.flj.house.dao.impl;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;

import com.flj.house.dao.BaseDao;
import com.flj.house.model.HouseInfo;
import com.flj.house.superdao.SuperDao;


public class BaseDaoImpl<T> extends SuperDao implements BaseDao<T>{

	private Class<T> entity;
	
	public BaseDaoImpl(){
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		entity = (Class<T>) type.getActualTypeArguments()[0];
	}
	public void add(T t) {
		// TODO Auto-generated method stub
		Session session = null;
		try {
			session = super.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(t);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(session!=null){
				session.close();
			}
			
		}
		
	}

	public void delete(T t) {
		// TODO Auto-generated method stub
		Session session = null;
		try {
			session = super.getSessionFactory().openSession();
			session.beginTransaction();
			session.delete(t);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
	}

	@SuppressWarnings("unchecked")
	public T getById(int id) {
		
		Object o = null;
		Session session =null;
		try {
			session = super.getSessionFactory().openSession();
			o = session.get(this.entity, id);
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
			return (T)o;
	}

	public void update(T t) {
		Session session = null;
		try {
			session = super.getSessionFactory().openSession();
			session.beginTransaction();
			session.update(t);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(session!=null){
				session.close();
			}
		}
		
	}

	public List<T> listAll(String sql) {
		Session session = null;
		Query q = null;
		List list = null;
		try {
			session = super.getSessionFactory().openSession();
			q =session.createQuery(sql);
			list = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		finally{
			if(session!=null){
			session.close();
			}
		}
		return list;
		
	}
	
	
	@Override
	public int allCount(String sql) {
		Session session =null;
		List list =null;
		try {
			session = super.getSessionFactory().openSession();
			Query query = session.createQuery(sql);  
			list = query.list();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(session!=null){
			session.close();
			}
		
		return list.size();
	}
	
	
	@Override
	public int pageAccount(int pageSize,int allRow) {
		
		int total = allRow % pageSize == 0 ? allRow / pageSize : allRow
				/ pageSize + 1;
		return total;
	}
	
	
	public Criteria createCriteria(final Criterion... criterions) {
		Criteria criteria = super.getSessionFactory().openSession().createCriteria(entity);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

}
