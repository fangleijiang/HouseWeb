package com.flj.house.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.RentalInformation;
import com.flj.house.service.RentalInformationService;
import com.flj.house.util.GetDate;

@Controller
@Scope("prototype")
public class RentalInformationAction {

	private RentalInformationService rfService;

	public RentalInformationService getRfService() {
		return rfService;
	}

	@Autowired
	public void setRfService(RentalInformationService rfService) {
		this.rfService = rfService;
	}

	@RequestMapping(value = "saveRentalInformation")
	public String save(RentalInformation rf) {
		rf.setRelease_time(GetDate.getDate());
		this.rfService.save(rf);
		return "redirect:list_all_rf.action";
	}

	@RequestMapping(value = "list_all_rf")
	public ModelAndView list_all(String address) {
		ModelAndView mav = new ModelAndView();
		List<RentalInformation> list = this.rfService.List_RentalInformation(address);
		mav.addObject("list", list);
		mav.setViewName("user_jsp/all_rf");
		return mav;
	}
	@RequestMapping(value = "get_rf_by_id")
	public ModelAndView find_by_id(int id){
		ModelAndView mav = new ModelAndView();
		RentalInformation rf = this.rfService.find_RentalInformation_By_id(id);
		mav.addObject("rental_rf", rf);
		mav.setViewName("user_jsp/rental_info");
		return mav;
	}
}
