package com.flj.house.util;

import javax.servlet.http.HttpServletRequest;

/**
 * 记录当前url，用于登录后返回上一个页面
 * @author fangleijiang
 *
 */
public class LastPage {

	public static void getPage(HttpServletRequest request){
		String ls_URL = new StringBuffer(request.getRequestURL()).toString(); 
		if(request.getQueryString()!=null){
			ls_URL = ls_URL+"?"+request.getQueryString();
		}
		System.out.println("地址="+ls_URL);
		request.getSession().setAttribute("ls_URL",ls_URL);
	}
	
}
