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
    
    <title>切换城市</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/web_icon/web_icon.png">
	<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/address.css">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">



$(document).ready(function() {
	var url= window.location.href;
	var index = url.substring(url.lastIndexOf('=') + 1);
	$("#address_span").text(decodeURI(index));
	
	$("button").click(function(){
		window.location.href="searchHouseInfoByAddress.action?address="+decodeURI(index); 
	});
});


</script>
  </head>
  
  <body>
  <div id="content">
   <jsp:include page="head.jsp"></jsp:include>
   <div id="center">
   <jsp:include page="left_nav.jsp"></jsp:include>
      <div class="center_center_right">
       <center><button class="oval_btn">进入 <span style="font-weight: bold;" id="address_span"></span> 站</button>
     <div class="zb_tj">周边城市推荐:<c:forEach items="${list_zb}" var="zb_city">
    <a href="switchCity.action?address=${zb_city.cityName}">${zb_city.cityName}</a> 
     </c:forEach>
     </div></center>
     <c:forEach items="${list_area}" var="areaInfo">
      <div class="province"> <span style="font-weight: bold;color: #b24422">${areaInfo.areaName}</span>
		<c:forEach items="${areaInfo.list_city}" var="city">
		<a href="switchCity.action?address=${city.cityName}">${city.cityName}</a>
		</c:forEach>
</div>
     </c:forEach>
    
      </div>
      </div>
       
       <jsp:include page="bottom.jsp"></jsp:include>
    </div>
   </div>
  </body>
</html>
