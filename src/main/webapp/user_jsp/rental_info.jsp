<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>求租信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/rental_info.css">
<link rel="shortcut icon" href="img/web_icon/web_icon.png">

</head>

<body>
	<div id="content">
		<jsp:include page="../head.jsp"></jsp:include>
		<div id="center">
			<!-- <div class="center_left"></div> -->
			<div class="center_center">
				<h2>求租：${rental_rf.title}</h2>
				<hr>
				<br>
				<br> <span style="color: #333333">
					地点：${rental_rf.address}<br>
				<br> 厅室：${rental_rf.householdType }<br>
				<br> 租金：${rental_rf.price }<br>
				<br> 补充*：${rental_rf.description }<br>
				<br> 发布日期：${rental_rf.release_time }<br>
				<br> 最晚入住日期：${rental_rf.time }<br>
				<br> 联系人：${rental_rf.userName }<br>
				<br> 手机号码*：${rental_rf.phoneNumber }<br>
				<br>
				</span>
				<hr>
			</div>
			<jsp:include page="../bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</body>
</html>
