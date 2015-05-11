package com.flj.house.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name = "t_houseInfo")
public class HouseInfo {
	@Column(length = 10)
	private int id;
	@Column(length = 10)
	private int price;// �۸�
	@Column(length = 300)
	private String title;//����
	@Column(length = 10)
	private String paymentStyle;// �¸����긶
	@Column(length = 20)
	private String rentStyle;// �ⷿģʽ�����⣬����
	@Column(length = 20)
	private String rentArea;// �������
	@Column(length = 20)
	private String fitment;// װ������
	@Column(length = 40)
	private String houseName;// С������
	@Column(length = 20)
	private String address;// ���ݵ�ַ
	@Column(length = 20)
	private String houseFlont;// ����¥��

	private String publishDate;// ��������

	@Column(length = 20)
	private String propertyType;// ��ҵ����
	@Column(length = 20)
	private String houseFace;// ���ݳ���
	
	private String imageUrl;//ͼƬ
	@Column(length = 1000)
	private String housingFurniture;// ���׼Ҿ�
	@Column(length = 20)
	private String householdType;// ���ͣ�һ������
	@Column(length = 10000)
	private String description;// ��������
	
	private int scores;//������Ϣ����

	private User user;
	
	private List<Impeach> list_impeach;

	private List<Comment> list_comment;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaymentStyle() {
		return paymentStyle;
	}

	public void setPaymentStyle(String paymentStyle) {
		this.paymentStyle = paymentStyle;
	}

	public String getRentStyle() {
		return rentStyle;
	}

	public void setRentStyle(String rentStyle) {
		this.rentStyle = rentStyle;
	}

	

	public String getRentArea() {
		return rentArea;
	}

	public void setRentArea(String rentArea) {
		this.rentArea = rentArea;
	}

	public String getFitment() {
		return fitment;
	}

	public void setFitment(String fitment) {
		this.fitment = fitment;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHouseFlont() {
		return houseFlont;
	}

	public void setHouseFlont(String houseFlont) {
		this.houseFlont = houseFlont;
	}

	
	

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getHouseFace() {
		return houseFace;
	}

	public void setHouseFace(String houseFace) {
		this.houseFace = houseFace;
	}




	public String getHousingFurniture() {
		return housingFurniture;
	}

	public void setHousingFurniture(String housingFurniture) {
		this.housingFurniture = housingFurniture;
	}

	
	
	public String getHouseholdType() {
		return householdType;
	}
	
	
	public void setHouseholdType(String householdType) {
		this.householdType = householdType;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(mappedBy = "houseInfo")
	@Cascade(value = {CascadeType.SAVE_UPDATE,CascadeType.DELETE_ORPHAN,CascadeType.ALL})  
	public List<Impeach> getList_impeach() {
		return list_impeach;
	}

	public void setList_impeach(List<Impeach> list_impeach) {
		this.list_impeach = list_impeach;
	}

	@OneToMany(mappedBy = "houseInfo")
	@Cascade(value = {CascadeType.SAVE_UPDATE,CascadeType.DELETE_ORPHAN,CascadeType.ALL})  
	public List<Comment> getList_comment() {
		return list_comment;
	}

	public void setList_comment(List<Comment> list_comment) {
		this.list_comment = list_comment;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getScores() {
		return scores;
	}

	public void setScores(int scores) {
		this.scores = scores;
	}

	

	
	
	
}
