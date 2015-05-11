<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript" src="js/register.js"></script>
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="shortcut icon" href="img/web_icon/web_icon.png">

  </head>
  
  <body>
    <div id="content">
   <jsp:include page="../head.jsp"></jsp:include>
   <div id="center">
   <jsp:include page="../left_nav.jsp"></jsp:include>
      <div class="center_center">
      <center><h2>用户注册</h2>
      <form action="register.action" method="post">
      <div style="margin-top: 20px;" >	 　登录名：<input name="loginName" type="text" style="width: 250px;height: 30px" id="login_name"><div id="login_div"></div></div>
     <div style="margin-top: 20px;">	 真是姓名：<input name="username" type="text" style="width: 250px;height: 30px"></div>
      <div style="margin-top: 20px;" >	密　　码：<input name="password" type="password" style="width: 250px;height: 30px" id="password1"></div>
      <div style="margin-top: 20px;">	 验证密码：<input name="password2" type="password" style="width: 250px;height: 30px" id="password2"><div id="password4"></div></div>
       <div style="margin-top: 20px;">	性　　别：<select name="sex" style="width: 40px;height: 30px">
							　　　　　　　　　　　　　　　　　　　　<option value="男">男</option>
							　　　　　　　　　　　　　　　　　　　　<option value="女">女</option>
						　　　　　　　　　　　　　　　　　</select>
						年　　龄：<select name="age" style="width: 40px;height: 30px">
							　　　　　　　　　　　　　　　　　　　　<option value="15">15</option>
							　　　　　　　　　　　　　　　　　　　　<option value="16">16</option>
														<option value="17">17</option>	
														<option value="18">18</option>
														<option value="19">19</option>
							　　　　　　　　　　　　　　　　　　　　<option value="20">20</option>
														<option value="21">21</option>	
														<option value="22">22</option>
														<option value="23">23</option>
							　　　　　　　　　　　　　　　　　　　　<option value="24">24</option>
														<option value="25">25</option>	
														<option value="26">26</option>
														<option value="27">27</option>
							　　　　　　　　　　　　　　　　　　　　<option value="28">28</option>
														<option value="29">29</option>	
														<option value="30">30</option>
														<option value="31">31</option>
							　　　　　　　　　　　　　　　　　　　　<option value="32">32</option>
														<option value="33">33</option>	
														<option value="34">34</option>
														<option value="35">35</option>
							　　　　　　　　　　　　　　　　　　　　<option value="36">36</option>
														<option value="37">37</option>	
														<option value="38">38</option>
														<option value="39">39</option>
														<option value="40">40</option>	
														<option value="41">41</option>
														<option value="42">42</option>
							　　　　　　　　　　　　　　　　　　　　<option value="43">43</option>
														<option value="44">44</option>	
														<option value="45">45</option>
														<option value="46">46</option>	
														<option value="47">47</option>
														<option value="48">48</option>
							　　　　　　　　　　　　　　　　　　　　<option value="49">49</option>
														<option value="50">50</option>	
														<option value="51">51</option>
						　　　　　　　　　　　　　　　　　</select>
						用户类型：<select name="userType" style="width: 60px;height: 30px">
							　　　　　　　　　　　　　　　　　　　　<option value="中介">中介</option>
							　　　　　　　　　　　　　　　　　　　　<option value="个人">个人</option>
						　　　　　　　　　　　　　　　　　</select>
						</div>
						 
        <div style="margin-top: 20px;">	 地　　点：<input name="address" type="text" style="width: 250px;height: 30px"></div>
        
          <div style="margin-top: 20px;">	 手机号码：<input name="phoneNumber" type="text" style="width: 250px;height: 30px"></div>
           <div style="margin-top: 20px;">	邮　　箱：<input name="emailAddress" type="text" style="width: 250px;height: 30px"></div>
            <div style="margin-top: 20px;">	 　　　qq：<input name="qqNumber" type="text" style="width: 250px;height: 30px"></div>
             <div style="margin-top: 20px;">	用户简介：<textarea name="discription"  cols="33" rows="4"></textarea></div>
      <div style="margin-top: 20px;margin-left: 225px;"><input  type="submit" value="注册" class="submit_btn" id="submit_btn"><input  type="reset" value="重置" class="submit_btn"></div>
      </form>
      </center>
      </div>
       <div class="center_right"></div>
       <jsp:include page="../bottom.jsp"></jsp:include>
    </div>
   </div>
  </body>
</html>
