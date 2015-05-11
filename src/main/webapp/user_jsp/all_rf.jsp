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
    
    <title>求租信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/rental_info.css">
		<link rel="shortcut icon" href="img/web_icon/web_icon.png">

  </head>
  
  <body>
     <div id="content">
     <jsp:include page="../head.jsp"></jsp:include>
   <div id="center">
   <jsp:include page="../left_nav.jsp"></jsp:include>
      <div class="center_center">
      <h2>求租房</h2>
      <hr>
      <table style="font-size: 9px;">
      <c:forEach items="${list}" var="rf">
      <tr style="height: 30px">
      <td style="width: 20px"></td><td style="color: blue;width: 700px;">
     <a href="get_rf_by_id.action?id=${rf.id}"  style="color: blue;">${rf.title}</a> 
      </td>
      <td style="width: 100px;color: #666666" >
      ${rf.price}元
      </td>
      <td style="width: 100px;color: #666666">
      ${rf.householdType}
      </td>
      <td style="width: 200px;color: #666666">
       ${rf.release_time}
      </td>
      </tr>
      </c:forEach>
      </table>
     
      </div>
       
    </div>
    <jsp:include page="../bottom.jsp"></jsp:include>
   </div>
   
  </body>
  </body>
</html>
