package com.flj.house.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.Comment;
import com.flj.house.model.HouseInfo;
import com.flj.house.model.User;
import com.flj.house.service.HouseInfoService;
import com.flj.house.service.UserService;
import com.flj.house.util.GetDate;
import com.flj.house.util.LastPage;

@Controller("houseInfo_action")
@Scope("prototype")
public class HouseInfoAction {

	private static final long serialVersionUID = 1L;

	private HouseInfoService houseInfoService;

	private UserService userService;

	public HouseInfoService getHouseInfoService() {
		return houseInfoService;
	}

	@Autowired
	public void setHouseInfoService(HouseInfoService houseInfoService) {
		this.houseInfoService = houseInfoService;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * ��ӷ�����Ϣ������������Ϣ
	 * 
	 * @param houseInfo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/addHouseInfo")
	public String addHouseInfo(HouseInfo houseInfo, HttpServletRequest request) {
		String url = (String) request.getSession().getAttribute("house_image");
		houseInfo.setImageUrl("./upload/" + url);
		houseInfo.setPublishDate(GetDate.getDate());
		User user = (User) request.getSession().getAttribute("user");
		houseInfo.setUser(user);
		int numbeOfPostings = user.getNumbeOfPostings();
		numbeOfPostings++;
		user.setNumbeOfPostings(numbeOfPostings);
		this.userService.update(user);
		this.houseInfoService.save(houseInfo);
		return "index";
	}

	/**
	 * �ϴ�����ͼƬ
	 * 
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/upload_image")
	public String uploadImage(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		System.out.println("��ʼ");
		String path = request.getSession().getServletContext()
				.getRealPath("upload");
		String fileName = file.getOriginalFilename();
		request.getSession().setAttribute("house_image", fileName);
		// System.out.println(path);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// ����
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("fileUrl", request.getContextPath() + "/upload/"
				+ fileName);
		return "user_jsp/addhouseinfo";
	}

	/**
	 * ���ݵص�����������Ϣ
	 * 
	 * @param address
	 * @return
	 */
	@RequestMapping(value = "/searchHouseInfoByAddress")
	public ModelAndView searchHouseInfoByAddress(String address) {
		ModelAndView mav = new ModelAndView();
		List<HouseInfo> list = this.houseInfoService.searchHouseInfo(address);
		List<User> list_user = this.userService.find_user_by_address(address);
		List<HouseInfo> list_ads = this.houseInfoService.list__to_ads(5, 5,
				address);
		if (list != null) {
			mav.addObject("list_house", list);
		}
		if (list_ads != null) {
			mav.addObject("list_ads", list_ads);
		}
		if (list_user != null) {
			mav.addObject("list_user", list_user);
		}
		mav.setViewName("web_index");
		return mav;
	}

	@RequestMapping(value = "/switchCity")
	public ModelAndView switchCity(String address) {
		ModelAndView mav = new ModelAndView();
		List<HouseInfo> list = this.houseInfoService.searchHouseInfo(address);
		List<User> list_user = this.userService.find_user_by_address(address);
		List<HouseInfo> list_ads = this.houseInfoService.list__to_ads(5, 5,
				address);
		if (list != null) {
			mav.addObject("list_house", list);
		}
		if (list_ads != null) {
			mav.addObject("list_ads", list_ads);
		}
		if (list_user != null) {
			mav.addObject("list_user", list_user);
		}
		mav.setViewName("switch_index");
		return mav;
	}

	/**
	 * ���շ������ͽ�������
	 * 
	 * @param rentType
	 * @return
	 */
	@RequestMapping(value = "searcheHouseInfoByRentType")
	public ModelAndView searcheHouseInfoByRentType(String rentType,
			String address) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rentType+"------"+address);
		List<HouseInfo> list = this.houseInfoService.searchHouseInfo(rentType,
				address);
		mav.addObject("list_house", list);
		mav.setViewName("house_page/search_result");
		return mav;
	}

	/**
	 * ģ������������Ϣ
	 * 
	 * @param searchStr
	 * @return
	 */
	@RequestMapping(value = "searchLikeInfo")
	public ModelAndView searchLikeInfo(String searchStr) {
		ModelAndView mav = new ModelAndView();
		List<HouseInfo> list = this.houseInfoService.searchHouseInfo(searchStr);
		mav.addObject("list_house", list);
		mav.setViewName("house_page/search_result");
		return mav;

	}

	/**
	 * ͨ��id����������Ϣ
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/findHouseInfoByid")
	public ModelAndView find_HouseInfo_By_id(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// ��ȡ���ݶ���
		HouseInfo houseInfo = this.houseInfoService.find_HouseInfo_By_id(id);
		// ��ȡ���������������ۼ���
		List<Comment> list = houseInfo.getList_comment();
		// ��ȡ������Ϣ
		User houseOwner = houseInfo.getUser();
		mav.addObject("house", houseInfo);
		mav.addObject("comments", list);
		mav.addObject("houseOwner", houseOwner);
		mav.setViewName("house_page/houseInfo");
		return mav;
	}

	/**
	 * Ϊ������Ϣ����....����һ�μ�һ��
	 * 
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "praise")
	public void Praise_house(HttpServletResponse response, int house_id)
			throws IOException {
		System.out.println("----------***-----------" + house_id);
		HouseInfo houseInfo = this.houseInfoService
				.find_HouseInfo_By_id(house_id);
		int score = houseInfo.getScores();
		houseInfo.setScores(++score);
		houseInfo.setId(house_id);
		this.houseInfoService.update(houseInfo);
		response.getWriter().print("success");
	}

	/**
	 * �û�ɾ��������Ϣ
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "user/deleteHouseInfoById")
	public String deleteHouseInfoById1(int id) {
		HouseInfo houseInfo = this.houseInfoService.find_HouseInfo_By_id(id);
		this.houseInfoService.delete(houseInfo);
		return "redirect:listUsersAllHouseInfo.action";
	}
	
	/**
	 * ����Աɾ��������Ϣ
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "admin/deleteHouseInfoById")
	public String deleteHouseInfoById2(int id) {
		HouseInfo houseInfo = this.houseInfoService.find_HouseInfo_By_id(id);
		this.houseInfoService.delete(houseInfo);
		return "redirect:listAllHouseInfo.action";
	}

	/**
	 * �������еķ��ݵ���Ϣ
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "admin/listAllHouseInfo")
	public ModelAndView listAllHouseInfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<HouseInfo> list = this.houseInfoService.List_HouseInfo();
		mav.addObject("list", list);
		mav.setViewName("../admin_jsp/all_houseInfo");
		return mav;
	}

	// ͨ����ͬ�۸�ƥ�䣬����������Ϣ��ͬ�����漰���ص��
	@RequestMapping( value = "selectPrice")
	public ModelAndView low_high_price(int low, int high, String address) {
		ModelAndView mav = new ModelAndView();
		List<HouseInfo> list = this.houseInfoService.searchHouseInfo(low, high, address);
		if(list!=null){
			mav.addObject("list_house", list);
			
		}
		mav.setViewName("house_page/search_result");
		return mav;

	}

}
