package com.flj.house.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_rentalInformation")
public class RentalInformation {

	private int id;
	@Column(length = 255)
	private String title;
	@Column(length = 20)
	private String address;
	@Column(length = 20)
	private String price;
	@Column(length = 20)
	private String householdType;// 户型，一室两厅
	@Column(length = 10000)
	private String description;// 其他描述
	
	private String latest_time;//最晚入住时间
	@Column(length = 20)
	private String phoneNumber;//用户手机号码
	@Column(length = 40)
	private String userName;//用户名字
	
	private String release_time;//发布日期

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getHouseholdType() {
		return householdType;
	}

	public void setHouseholdType(String householdType) {
		this.householdType = householdType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public String getLatest_time() {
		return latest_time;
	}

	public void setLatest_time(String latest_time) {
		this.latest_time = latest_time;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRelease_time() {
		return release_time;
	}

	public void setRelease_time(String release_time) {
		this.release_time = release_time;
	}

	
	
}
