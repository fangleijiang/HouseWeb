<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'release_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
$(function(){
$(window).scroll(function(){
var scrollTop = document.body.scrollTop || document.documentElement.scrollTop || 0;
$(".christmas_ad").stop();
var scrollTop2 = (scrollTop+160) - $(".christmas_ad").position().top;
if(scrollTop> 440){
$(".christmas_ad:not(:animated)").animate({top:"+="+scrollTop2+"px"},1000);
}else{
$(".christmas_ad").css("top",370+"px");
}
});
});
</script>

  </head>
  
  <body>
   <div class="christmas_ad" style="width:155px; height:180px; position:absolute; top:65px; right:10px;">
<a href="user_jsp/addhouseinfo.jsp" ><img src="img/release_info.png"/></a>
</div>
  </body>
</html>
