package com.flj.house.service;

import java.util.List;

import com.flj.house.model.AreaInfo;
import com.flj.house.model.City;

public interface AreaInfoService {

	public void save(AreaInfo areainfo);

	public void delete(AreaInfo areainfo);

	public AreaInfo find_AreaInfo_By_id(int id);

	public List<AreaInfo> List_AreaInfo();

	public void update(AreaInfo areainfo);
	
	public City find_City_by_CityName(String cityName);
}
