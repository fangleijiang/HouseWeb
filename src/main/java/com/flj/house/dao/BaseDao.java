package com.flj.house.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;

public interface BaseDao<T> {

	public void add(T t);//��Ӷ���

	public void delete(T t);//ɾ������

	public T getById(int id);//ͨ��id���Ҷ���

	public void update(T t);//���¶���

	public List<T> listAll(String sql);//ȫ�ֱ���

	public int allCount(String sql);//�������ݱ��м�¼����

	public int pageAccount(int pageSize,int allRow);//�����ض���pageSize���Լ������������ݵ�ҳ��
	
	public Criteria createCriteria(final Criterion... criterions);//����Criteria����

}
