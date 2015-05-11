<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
  </head>
  
  <body>
   <div id="bottom">
    <div class="bottom_func">
      <ul>
        <li style="margin-left:0;"><a href="#">加入我们</a></li>
        <li><a href="admin_jsp/login.jsp">管理员登录</a></li>
        <li><a href="#">扩展服务</a></li>
        <li><a href="#">帮助中心</a></li>
        <li><a href="#">联系我们</a></li>
        <li><a href="#">意见反馈</a></li>
        <li><a href="#">隐私声明</a></li>
      </ul>
    </div>
    <div class="bottom_address">Copyright © xiachufang.com  京ICP备13009078号-1   京公网安备11011402000059号</div>
  </div>
  </body>
</html>
