<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		String ls_newURL = (String) session.getAttribute("ls_URL");//从session中读取地址
		if(ls_newURL == null){
			out.println("<script language='javascript'>window.location.href='index.jsp';</script>");
		}
		else{
		out.println("<script language='javascript'>window.location.href='"
				+ ls_newURL + "';</script>");//将页面重定向到保存页面
		}
	%>
</body>
</html>
