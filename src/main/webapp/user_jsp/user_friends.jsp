<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的好友</title>
    
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
       <div class="nav_div"><a href="individualCenter.action"><button class="nav_btn">个人中心</button></a><a><button class="nav_btn">个人资料</button></a><a><button class="nav_btn">网站导航</button></a>　</div>
      <div>租房网，欢迎您，<span style="color: #C00;font-size: 18px;">${user.loginName}</span>!!(<a href="">个人资料</a>)
      <div class="user_houses">
      <table id="mytable">
      <tr style="background-color: #98C9CE"><td>id</td><td>姓名</td><td>姓名</td><td>地址</td><td>手机号码</td><td>删除</td></tr>
      <c:forEach items="${user_friends }" var="user_friend">
      <tr><td>${user_friend.id}</td><td><a href="listHouseInfoByUser.action?user_id=${user.id}">${user_friend.username}</a></td><td>${user_friend.sex }</td><td>${user_friend.address }</td><td>${user_friend.phoneNumber }</td><td><a href="deleteUserFriends.action?id=${user_friend.id }&&user_id=${user.id}">删除</a></td></tr>
      </c:forEach>
      </table>
      </div>
    </div></div>
      <!-- <div class="center_right"></div> -->
       <jsp:include page="../bottom.jsp"></jsp:include>
      </div></div>
  </body>
</html>
