package com.flj.user.test;
import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flj.house.model.User;
import com.flj.house.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext-*.xml" })
@WebAppConfiguration
public class testUser {

	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	

	@Test
	public void testSave(){
		User user = new User();
		user.setLoginName("fangleijiang");
		user.setUsername("flj");
		user.setAddress("Hunan");
		user.setAge("12");
		user.setDiscription("ÄãºÃ");
		user.setEmailAddress("15496906999@qq.com");
		user.setPassword("1234556");
		user.setPhoneNumber("15243676422");
		user.setQqNumber("1549690699");
		user.setSex("ÄÐ"); 
		this.userService.save(user);
		
	}
	
	@Test
	public void testLogin(){
		User user = new User();
		user.setLoginName("fangleijiang");
		user.setPassword("1234567");
		System.out.println("-----------------------------------------"+this.userService.checkLogin(user));
		
	}
	
	@Test
	public void testGuanZhu(){
		User user= this.userService.find_User_By_id(1);
		//HouseOwners ho = this.houseOwnersService.find_HouseOwners_By_id(1);
		User user2 = this.userService.find_User_By_id(2);
		List<User> list = new ArrayList<User>();
		list.add(user2);
		//user.setList_user(list);
		this.userService.update(user);
		this.userService.update(user2);
	}
	
	@Test
	public void getAllGuanzhu(){
	User user = this.userService.find_User_By_id(1);
	//List<User> list  =  user.getList_user();
	//System.out.println("----------------------"+list.size());
	}
	}
