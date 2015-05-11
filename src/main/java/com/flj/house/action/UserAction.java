package com.flj.house.action;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.HouseInfo;
import com.flj.house.model.User;
import com.flj.house.model.UserWithUser;
import com.flj.house.service.UserService;
import com.flj.house.service.UserWithUserService;
import com.flj.house.util.MD5;


/**
 * userAction
 * @author fangleijiang
 *
 */
@Controller
@Scope("prototype")
public class UserAction {

	private UserService userService;

	private boolean flag = false;

	private UserWithUserService userWithuserSerive;

	public UserService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserWithUserService getUserWithuserSerive() {
		return userWithuserSerive;
	}

	@Autowired
	public void setUserWithuserSerive(UserWithUserService userWithuserSerive) {
		this.userWithuserSerive = userWithuserSerive;
	}

	/**
	 * ����û����û�ע��
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register")
	public String register(User user) {
		if ((user.getSex()).equals("��")) {
			user.setImage("img/head_img/boy.png");
		} else {
			user.setImage("img/head_img/girl.png");
		}
		user.setPassword(MD5.GetMd5(user.getPassword()));
		this.userService.save(user);
		return "index";
	}

	/**
	 * �����û���Ϣ
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "updateUser")
	public String updateUser(User user) {
		User user2 = this.userService.find_User_By_id(user.getId());
		user2.setLoginName(user.getLoginName());
		user2.setUsername(user.getUsername());
		user2.setAddress(user.getAddress());
		user2.setAge(user.getAge());
		user2.setDiscription(user.getDiscription());
		user2.setPhoneNumber(user.getPhoneNumber());
		user2.setEmailAddress(user.getEmailAddress());
		user2.setQqNumber(user.getQqNumber());
		user2.setUserType(user.getUserType());
		this.userService.update(user2);
		return "redirect:individualCenter.action";
	}

	/**
	 * �û�ע����֤������ע����ͬ�û������û�������ע���ʱ����Ҫ����Ƿ���û����Ѿ���ע����
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkRegister")
	public void checkRegister(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String str = URLDecoder.decode(request.getParameter("login_name"),
				"UTF-8");
		JSONObject jb = new JSONObject();
		// ��json��ʽ���ַ���ת��Ϊjson���󣬲�ȡ�øö����login����ֵ
		String login_name = (String) jb.fromObject(str).get("login");
		User u = this.userService.find_user_by_LoginName(login_name);
		System.out.println(u);
		if (u != null) {
			response.getWriter().print("no");// ����ע��
		} else {
			response.getWriter().print("yes");// ����ע��
		}

	}

	/**
	 * �û���¼
	 * 
	 * @param loginName
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "userlogin")
	public String login(String loginName, String password,
			HttpServletRequest request) {
		User user = new User();
		user.setLoginName(loginName);
		user.setPassword(MD5.GetMd5(password));
		if (this.userService.checkLogin(user)) {
			User user2 = this.userService.find_user_by_LoginName(loginName);
			request.getSession().setAttribute("user", user2);
			return "user_jsp/loginSuccess";
		} else {
			return "user_jsp/login";
		}
	}

	/**
	 * �û���¼
	 * 
	 * @param loginName
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "loginOut")
	public String loginOut(String loginName, String password,
			HttpServletRequest request) {
		request.getSession().setAttribute("user", null);
		return "index";
	}

	/**
	 * �û��鿴��������
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "user/individualCenter")
	public ModelAndView individualCenter(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");

		if (user == null) {
			mav.setViewName("../user_jsp/login.jsp");
		} else {
			List<UserWithUser> user_friends = this.userWithuserSerive
					.List_ALL_User_Releation();
			List<User> users_friend = new ArrayList<User>();
			for (int i = 0; i < user_friends.size(); i++) {
				if (user_friends.get(i).getUser1().getId() == user.getId()) {
					users_friend.add(user_friends.get(i).getUser2());
				}
			}
			int cart_size = user.getList_cart().size();
			mav.addObject("user", user);
			mav.addObject("user_friends", users_friend);
			request.getSession().setAttribute("friend_size",
					users_friend.size());
			request.getSession().setAttribute("cart_size", cart_size);
			mav.setViewName("../user_jsp/individualCenter");
		}
		return mav;
	}

	/**
	 * user֮�以���ע
	 * 
	 * @param request
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "userAttentionuser")
	public void userAttentionuser(HttpServletRequest request, int id,
			HttpServletResponse response) throws IOException {
		try {
			User user = this.userService.find_User_By_id(id);
			User user2 = (User) request.getSession().getAttribute("user");

			if (user2 == null || user == null) {// ����û�û�е�¼���߼�����ע���û������ڣ���ôֱ��ִֹͣ��
				response.getWriter().print("failure");// ��עʧ��
				return;
			} else if (user != null && user2 != null) {
				List<UserWithUser> list_u_u = this.userWithuserSerive
						.List_ALL_User_Releation();
				// ����Ƿ��Ѿ��й�ע���û�
				for (int i = 0; i < list_u_u.size(); i++) {
					if ((list_u_u.get(i).getUser1().getId()) == (user2.getId())
							&& (list_u_u.get(i).getUser2().getId()) == (user
									.getId())) {
						flag = true;
						System.out.println("-----------------------" + flag);
						return;
					}
				}
				// ���û�й�ע���û����Ϳ��Թ�ע
				if (flag == false) {
					int score = user.getScore();
					score++;
					user.setScore(score);
					this.userService.update(user);
					UserWithUser u_u = new UserWithUser();
					u_u.setUser1(user2);
					u_u.setUser2(user);
					this.userWithuserSerive.save(u_u);
					response.getWriter().print("success");// ��ע�ɹ�
					return;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * ����user����ע�ĺ���
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "user/userFriends")
	public ModelAndView userFriends(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		List<UserWithUser> user_friends = this.userWithuserSerive
				.List_ALL_User_Releation();
		List<User> users_friend = new ArrayList<User>();
		for (int i = 0; i < user_friends.size(); i++) {
			if (user_friends.get(i).getUser1().getId() == user.getId()) {
				users_friend.add(user_friends.get(i).getUser2());
			}
		}
		mav.addObject("user_friends", users_friend);
		mav.setViewName("../user_jsp/user_friends");
		return mav;

	}

	/**
	 * ɾ����������
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "deleteUserFriends")
	public String deleteUserFriends(int id, HttpServletRequest request,
			int user_id) {
		UserWithUser u_u = this.userWithuserSerive.find_U_U_By_userid(user_id,
				id);
		this.userWithuserSerive.delete(u_u);
		return "redirect:userFriends.action";
	}

	/**
	 * ��ȡ�õ�¼�û������������з�����Ϣ
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "user/listUsersAllHouseInfo")
	public ModelAndView listUsersAllHouseInfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		List<HouseInfo> list = user.getList_houseInfo();
		mav.addObject("list_house", list);
		mav.setViewName("../user_jsp/user_houseInfo");
		return mav;

	}

	/**
	 * ��֤������
	 * 
	 * @param request
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "user/updatePassword")
	public String updatePassword(HttpServletRequest request, String password) {
		String md5_pass = MD5.GetMd5(password);
		User user = (User) request.getSession().getAttribute("user");
		if (md5_pass.equals(user.getPassword())) {
			return "../user_jsp/send_new_pass";
		}
		return "../user_jsp/user_update_password";
	}

	/**
	 * ����������
	 * 
	 * @param request
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "sendNewPassword")
	public String sendNewPassword(HttpServletRequest request, String password) {
		User user = (User) request.getSession().getAttribute("user");
		String md5_pass = MD5.GetMd5(password);
		user.setPassword(md5_pass);
		this.userService.update(user);
		return "redirect:individualCenter.action";
	}

	/**
	 * �ϴ�����ͼƬ
	 * 
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "user/update_image")
	public String uploadImage(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		System.out.println("��ʼ");
		String path = request.getSession().getServletContext()
				.getRealPath("upload");
		String fileName = file.getOriginalFilename();
		// request.getSession().setAttribute("house_image", fileName);
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
		User user = (User) request.getSession().getAttribute("user");
		user.setImage("/upload/" + fileName);
		this.userService.update(user);
		return "../user_jsp/user_update_image";
	}

	/**
	 * ���������û���Ϣ
	 * 
	 * @return
	 */
	@RequestMapping(value = "admin/listAllUser")
	public ModelAndView listAllUser() {
		ModelAndView mav = new ModelAndView();
		List<User> list = this.userService.List_User();
		mav.addObject("list", list);
		mav.setViewName("../admin_jsp/all_user");
		return mav;
	}

	/**
	 * ����ָ���û������ķ�����Ϣ
	 * 
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value = "listHouseInfoByUser")
	public ModelAndView listHouseInfoByUser(int user_id) {
		ModelAndView mav = new ModelAndView();
		User user = this.userService.find_User_By_id(user_id);
		List<HouseInfo> list = user.getList_houseInfo();
		if (list != null) {
			mav.addObject("list_house", list);
		}
		mav.setViewName("house_page/search_result");
		return mav;
	}

	/**
	 * ͨ��idɾ��user
	 * @author fangleijiang
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "admin/deleteUser")
	public String deleteUserById(int id) {
		User user = this.userService.find_User_By_id(id);
		if (user != null) {
			this.userService.delete(user);
		}
		return "redirect:listAllUser.action";
	}

}
