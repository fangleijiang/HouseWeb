package com.flj.house.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.AreaInfo;
import com.flj.house.model.City;
import com.flj.house.service.AreaInfoService;

@Controller
public class AreaInfoAction{

	private static final long serialVersionUID = 1L;
	
	private AreaInfoService areaInfoService;
	

	public AreaInfoService getAreaInfoService() {
		return areaInfoService;
	}

	@Resource
	public void setAreaInfoService(AreaInfoService areaInfoService) {
		this.areaInfoService = areaInfoService;
	}

	/**
	 * 列出所有地点信息
	 * 查找周边城市
	 * @param address
	 * @return
	 */
	@RequestMapping(value = "/listAreaInfo")
	public ModelAndView listAreaInfo(String address){
		ModelAndView mav = new ModelAndView();
		List<AreaInfo> list = this.areaInfoService.List_AreaInfo(); 
		System.out.println("------------------------"+address);
		City city = this.areaInfoService.find_City_by_CityName(address);
		if(city!=null){
		AreaInfo province = city.getAreaInfo();
		List<City> list_zb = province.getList_city();
		if(list_zb!=null){
			mav.addObject("list_zb", list_zb);
		}
		
		}
		if(list!=null){
			mav.addObject("list_area", list);
		}
		
		mav.setViewName("address");
		//System.out.println("==============="+address);
		return mav;
	}
	
	
	
	
}
