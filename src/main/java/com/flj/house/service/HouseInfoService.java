package com.flj.house.service;

import java.util.List;




import com.flj.house.model.HouseInfo;

public interface HouseInfoService {

	public void save(HouseInfo houseInfo);

	public void delete(HouseInfo houseInfo);

	public HouseInfo find_HouseInfo_By_id(int id);

	public List<HouseInfo> List_HouseInfo();
	
	public void update(HouseInfo houseInfo);
	
	public List<HouseInfo> searchHouseInfo(String searchString);//模糊搜索
	
	public List<HouseInfo> searchHouseInfo(String rentType, String address);//地点/  类型
	
	public List<HouseInfo> searchHouseInfo(int low, int high, String address); //价格//地点
	
	//随机搜索五个用来做首页的广告
	public List<HouseInfo> list__to_ads(int limit,int pageSize,String address);
	//计算总页数
	public int pageAccount(int pageSize,String sql);

}
