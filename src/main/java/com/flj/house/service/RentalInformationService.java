package com.flj.house.service;

import java.util.List;

import com.flj.house.model.RentalInformation;

public interface RentalInformationService {

	public void save(RentalInformation rf);

	public void delete(RentalInformation rf);

	public RentalInformation find_RentalInformation_By_id(int id);

	public List<RentalInformation> List_RentalInformation(String address);

	public void update(RentalInformation rf);
}
