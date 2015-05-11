package com.flj.user.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.flj.house.model.HouseInfo;
import com.flj.house.model.RentalInformation;
import com.flj.house.service.HouseInfoService;
import com.flj.house.service.RentalInformationService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext-*.xml" })
@WebAppConfiguration
public class testHouseInfo {

	private HouseInfoService houseinfoService;

	public HouseInfoService getHouseinfoService() {
		return houseinfoService;
	}

	@Resource
	public void setHouseinfoService(HouseInfoService houseinfoService) {
		this.houseinfoService = houseinfoService;
	}
	
	private RentalInformationService rfService;
	

	public RentalInformationService getRfService() {
		return rfService;
	}
@Resource
	public void setRfService(RentalInformationService rfService) {
		this.rfService = rfService;
	}

	@Test
	public void testSave() {
		//User user = new User();
		//user.setId(1);
		HouseInfo houseinfo = new HouseInfo();
		houseinfo.setAddress("湖南");
		//houseinfo.setUser(user);
		this.houseinfoService.save(houseinfo);

	}

	@Test
	public void search(){
		List list = this.houseinfoService.searchHouseInfo("a");
		System.out.println("------------------"+list.size());
	}
	
	@Test
	public void testAddRental(){
		for(int i=0;i<20;i++){
		RentalInformation rf = new RentalInformation();
		rf.setAddress("晋中");
		rf.setDescription("因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。"+
						"联系我时，请说是在58同城上看到的，谢谢");
		rf.setHouseholdType("三室一厅");
		rf.setPhoneNumber("18942560376");
		rf.setPrice("1500");
		rf.setRelease_time("2015-03-16 22:08");
		rf.setTitle("因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租");
		rf.setUserName("李先生");
		rf.setLatest_time("三天后");
		this.rfService.save(rf);
		}
	}
	
}
