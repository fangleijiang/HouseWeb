<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>求租</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="shortcut icon" href="img/web_icon/web_icon.png">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/addhouseinfo.css">
<link rel="shortcut icon" href="img/web_icon/web_icon.png">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
</head>

<body>
	 <div id="content">
     <jsp:include page="../head.jsp"></jsp:include>
   <div id="center">
   <jsp:include page="../left_nav.jsp"></jsp:include>
      <div class="center_center">
      <center><h2>发布求租</h2>
 
 <form action="saveRentalInformation.action" method="post" >  
  <table style="font-size: 14px;
	color: #b24422;">
	<tr style="height: 50px"><td>标题*:</td><td colspan="3"><input name="title" type="text" style="width: 400px;height: 28px"></td></tr>
	<tr style="height: 50px"><td>求租地点*:</td><td ><input name="address" type="text" style="height: 28px"></td><td>租金*:</td><td><input name="price" type="text" style="height: 28px"></td></tr>
 	<tr style="height: 50px"><td>最晚入住时间*：</td><td><input name="time"  style="height: 28px"></td><td>厅室*：</td><td><input name="householdType"  style="height: 28px"></td></tr>
 	<tr style="height: 50px"><td>手机或电话*：</td><td><input name="phoneNumber"  style="height: 28px"></td><td>联系人呢*：</td><td ><input name="userName"  style="height: 28px"></td></tr>
 	<tr style="height: 100px"><td>补充说明*：</td><td colspan="3"><textarea name="description"  cols="55" rows="5"></textarea></td></tr>
  </table>
   <input class="btn btn-primary" type="submit" value="提交" class="btn"> <input class="btn btn-primary" type="reset" value="重置" class="btn">
</form>
      </center>
      </div>
       <jsp:include page="../bottom.jsp"></jsp:include>
    </div>
   </div>
</body>
</html>
