package com.flj.house.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.Admin;
import com.flj.house.model.User;
import com.flj.house.util.LastPage;

public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		 HttpSession session=request.getSession();
		 Admin admin = (Admin) session.getAttribute("admin");
		//返回登录前页面辅助类
		 LastPage.getPage(request);
		 if(admin==null){
			 request.getRequestDispatcher("/admin_jsp/login.jsp").forward(request, response);  
				return false;
		 }
		return true;
	}

}
