package com.flj.house.util;

import javax.servlet.http.HttpServletRequest;

/**
 * ��¼��ǰurl�����ڵ�¼�󷵻���һ��ҳ��
 * @author fangleijiang
 *
 */
public class LastPage {

	public static void getPage(HttpServletRequest request){
		String ls_URL = new StringBuffer(request.getRequestURL()).toString(); 
		if(request.getQueryString()!=null){
			ls_URL = ls_URL+"?"+request.getQueryString();
		}
		System.out.println("��ַ="+ls_URL);
		request.getSession().setAttribute("ls_URL",ls_URL);
	}
	
}
