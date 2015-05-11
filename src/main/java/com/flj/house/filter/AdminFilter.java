package com.flj.house.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.flj.house.model.Admin;
import com.flj.house.util.LastPage;

/**
 * 过滤需要拦截的jsp
 * @author fangleijiang
 *
 */
public class AdminFilter  implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
       // HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();	
        Admin admin = (Admin)session.getAttribute("admin");
        LastPage.getPage(httpServletRequest);
        if(admin==null){
        	System.out.println("过滤器执行，阻止通过！");
        	request.getRequestDispatcher("/admin_jsp/login.jsp").forward(request, response);  
        }
        else{
        	 chain.doFilter(request, response);
        }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}
