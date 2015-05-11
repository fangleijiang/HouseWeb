<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="shortcut icon" href="img/web_icon/web_icon.png">
  </head>
  
  <body>
  <div class="center">
  <div class="image"><img alt="" src="img/web_icon/logo.png" width="370px" height="100px"></div>
  <div class="wrap"> 
  <form action="adminLogin.action" method="post"> 
    <section class="loginForm"> 
      <header> 
        <h1>登录</h1> 
      </header> 
      <div class="loginForm_content"> 
        <fieldset> 
          <div class="inputWrap"> 
            <input type="text" name="loginName" placeholder="请输入登录名" autofocus required> 
          </div> 
          <div class="inputWrap"> 
            <input type="password" name="password" placeholder="请输入密码" required> 
          </div> 
        </fieldset> 
        <fieldset> 
          <input type="checkbox" checked="checked"> 
          <span>下次自动登录</span> 
        </fieldset> 
        <fieldset> 
          <input type="submit" value="登录"> 
          <a href="#">忘记密码？</a> <a href="user_jsp/register.jsp">注册</a> 
        </fieldset> 
      </div> 
    </section> 
  </form> 
</div> 
  </div>
  </body>
</html>
