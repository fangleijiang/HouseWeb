package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.AreaInfoDao;
import com.flj.house.dao.CityDao;
import com.flj.house.model.AreaInfo;
import com.flj.house.model.City;
import com.flj.house.service.AreaInfoService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class AreaInfoServiceImpl implements AreaInfoService {

	private AreaInfoDao areainfodao;
	
	
	private CityDao cityDao;
	
	public AreaInfoDao getAreainfodao() {
		return areainfodao;
	}

	@Resource
	public void setAreainfodao(AreaInfoDao areainfodao) {
		this.areainfodao = areainfodao;
	}

	
	public CityDao getCityDao() {
		return cityDao;
	}

	@Resource
	public void setCityDao(CityDao cityDao) {
		this.cityDao = cityDao;
	}

	@Override
	public void save(AreaInfo areainfo) {
		this.areainfodao.add(areainfo);
	}

	@Override
	public void delete(AreaInfo areainfo) {
this.areainfodao.delete(areainfo);
	}

	@Override
	public AreaInfo find_AreaInfo_By_id(int id) {
		return this.areainfodao.getById(id);
	}

	@Override
	public List<AreaInfo> List_AreaInfo() {
		String sql = "from AreaInfo areainfo order by areainfo.id asc";
		return this.areainfodao.listAll(sql);
	}

	@Override
	public void update(AreaInfo areainfo) {
		this.areainfodao.update(areainfo);
	}

	@Override
	public City find_City_by_CityName(String cityName) {
		return this.cityDao.find_City_by_CityName(cityName);
	}

}
