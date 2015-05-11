package com.flj.house.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;

public interface BaseDao<T> {

	public void add(T t);//添加对象

	public void delete(T t);//删除对象

	public T getById(int id);//通过id查找对象

	public void update(T t);//更新对象

	public List<T> listAll(String sql);//全局遍历

	public int allCount(String sql);//计算数据表中记录行数

	public int pageAccount(int pageSize,int allRow);//按照特定的pageSize，以及行数计算数据的页数
	
	public Criteria createCriteria(final Criterion... criterions);//创建Criteria对象

}
