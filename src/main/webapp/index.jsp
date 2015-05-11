<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>租房网</title>
<link rel="shortcut icon" href="img/web_icon/web_icon.png">
<!-- <script type="text/javascript"
	src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script> -->
<script type="text/javascript">
window.location.href="searchHouseInfoByAddress.action?address=长沙"; 
</script>
</head>
<!-- +remote_ip_info.city -->
<body>
<%--  <%response.sendRedirect("searchHouseInfoByAddress.action"); %> --%>
</body>
</html>
