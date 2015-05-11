package com.flj.house.dao;

import java.util.List;

import com.flj.house.model.RentalInformation;

public interface RentalInformationDao extends BaseDao<RentalInformation>{

	public List<RentalInformation> searchRentalInfo(String address);//°´ÕÕµØÖ·Ä£ºıÆ¥Åä
}
