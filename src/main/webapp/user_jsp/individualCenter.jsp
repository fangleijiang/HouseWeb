<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
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
       <div class="nav_div"><a href="user/individualCenter.action"><button class="nav_btn">个人中心</button></a><a><button class="nav_btn">个人资料</button></a><a><button class="nav_btn">网站导航</button></a>　</div>
      <div>租房网，欢迎您，<span style="color: #C00;font-size: 18px;">${user.loginName}</span>!!(<a href="">个人资料</a>)
      <br>
      <br>
      	您的个人简介：<span style="color: #C00;font-size: 18px;">${user.discription}</span>
      	 <br>
      <br>
      您目前的积分为：<span style="color: #C00;font-size: 18px;">${user.score }</span>分&nbsp;&nbsp;&nbsp;所发房屋信息数为：<span style="color: #C00;font-size: 18px;">${user.numbeOfPostings }</span>份
      <br><br>
      您所关注的好友如下：
      <br><br>
      <c:forEach items="${user_friends}" var="user">
      <div style="float: left; margin-left: 20px;"><a href="listHouseInfoByUser.action?user_id=${user.id}"><img alt="" src="<%=basePath%>${user.image}" width="55px" height="70px"><br>&nbsp;&nbsp;<span>${user.username}</span></a></div>
      </c:forEach>
      </div>
      </div>
      <div class="center_right"></div>
       <jsp:include page="../bottom.jsp"></jsp:include>
      </div></div>
  </body>
</html>
