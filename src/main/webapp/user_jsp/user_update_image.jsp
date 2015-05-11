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

<title>修改头像</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/individualCenter.css">
<link rel="shortcut icon" href="img/web_icon/web_icon.png">

</head>

<body>
	<div id="content">
		<jsp:include page="../head.jsp"></jsp:include>
		<div id="center">
			<jsp:include page="user_center_left.jsp"></jsp:include>
			<div class="center_center">
				<div class="nav_div">
					<a href="user/individualCenter.action"><button class="nav_btn">个人中心</button></a><a><button
							class="nav_btn">个人资料</button></a><a><button class="nav_btn">网站导航</button></a>

				</div>
				<div class="update_image">
					<div class="update_image_head">
						<img alt="" src="<%=basePath%>${user.image }" width="80px" height="120px"
							border="1">
					</div>
					<form action="user/update_image.action" method="post"
						enctype="multipart/form-data">
						上传图片*：<input type="file" id="fileName" name="file"> <input
							type="submit" value="上传" class="btn">
					</form>
				</div>
			</div>
			<!-- <div class="center_right"></div> -->
			<jsp:include page="../bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
