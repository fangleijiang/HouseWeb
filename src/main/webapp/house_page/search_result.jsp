<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>搜索结果</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<link rel="stylesheet" type="text/css" href="css/search_result.css">

<link rel="shortcut icon" href="img/web_icon/web_icon.png">

</head>

<body>
	 <div id="content">
   <jsp:include page="../head.jsp"></jsp:include>
   <div id="center">
   <jsp:include page="../left_nav.jsp"></jsp:include>
      <div class="center_center">
      <div class="select_btn_div"><a><button class="select_btn">长沙出租</button></a><a><button class="select_btn">个人</button></a><a><button class="select_btn">中介</button></a></div>
      <c:forEach items="${list_house }" var="house">
      	<div class="house_info">
              <div class="dis"><a href="#"><img  width="140px" height="106px" src="${house.imageUrl}"/></a></div>
              <div class="dis_name"><div class="first"><a href="findHouseInfoByid.action?id=${house.id}">	
					${house.title}</a>
					</div><br>
					${house.houseName}
					<br>经纪人：${house.user.username}</div>
              <div class="dis_text"><div class="price">${house.price} 元/月</div> </div>
             </div>
      </c:forEach>
     </div>
     <div class="center_right"><img alt="" src="img/ad.png"></div>
    </div>
     <jsp:include page="../bottom.jsp"></jsp:include>
   </div>
    
</body>
</html>
