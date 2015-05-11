package com.flj.house.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.flj.house.model.User;
import com.flj.house.util.LastPage;

/**
 * 拦截需要提前登录才能操作的action请求
 * @author fangleijiang
 *
 */
public class LoginInterceptor implements HandlerInterceptor{

	 private final Logger log = LoggerFactory.getLogger(LoginInterceptor.class);  
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
		 User user = (User) session.getAttribute("user");
		//返回登录前页面辅助类
		 LastPage.getPage(request);
		 log.info("Interceptor开始"); 
		if(user==null){
			log.info("Interceptor：跳转到login页面！");  
            request.getRequestDispatcher("/user_jsp/login.jsp").forward(request, response);  
			return false;
		}
		return true;
	}

}
