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
    
    <title>添加管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="js/add_admin.js"></script>
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
      <div>租房网，欢迎您，<span style="color: #C00;font-size: 18px;">${admin.loginName}</span>!!(<a href="">个人资料</a>)
      <center>
      <form action="adminAddadmin.action" method="post">
      <div style="margin-top: 20px;" >	 　登录名：<input name="loginName" type="text" style="width: 250px;height: 30px" id="login_name"><div id="login_div"></div></div>
     <div style="margin-top: 20px;">	 真是姓名：<input name="username" type="text" style="width: 250px;height: 30px"></div>
      <div style="margin-top: 20px;" >	密　　码：<input name="password" type="password" style="width: 250px;height: 30px" id="password1"></div>
      <div style="margin-top: 20px;">	 验证密码：<input name="password2" type="password" style="width: 250px;height: 30px" id="password2"><div id="password4"></div></div>
       <div style="margin-top: 20px;">	性　　别：<select name="sex" style="width: 60px;height: 30px">
							　　　　　　　　　　　　　　　　　　　　<option value="男">男</option>
							　　　　　　　　　　　　　　　　　　　　<option value="女">女</option>
												</select>
						
						</div>
						 
          <div style="margin-top: 20px;">	 手机号码：<input name="phoneNumber" type="text" style="width: 250px;height: 30px"></div>
           <div style="margin-top: 20px;">	邮　　箱：<input name="emailAddress" type="text" style="width: 250px;height: 30px"></div>
      <div style="margin-top: 20px;margin-left: 350px;"><input  type="submit" value="注册" class="submit_btn" id="submit_btn"><input  type="reset" value="重置" class="submit_btn"></div>
      </form>
      </center>
    </div></div>
      <!-- <div class="center_right"></div> -->
       <jsp:include page="../bottom.jsp"></jsp:include>
      </div></div>
  </body>
</html>
