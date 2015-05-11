package com.flj.house.superdao;



import javax.annotation.Resource;


import org.hibernate.SessionFactory;

import org.springframework.stereotype.Component;

@Component
public class SuperDao{
	
	private  SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


}
