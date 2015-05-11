<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML>
<html>
<head>
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>租房网</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<link href="css/index.css" rel="stylesheet" />
<link rel="shortcut icon" href="img/web_icon/web_icon.png">

</head>

<body>
<div id="content">
 <jsp:include page="head.jsp"></jsp:include>
  
  <div id="center">
   <jsp:include page="left_nav.jsp"></jsp:include>
    <div class="center_center">
      <div class="center_c_top">
        <ul class="slider">
        <c:forEach items="${list_ads}" var="house">
          <li>
            <div class="pic"><a href="findHouseInfoByid.action?id=${house.id}"><img src="${house.imageUrl}" width="342px" height="264px"/></a></div>
            <div class="pic_text">
              <h2><a href="findHouseInfoByid.action?id=${house.id}">${house.houseName}</a></h2>
              <p style="color:#999;font-size:10px;">${house.householdType}</p>
              <br />
              <p>${house.title}</p>
              <p style="color:#F33;">经纪人：${house.user.username}</p>
            </div>
          </li>
          </c:forEach>
        </ul>
      </div>
      <div class="num">
        <ul>
          <li>1</li>
          <li>2</li>
          <li>3</li>
          <li>4</li>
          <li>5</li>
        </ul>
      </div>
     
      <div class="center_c_display">
        <div class="c_c_c_head">
          <span style="font-weight: bold;">精品房屋出租</span>&nbsp;&nbsp;
          <span><a href="#">全部</a></span>
        </div>
        <div class="c_c_d_list">
        <c:forEach items="${list_house}" var="house" end="5" >
        <div class="c_c_d_list_one">
              <div class="dis"><a href="findHouseInfoByid.action?id=${house.id}"><img  width="140px" height="106px" src="${house.imageUrl}"/></a></div>
              <div class="dis_name"><div class="first"><a href="findHouseInfoByid.action?id=${house.id}">	
					${house.title}</a>
					</div>
					${house.houseName}
					<br>经纪人：${house.user.username}</div>
              <div class="dis_text"><div class="price">${house.price} </div>元/月 </div>
             </div>
             </c:forEach>
             
             
             
        </div>
        
      </div>
    </div>
    <div class="center_right">
      <div class="cook">
        <div class="c_c_c_head" style="margin-left:20px;padding-top:15px;">
          <span style="font-weight: bold;">房主关注度排名</span>&nbsp;&nbsp;
          <span><a href="#">更多</a></span>
        </div>
        <div class="cook_name">
          <ul>
          <c:forEach items="${list_user}" var="user">
            <li style="margin-top:0px;">
              <div class="people">
                <div class="people_pic"><a href="listHouseInfoByUser.action?user_id=${user.id}"><img src="<%=basePath%>${user.image}" width="55px" height="70px"
                /></a></div>
                <div class="people_tro" >
                  <p><a href="listHouseInfoByUser.action?user_id=${user.id}">${user.username }</a></p>
                  <p id="user_score">${user.score}关注</p>
                  <p>${user.numbeOfPostings}个帖子</p>
                </div>
                <div class="people_attent" title="${user.id}">关注</div>
              </div>
            </li>
           </c:forEach>
                
                </ul></div>
        <div class="people_more"><a href="#">查看更多</a></div>
      </div>
      <div class="popular_menu">
        <div class="c_c_c_head" style="margin-left:20px;padding-top:15px;">
          <span style="font-weight: bold;">周边信息</span>&nbsp;&nbsp;
          <span><a href="#">...</a></span>
        </div>
        <div class="popular_m_list">
          <ul>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
            <li><a href="#">厂房出租</a></li>
          </ul>
        </div>
      </div>
    </div>
</div>
 <jsp:include page="bottom.jsp"></jsp:include>
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
      <img  src="img/user.jpg" style="float:left" /><input type="text" value="请输入用户名"  style="float:left" id="zhuce_input"/>
    </div>
    <div class="input_password input_text">
      <img src="img/password.jpg" style="float:left" />
      <input type="text" value="请输入密码"  style="float:left" />
    </div>
    <div class="input_register input_text" style="margin-top:100px;">注册</div>
  </div>
  <!--注册end-->
  
  <!--登录begin-->
  <div class="signup_input" id="denglu">
    <div class="input_user input_text" style="margin-top:0;">
      <img  src="img/user.jpg" style="float:left" /><input type="text" value="请输入用户名"  style="float:left" id="denglu_input"/>
    </div>
    <div class="input_password input_text">
      <img src="img/password.jpg" style="float:left" />
      <input type="text" value="请输入密码"  style="float:left" />
    </div>
    <div class="input_register input_text" style="margin-top:100px;">登录</div>
  </div>
  <!--登录end-->
</div>
</body>
</html>
