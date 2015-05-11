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
		houseinfo.setAddress("����");
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
		rf.setAddress("����");
		rf.setDescription("�����ڶ���·������ѵ�����ⷿһ���£����û�ж�����һ��һ��һ�����⣬��ô����Ҳ�У�Ҫ���豸��ȫ���г������������䣬����Ƕ���С��������Ҳ���ԣ����붸��С��Խ��Խ�á����з�Դ������ϵ�ҡ�"+
						"��ϵ��ʱ����˵����58ͬ���Ͽ����ģ�лл");
		rf.setHouseholdType("����һ��");
		rf.setPhoneNumber("18942560376");
		rf.setPrice("1500");
		rf.setRelease_time("2015-03-16 22:08");
		rf.setTitle("�����ڶ���·������ѵ�����ⷿһ���£����û�ж�����һ��һ��һ������");
		rf.setUserName("������");
		rf.setLatest_time("�����");
		this.rfService.save(rf);
		}
	}
	
}
