package com.flj.house.dao;

import com.flj.house.model.City;

public interface CityDao extends BaseDao<City>{

	public City find_City_by_CityName(String cityName);//ͨ���������Ʋ��Ҹ�������
}
