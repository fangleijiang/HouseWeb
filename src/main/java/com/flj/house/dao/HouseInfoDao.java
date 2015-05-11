package com.flj.house.dao;

import java.util.List;

import com.flj.house.model.HouseInfo;

public interface HouseInfoDao extends BaseDao<HouseInfo>{
	
	public List<HouseInfo> searchHouseInfo(String searchString);//ģ������
	
	public List<HouseInfo> searchHouseInfo(String rentType,String address);//��ҳƵ������
	
	public List<HouseInfo> list_to_ads(int Random,int limit,String address);//��ҳ���������
	
	public List<HouseInfo> searchHouseInfo(int low,int high,String address);
	

}
