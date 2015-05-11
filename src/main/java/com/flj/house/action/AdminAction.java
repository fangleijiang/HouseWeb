package com.flj.house.action;

import java.io.IOException;
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

import com.flj.house.model.Admin;
import com.flj.house.service.AdminService;
import com.flj.house.util.MD5;
@Controller
@Scope("prototype")
public class AdminAction {

	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	/**
	 * 管理员登录
	 * @param loginName
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value="adminLogin")
	public String adminLogin(String loginName, String password,
			HttpServletRequest request){
		Admin admin = new Admin();
		admin.setLoginName(loginName);
		admin.setPassword(MD5.GetMd5(password));
		if (this.adminService.loginCheck(admin)) {
			Admin admin2 = this.adminService.find_admin_by_loginName(loginName);
			request.getSession().setAttribute("admin", admin2);
			return "admin_jsp/loginSuccess";
		} else {
			return "admin_jsp/login";
		}
		
	}
	
	/**
	 * 添加admin信息
	 * @param admin
	 * @return
	 */
	@RequestMapping(value="admin/adminAddadmin")
	public String adminAddadmin(Admin admin){
		admin.setPassword(MD5.GetMd5(admin.getPassword()));
		admin.setState("未激活");
		this.adminService.save(admin);
		return "redirect:listAlladmin.action";
	}
	
	/**
	 * 查看所有admin
	 * @return
	 */
	@RequestMapping(value = "admin/listAlladmin")
	public ModelAndView ListAllAdmin(){
		ModelAndView mav = new ModelAndView();
		@SuppressWarnings("rawtypes")
		List list = this.adminService.List_Admin();
		mav.addObject("list", list);
		mav.setViewName("../admin_jsp/all_admin");
		return mav;
	}
	
	
	/**
	 * 添加前验证此用户名是否被占用
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value="checkAdminRegister")
	public void checkRegister(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		String str = URLDecoder.decode(request.getParameter("login_name"),
				"UTF-8");
		JSONObject jb = new JSONObject();
		// 将json格式的字符串转换为json对象，并取得该对象的login属性值
		String login_name = (String) jb.fromObject(str).get("login");
		Admin admin = this.adminService.find_admin_by_loginName(login_name);
		if (admin != null) {
			response.getWriter().print("no");// 不能注册
		} else {
			response.getWriter().print("yes");// 允许注册
		}
	}
	
	
	/**
	 * 激活admin用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="admin/ActivateAdmin")
	public String activateAdmin(int id){
		Admin admin = this.adminService.find_Admin_By_id(id);
		if(admin.getState().equals("未激活")){
			admin.setState("已激活");
		}
		this.adminService.update(admin);
		return "redirect:listAlladmin.action";
	}
	
	/**
	 * 删除admin
	 * @param id
	 * @return
	 */
	@RequestMapping(value="admin/deleteAdmin")
	public String deleteAdmin(int id)
	{
		Admin admin = this.adminService.find_Admin_By_id(id);
		if(admin!=null){
			this.adminService.delete(admin);
		}
		return "redirect:listAlladmin.action";
	}	
	
	
	
	
}
