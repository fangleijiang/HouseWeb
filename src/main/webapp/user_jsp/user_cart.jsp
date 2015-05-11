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
    
    <title>我的预定</title>
    
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
      <div class="user_houses">
      <table id="mytable">
      <tr style="background-color: #98C9CE"><td>id</td><td>标题</td><td>小区</td><td>厅室</td><td>预定日期</td><td>联系人</td><td>手机号码</td><td>删除</td></tr>
      <c:forEach items="${list }" var="cart">
      <tr><td>${cart.id}</td><td><a href="findHouseInfoByid.action?id=${cart.houseInfo.id}">${cart.houseInfo.title}</a></td><td>${cart.houseInfo.houseName }</td><td>${cart.houseInfo.householdType}</td><td>${cart.date }</td><td>${cart.houseInfo.user.username }</td><td>${cart.houseInfo.user.phoneNumber }</td><td><a href="user/deleteCart.action?id=${cart.id }">删除</a></td></tr>
      </c:forEach>
      </table>
      </div>
    </div></div>
      <!-- <div class="center_right"></div> -->
       <jsp:include page="../bottom.jsp"></jsp:include>
      </div></div>
  </body>
</html>
