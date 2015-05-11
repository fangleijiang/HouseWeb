package com.flj.house.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.HouseInfo;
import com.flj.house.model.Impeach;
import com.flj.house.service.HouseInfoService;
import com.flj.house.service.ImpeachService;
import com.flj.house.util.GetDate;

@Controller
@Scope("prototype")
public class ImpeachAction{

	private static final long serialVersionUID = 1L;
	
	private ImpeachService impeachService;

	private HouseInfoService houseInfoService;
	
	public ImpeachService getImpeachService() {
		return impeachService;
	}

	@Autowired
	public void setImpeachService(ImpeachService impeachService) {
		this.impeachService = impeachService;
	}
	
	

	public HouseInfoService getHouseInfoService() {
		return houseInfoService;
	}

	@Autowired
	public void setHouseInfoService(HouseInfoService houseInfoService) {
		this.houseInfoService = houseInfoService;
	}
	
	
	/**
	 * 匿名举报
	 * @param id
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="Anonymous_report")
	public void addAnonymous_report(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		
		String str = URLDecoder.decode(request.getParameter("param"),
				"UTF-8");
		JSONObject jb = new JSONObject();
		// 将json格式的字符串转换为json对象，并取得该对象的login属性值
		String string_id = (String) jb.fromObject(str).get("id");
		int id = Integer.parseInt(string_id);
		String content = (String) jb.fromObject(str).get("content");
		HouseInfo houseInfo = this.houseInfoService.find_HouseInfo_By_id(id);
		Impeach imp = new Impeach();
		imp.setDate(GetDate.getDate());
		imp.setHouseInfo(houseInfo);
		imp.setState("未审核");
		imp.setResion(content);
		this.impeachService.save(imp);
	}
	
	
	
	/**
	 * 遍历全部举报信息
	 * @return
	 */
	@RequestMapping(value="admin/listAllImpeachs")
	public ModelAndView listAllImpeachs(){
		ModelAndView mav = new ModelAndView();
		List<Impeach> list = this.impeachService.List_Impeach();
		mav.addObject("list", list);
		mav.setViewName("../admin_jsp/all_impeach");
		return mav;
	}
	
	
	/**
	 * 审核举报信息，对房屋信息进行减分
	 * @param id
	 * @return
	 */
	@RequestMapping(value="admin/examineAndverify")
	public String examineAndverify(int house_id,int imp_id){
		HouseInfo houseInfo = this.houseInfoService.find_HouseInfo_By_id(house_id);
		Impeach imp = this.impeachService.find_Impeach_By_id(imp_id);
		if(houseInfo.getScores()>0){
			int score = houseInfo.getScores();
			--score;
			houseInfo.setScores(score);
			
		}
		imp.setState("已审核");
		this.impeachService.update(imp);
		this.houseInfoService.update(houseInfo);
		return "redirect:listAllImpeachs.action";
	}
	
	
	@RequestMapping(value="admin/deleteImpeach")
	public String deleteInpeach(int id){
		Impeach imp = this.impeachService.find_Impeach_By_id(id);
		if(imp!=null){
			this.impeachService.delete(imp);
		}
		return "redirect:listAllImpeachs.action";
	}
	
	
}
