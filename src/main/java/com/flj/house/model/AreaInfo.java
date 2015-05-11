package com.flj.house.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "t_areainfo")
public class AreaInfo {
	@Column(length = 10)
	private int id;
	@Column(length = 20)
	private String areaName;
	
	
	private List<City> list_city;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	
	@OneToMany(mappedBy = "areaInfo")
	public List<City> getList_city() {
		return list_city;
	}

	public void setList_city(List<City> list_city) {
		this.list_city = list_city;
	}

	
}
