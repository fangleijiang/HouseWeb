<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  <div class="center_left">
      <ul class="menu">
       
        <li><span class="images"><img src="img/user_nav/wodefabu.png" /></span><span class="menu_name"><a href="user/listUsersAllHouseInfo.action">我的发布(<span style="color: red">${user.numbeOfPostings}</span>)</a></span></li>
        <li><span class="images"><img src="img/user_nav/gerenxiliao.png"/></span><span class="menu_name"><a href="user_jsp/user_info.jsp">个人资料</a></span></li>
        <li><span class="images"><img src="img/user_nav/wodehaoyou.png"/></span><span class="menu_name"><a href="user/userFriends.action">我的好友(<span style="color: red">${sessionScope.friend_size}</span>)</a></span></li>
        <li><span class="images"><img src="img/user_nav/wodedingdan.png"/></span><span class="menu_name"><a href="user/listCart.action">我的预订(<span style="color: red">${sessionScope.cart_size}</span>)</a></span></li>
        <li><span class="images"><img src="img/user_nav/xiugaimima.png"/></span><span class="menu_name"><a href="user_jsp/user_update_password.jsp">修改密码</a></span></li>
        <li><span class="images"><img src="img/user_nav/xiugaitouxiang.png"/></span><span class="menu_name"><a href="user_jsp/user_update_image.jsp">修改头像</a></span></li>
        
     </ul>
      
  
      
    </div>
    
  </body>
</html>
