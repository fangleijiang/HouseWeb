package com.flj.house.service.impl;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.HouseInfoDao;
import com.flj.house.model.HouseInfo;
import com.flj.house.service.HouseInfoService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class HouseInfoServiceImpl implements HouseInfoService {

	private HouseInfoDao houseInfoDao;
	
	public HouseInfoDao getHouseInfoDao() {
		return houseInfoDao;
	}

	@Resource
	public void setHouseInfoDao(HouseInfoDao houseInfoDao) {
		this.houseInfoDao = houseInfoDao;
	}

	@Override
	public void save(HouseInfo houseInfo) {
	   this.houseInfoDao.add(houseInfo);	
	}

	@Override
	public void delete(HouseInfo houseInfo) {
		this.houseInfoDao.delete(houseInfo);
	}

	@Override
	public HouseInfo find_HouseInfo_By_id(int id) {
		return this.houseInfoDao.getById(id);
	}

	@Override
	public List<HouseInfo> List_HouseInfo() {
		String sql = "from HouseInfo house order by house.id asc";
		return this.houseInfoDao.listAll(sql);
	}

	@Override
	public void update(HouseInfo houseInfo) {
		this.houseInfoDao.update(houseInfo);
	}

	@Override
	public List<HouseInfo> searchHouseInfo(String searchString) {
		return this.houseInfoDao.searchHouseInfo(searchString);
	}

	/**
	 * 页码为总页数的随机数
	 */
	@Override
	public List<HouseInfo> list__to_ads(int limit,int pageSize,String address) {
		String sql = "from HouseInfo";
		int random = (int) (0+Math.random()*pageAccount(pageSize,sql));//产生一个随机数，在0-最大页数之间产生
		System.out.println("随机数="+random);
		return this.houseInfoDao.list_to_ads(random, limit,address);
	}

	/**
	 * 总页数
	 */
	@Override
	public int pageAccount(int pageSize,String sql) {
		//System.out.println("总页数="+this.houseInfoDao.pageAccount(pageSize, this.houseInfoDao.allCount(sql)));
		return this.houseInfoDao.pageAccount(pageSize, this.houseInfoDao.allCount(sql));
	}

	@Override
	public List<HouseInfo> searchHouseInfo(String rentType, String address) {
		// TODO Auto-generated method stub
		return this.houseInfoDao.searchHouseInfo(rentType, address);
	}

	@Override
	public List<HouseInfo> searchHouseInfo(int low, int high, String address) {
		// TODO Auto-generated method stub
		return this.houseInfoDao.searchHouseInfo(low, high, address);
	}


}
