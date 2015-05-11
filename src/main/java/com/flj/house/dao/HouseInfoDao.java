package com.flj.house.dao;

import java.util.List;

import com.flj.house.model.HouseInfo;

public interface HouseInfoDao extends BaseDao<HouseInfo>{
	
	public List<HouseInfo> searchHouseInfo(String searchString);//模糊搜索
	
	public List<HouseInfo> searchHouseInfo(String rentType,String address);//首页频道搜索
	
	public List<HouseInfo> list_to_ads(int Random,int limit,String address);//首页广告区搜索
	
	public List<HouseInfo> searchHouseInfo(int low,int high,String address);
	

}
