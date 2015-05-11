package com.flj.house.model;

import java.util.List;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.CascadeType;

@Entity
@Table(name="t_user")
public class User {
	@Column(length = 20)
	private int id;
	@Column(length = 20)
	private String loginName;//登录名
	@Column(length = 10)
	private String username;//用户真实姓名
	@Column(length = 20)
	private String password;//用户登录密码
	@Column(length = 4)
	private String sex;//用户性别
	@Column(length = 20)
	private String address;//所在所要租房地点
	@Column(length = 10)
	private String age;//用户年龄
	@Column(length = 10000)
	private String discription;//用户简介
	@Column(length = 20)
	private String phoneNumber;//用户手机号码
	@Column(length = 40)
	private String emailAddress;//用户邮箱
	@Column(length = 20)
	private String qqNumber;//用户qq
	@Column(length = 255)
	private String image;//头像
	@Column(length = 20)
	private int numbeOfPostings;//帖子数
	@Column(length = 20)
	private int score;//积分
	@Column(length = 20)
	private String userType;//用户类型，中介，还是个人
	
	
	
	private List<Cart> list_cart;
	
	
	private List<HouseInfo> list_houseInfo;
	
	

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getQqNumber() {
		return qqNumber;
	}

	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}

	/*@OneToMany(mappedBy = "user")
	public List<Comment> getList_comment() {
		return list_comment;
	}

	public void setList_comment(List<Comment> list_comment) {
		this.list_comment = list_comment;
	}*/

	
	@OneToMany(mappedBy = "user")
	public List<Cart> getList_cart() {
		return list_cart;
	}

	public void setList_cart(List<Cart> list_cart) {
		this.list_cart = list_cart;
	}

	/*@ManyToMany
	@JoinTable(name="h_u",
		joinColumns={@JoinColumn(name="houseowners_id")},
		inverseJoinColumns={@JoinColumn(name="user_id")}
		)
	public List<HouseOwners> getList_houseowners() {
		return list_houseowners;
	}

	public void setList_houseowners(List<HouseOwners> list_houseowners) {
		this.list_houseowners = list_houseowners;
	}
*/

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getNumbeOfPostings() {
		return numbeOfPostings;
	}

	public void setNumbeOfPostings(int numbeOfPostings) {
		this.numbeOfPostings = numbeOfPostings;
	}

	@OneToMany(mappedBy = "user")
	public List<HouseInfo> getList_houseInfo() {
		return list_houseInfo;
	}

	public void setList_houseInfo(List<HouseInfo> list_houseInfo) {
		this.list_houseInfo = list_houseInfo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	
	
	
	
	
}
