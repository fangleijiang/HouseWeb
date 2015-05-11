package com.flj.house.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.flj.house.dao.RentalInformationDao;
import com.flj.house.model.RentalInformation;
import com.flj.house.service.RentalInformationService;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class RentalInformationServiceImpl implements RentalInformationService{

	private RentalInformationDao rfDao;
	
	public RentalInformationDao getRfDao() {
		return rfDao;
	}
	@Resource
	public void setRfDao(RentalInformationDao rfDao) {
		this.rfDao = rfDao;
	}

	@Override
	public void save(RentalInformation rf) {
		this.rfDao.add(rf);;
	}

	@Override
	public void delete(RentalInformation rf) {
		this.rfDao.delete(rf);
	}

	@Override
	public RentalInformation find_RentalInformation_By_id(int id) {
		// TODO Auto-generated method stub
		return this.rfDao.getById(id);
	}

	@Override
	public List<RentalInformation> List_RentalInformation(String address) {
		return this.rfDao.searchRentalInfo(address);
	}

	@Override
	public void update(RentalInformation rf) {
		this.rfDao.update(rf);
	}

}
