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
    
    <title>查看管理员</title>
    
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
      <div>租房网，欢迎您，<span style="color: #C00;font-size: 18px;">${admin.loginName}</span>!!&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin_jsp/add_admin.jsp">添加管理员</a>
      <div class="user_houses">
      <table id="mytable">
      <tr style="background-color: #98C9CE"><td>id</td><td>姓名</td><td>登录名</td><td>性别</td><td>手机号码</td><td>邮箱号码</td><td>状态</td><td>激活</td><td>修改</td><td>删除</td></tr>
      <c:forEach items="${list }" var="admin">
      <tr><td>${admin.id}</td><td>${admin.username}</td><td>${admin.loginName }</td><td>${admin.sex }</td><td>${admin.phoneNumber }</td><td>${admin.emailAddress }</td><td>${admin.state }</td><td><a href="admin/ActivateAdmin.action?id=${admin.id }">激活</a></td><td>修改</td><td><a href="admin/deleteAdmin.action?id=${admin.id }">删除</a></td></tr>
      </c:forEach>
      </table>
      </div>
    </div></div>
      <!-- <div class="center_right"></div> -->
       <jsp:include page="../bottom.jsp"></jsp:include>
      </div></div>
  </body>
</html>
