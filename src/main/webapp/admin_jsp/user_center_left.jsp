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
	

  </head>
  
  <body>
  <div class="center_left">
      <ul class="menu">
       
        <li><span class="images"><img src="img/user_nav/wodefabu.png" /></span><span class="menu_name"><a href="admin/listAllHouseInfo.action">管理房屋信息</a></span></li>
        <li><span class="images"><img src="img/user_nav/gerenxiliao.png"/></span><span class="menu_name"><a href="admin/listAllUser.action">管理用户信息</a></span></li>
        <li><span class="images"><img src="img/user_nav/wodehaoyou.png"/></span><span class="menu_name"><a href="admin/listAlladmin.action">查看管理员</a></span></li>
        <li><span class="images"><img src="img/user_nav/wodedingdan.png"/></span><span class="menu_name"><a href="admin/listAllCart.action">订单管理</a></span></li>
        <li><span class="images"><img src="img/user_nav/xiugaimima.png"/></span><span class="menu_name"><a href="admin/listAllComments.action">评论管理</a></span></li>
        <li><span class="images"><img src="img/user_nav/jubao.png"/></span><span class="menu_name"><a href="admin/listAllImpeachs.action">举报信息管理</a></span></li>
        <li><span class="images"><img src="img/user_nav/address.png"/></span><span class="menu_name"><a href="admin_jsp/address_manage.jsp">地点信息管理</a></span></li>
        <li><span class="images"><img src="img/user_nav/ads.png"/></span><span class="menu_name"><a href="admin_jsp/ads_manage.jsp">首页广告管理</a></span></li>
     </ul>
      
  
      
    </div>
    
  </body>
</html>
