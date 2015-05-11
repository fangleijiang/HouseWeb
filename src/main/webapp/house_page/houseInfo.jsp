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

<title>房屋信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/houseInfo.js"></script>
<link href="css/index.css" rel="stylesheet" />
<link rel="shortcut icon" href="img/web_icon/web_icon.png">
</head>

<body>
	<jsp:include page="../release_info.jsp"></jsp:include>
	<div id="content" style="height:3000px;">
		<jsp:include page="../head.jsp"></jsp:include>
		<div id="center">
			<div class="center_head">
				<div style="float:left; font-size:20px;font-weight:bold;">${house.title }</div>
				<div class="dujia">独家</div>
			</div>
			<div class="center_content">
				<div class="c_c_left">
					<div class="c_c_l_info">
						<div class="pic">
							<img src="${house.imageUrl }" id="imageurl" alt="${house.id }" width="250px" height="180px;"/>
							<div class="link_info">
								<h3>联系人信息</h3>
								<br> 姓名：${houseOwner.username }（${houseOwner.userType}）<br>
								<br> 手机号码：${houseOwner.phoneNumber }
							</div>
						</div>
						<div class="info">
							<table style="color:#b24422">
								<tr height="40px">
									<td width="100px" style="color: gray">价格：</td>
									<td width="80px"><h4>${house.price}</h4>元/月</td>
								</tr>
								<tr height="40px">
									<td style="color: gray">概况：</td>
									<td>${house.paymentStyle}&nbsp;${house.householdType}&nbsp;${house.rentStyle}
										&nbsp;${house.fitment}&nbsp;${house.rentArea}&nbsp;${house.propertyType}&nbsp;${house.houseFace}&nbsp;
									</td>
								</tr>
								<tr height="40px">
									<td style="color: gray">楼层：</td>
									<td>${house.houseFlont}</td>
								</tr>
								<tr height="40px">
									<td style="color: gray">区域：</td>
									<td>${house.houseName}&nbsp;${house.address}</td>
								</tr>
								<tr height="40px">
									<td style="color: gray">地址：</td>
									<td>${house.address}</td>
								</tr>
								<tr height="40px">
									<td style="color: gray">发布日期：</td>
									<td>${house.publishDate}</td>
								</tr>
							</table>
							<a href="user/addHouseToCart.action?id=${house.id}"><button class="book_btn">预订</button></a>&nbsp;<a  class="zan_btn"><img alt="赞" src="img/web_icon/zan.png"></a>&nbsp;<button class="Anonymous_report_btn">匿名举报</button>

						</div>
						<div class="jubao">
						<h4>举报</h4>
						<span>您为什么要举报此信息？</span><br>
						<input type="hidden" name="id" value="${house.id}" id="housess_id">
						<textarea rows="3" cols="40" name="content" id="report_content"></textarea>
						<input id="report_btn" type="submit" value="提交" style="width: 60px;height: 25px;background: #C00;border: 1px solid transparent;color: #FFF;font-size: 14px;margin-top: 5px;cursor: pointer;">
						</div>
						<div class="furniture">
							<h3>房屋配置:</h3>
							${house.housingFurniture }
						</div>
					</div>
					<div class="troduce">
						<h1>简介</h1>
						${house.description }
					</div>
				</div>
				<!-- 网站右边 -->
				<div class="c_c_right">
					<div class="c_c_r_sort">
						<h3 style="color:#999">大家都在搜</h3>
					</div>
					<div class="c_c_r_comment"><div class="message">
						<img src="img/web_icon/comment.png" />用户匿名评论
					</div>
					<div class="c_c_r_time">
						<table style="font-size: 9px;color: gray" id="comment_table">
						<c:forEach items="${comments}" var="comment">
						<tr height="30px"><td>${comment.date}</td></tr>
						<tr><td>${comment.comments}</td></tr>
						</c:forEach>
						</table>
						<h4 style="margin-top: 30px;">留言</h4>
						<textarea rows="4" cols="45" id="comments"></textarea>
						<button id="comment_submit"  style="width: 60px;height: 25px;background: #C00;border: 1px solid transparent;color: #FFF;font-size: 14px;margin-top: 5px;cursor: pointer;">发送</button>

					</div>
					</div>
					
					
				</div>
			</div>
		</div>

	</div>

	<div id="mask"></div>
	<div id="signup">
		<div class="signup_head">
			<div class="sign_login">
				<div class="login_text denglu">登录</div>
				<div class="login_text zhuce">注册</div>
			</div>
			<div class="close_it"></div>
		</div>
		<!--注册begin-->
		<div class="signup_input" id="zhuce">
			<div class="input_user input_text" style="margin-top:0;">
				<img src="img/user.jpg" style="float:left" /><input type="text"
					value="请输入用户名" style="float:left" id="zhuce_input" />
			</div>
			<div class="input_password input_text">
				<img src="img/password.jpg" style="float:left" /> <input
					type="text" value="请输入密码" style="float:left" />
			</div>
			<div class="input_register input_text" style="margin-top:100px;">注册</div>
		</div>
		<!--注册end-->

		<!--登录begin-->
		<div class="signup_input" id="denglu">
			<div class="input_user input_text" style="margin-top:0;">
				<img src="img/user.jpg" style="float:left" /><input type="text"
					value="请输入用户名" style="float:left" id="denglu_input" />
			</div>
			<div class="input_password input_text">
				<img src="img/password.jpg" style="float:left" /> <input
					type="text" value="请输入密码" style="float:left" />
			</div>
			<div class="input_register input_text" style="margin-top:100px;">登录</div>
		</div>
		<!--登录end-->
	</div>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>
