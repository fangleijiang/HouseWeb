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
<link href="css/head.css" rel="stylesheet" />

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<link rel="stylesheet" type="text/css" href="css/head.css">

<!-- <script type="text/javascript"
	src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script> -->

<script type="text/javascript">
var address = '长沙';
	function Click() {
		/* var address = remote_ip_info.city; */
		var address = '长沙';
		$("#add_click").attr('href',
				'listAreaInfo.action?address=' + address + '');
	}

	function addParms() {
		//var address = remote_ip_info.city;
		$("#qiuzu").attr('href', 'list_all_rf.action?address=' + address + '');
	}

	function zhengzu() {
		//var address = remote_ip_info.city;
		$("#zhengzu").attr(
				'href',
				'searcheHouseInfoByRentType.action?rentType=整租&&address='
						+ address + '');
	}

	function hezu() {
		//var address = remote_ip_info.city;
		$("#hezu").attr(
				'href',
				'searcheHouseInfoByRentType.action?rentType=合租&&address='
						+ address + '');
	}

	function duanzu() {
		//var address = remote_ip_info.city;
		$("#duanzu").attr(
				'href',
				'searcheHouseInfoByRentType.action?rentType=短租/日租&&address='
						+ address + '');
	}
</script>


</head>

<body>
	<div class="top_head">
		<div class="weather">
			<iframe name="weather_inc"
				src="http://i.tianqi.com/index.php?c=code&id=1" width="420"
				height="30" frameborder="0" marginwidth="0" marginheight="0"
				scrolling="no"></iframe>
		</div>
		<div class="login">
			<c:choose>
				<c:when test="${sessionScope.user!=null}">
  	欢迎${sessionScope.user.loginName}!
  	<a href="loginOut.action">退出</a>
				</c:when>
				<c:otherwise>
					<a href="user_jsp/login.jsp">登录</a>&nbsp;&nbsp;<a
						href="user_jsp/register.jsp">注册</a>
				</c:otherwise>
			</c:choose>


			&nbsp;&nbsp;&nbsp;&nbsp;<a href="user/individualCenter.action">个人中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="#">帮助中心</a>
		</div>
	</div>
	<div id="head">
		<div class="logo">
			<a href="index.jsp"><img src="img/web_icon/logo.png" /></a>
		</div>
		<div class="address">
			<a href="" id="add_click" onclick="Click()">
			<!-- <script>
				document.write(remote_ip_info.city);
			</script> -->
			长沙
			</a>&gt;
		</div>

		<div class="head_nav">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="" id="zhengzu" onclick="zhengzu()">整租房</a></li>
				<li><a href="" id="hezu" onclick="hezu()">合租房</a></li>
				<li><a href="" id="duanzu" onclick="duanzu()">短租</a></li>
				<li><a href="" id="qiuzu" onclick="addParms()">求租</a></li>
			</ul>
		</div>
		<div class="search">
			<form action="searchLikeInfo.action" method="post">
				<input type="text" class="search_text" name="searchStr" /> <input
					type="submit" class="search_btn" value="搜索">
			</form>
		</div>
		<div class="release">
			<a href="user_jsp/addhouseinfo.jsp"><button class="relaese_btn">发布房屋信息</button></a>
			<a href="user_jsp/addRentalInformation.jsp"><button
					class="rental_btn">发布求租</button></a>
		</div>
	</div>

</body>
</html>
