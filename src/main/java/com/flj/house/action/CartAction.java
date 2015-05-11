package com.flj.house.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.Cart;
import com.flj.house.model.HouseInfo;
import com.flj.house.model.User;
import com.flj.house.service.CartService;
import com.flj.house.service.HouseInfoService;
import com.flj.house.service.UserService;
import com.flj.house.util.GetDate;

@Controller
@Scope("prototype")
public class CartAction {

	private static final long serialVersionUID = 1L;

	private CartService cartService;

	private UserService userService;
	private HouseInfoService houseService;

	public CartService getCartService() {
		return cartService;
	}

	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public HouseInfoService getHouseService() {
		return houseService;
	}

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setHouseService(HouseInfoService houseService) {
		this.houseService = houseService;
	}

	@RequestMapping(value = "user/addHouseToCart")
	public String addHouseToCart(int id, HttpServletRequest request) {
		// ModelAndView mav = new ModelAndView();
		HouseInfo house = this.houseService.find_HouseInfo_By_id(id);
		User user = (User) request.getSession().getAttribute("user");
		Cart cart = new Cart();
		cart.setDate(GetDate.getDate());
		cart.setHouseInfo(house);
		cart.setUser(user);
		user.getList_cart().add(cart);
		this.cartService.save(cart);
		this.userService.update(user);
		return "redirect:individualCenter.action";
	}

	@RequestMapping(value = "user/listCart")
	public ModelAndView ListUserCart(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		List<Cart> list = this.cartService.List_Cart();
		List<Cart> list2 = new ArrayList<Cart>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUser().getId() == user.getId()) {
				list2.add(list.get(i));
			}
		}
		mav.addObject("list", list2);
		mav.setViewName("../user_jsp/user_cart");
		return mav;
	}

	/**
	 * user删除预订信息
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "user/deleteCart")
	public String deleteCart(int id, HttpServletRequest request) {
		Cart cart = this.cartService.find_Cart_By_id(id);
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			user.getList_cart().remove(cart);
			this.userService.update(user);//更新user
		}
		this.cartService.delete(cart);
		return "redirect:listCart.action";
	}
	
	
	@RequestMapping(value = "admin/deleteCart")
	public String deleteCart2(int id, HttpServletRequest request) {
		Cart cart = this.cartService.find_Cart_By_id(id);
		this.cartService.delete(cart);
		return "redirect:listAllCart.action";
	}

	@RequestMapping(value = "admin/listAllCart")
	public ModelAndView listCart() {
		ModelAndView mav = new ModelAndView();
		List<Cart> list = this.cartService.List_Cart();
		mav.addObject("list", list);
		mav.setViewName("../admin_jsp/all_cart");
		return mav;
	}
}
