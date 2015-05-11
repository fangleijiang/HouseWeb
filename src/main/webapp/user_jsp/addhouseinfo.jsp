<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发布信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="img/web_icon/web_icon.png">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/addhouseinfo.css">
<link rel="shortcut icon" href="img/web_icon/web_icon.png">
<!-- 配置文件 -->
<!-- 配置文件 -->
<script type="text/javascript" src="./ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="./ueditor/ueditor.all.js"></script>
<!-- 语言包文件(建议手动加载语言包，避免在ie下，因为加载语言失败导致编辑器加载失败) -->
<script type="text/javascript" src="./ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.0.js"></script>


  </head>
  
  <body>
   <div id="content">
     <jsp:include page="../head.jsp"></jsp:include>
   <div id="center">
   <jsp:include page="../left_nav.jsp"></jsp:include>
      <div class="center_center">
      <center><h2>发布房屋信息</h2>
       <form action="upload_image.action" method="post" enctype="multipart/form-data" >  
   上传图片*：<input type="file" id="fileName" name="file" >
     <input type="submit" value="上传" class="btn"> 
 </form>
 
 <form action="addHouseInfo.action" method="post" >  
  <table style="font-size: 14px;
	color: #b24422;">
	<tr style="height: 50px"><td>标题*:</td><td colspan="3"><input name="title" type="text" style="width: 400px;height: 28px"></td></tr>
  <tr style="height: 50px"><td>小区名字*:</td><td><input name="houseName" type="text" style="width: 140px;height: 28px"></td><td>房屋面积*：</td><td><input name="rentArea" type="text" style="width: 140px;height: 28px"></td></tr>
   <tr style="height: 50px"><td>支付类型*：</td><td><input name="paymentStyle" type="text" style="width: 140px;height: 28px"></td><td>价　　格*：</td><td><input name="price" type="text" style="width: 140px;height: 28px">元/月</td></tr>
    <tr style="height: 50px"><td>装修类型*：</td><td><input name="fitment" type="text" style="width: 140px;height: 28px"></td><td>房屋地址*</td><td><input name="address" type="text" style="width: 140px;height: 28px"></td></tr>
     <tr style="height: 50px"><td>房屋楼层*：</td><td><input name="houseFlont" type="text" style="width: 140px;height: 28px"></td><td>租房模式*：</td><td><select name="rentStyle" style="width:100px;height: 30px">
							　　　　　　　　　　　　　　　　　　　																						　<option value="整租房">整租房</option>
							　　　　　　　　　　　　　　　　　　　																						 <option value="合租房">合租房</option>
																																			 <option value="短租/日租房">短租/日租房</option>
																																			 <option value="短租/日租房">二手房</option>
																																			 <option value="短租/日租房">家庭旅馆</option>
																																			 <option value="短租/日租房">酒店式公寓</option>
																																			 <option value="短租/日租房">宾馆招待所</option>
																																			 <option value="短租/日租房">青年旅舍</option>
																																			 <option value="短租/日租房">特色客栈</option>
																																			 <option value="短租/日租房">经济型酒店</option>
																																			 <option value="短租/日租房">星级酒店</option>
																																			 <option value="短租/日租房">精装二手房</option>
																																			 <option value="短租/日租房">特色客栈</option>
																																			 <option value="短租/日租房">刚需一间</option>
																																			 <option value="短租/日租房">免税房源</option>
																																			 <option value="短租/日租房">旅馆短租</option>
						　　　　　　　　　　　　　　　　																								　</select></td></tr>
      <tr style="height: 50px"><td>物业类型*：</td><td><input name="propertyType" type="text" style="width: 140px;height: 28px"></td><td>房屋朝向*：</td><td><input name="houseFace" type="text" style="width: 140px;height: 28px"></td></tr>
       <tr style="height: 50px"><td>户　　型*：</td><td><input name="householdType" type="text" style="width: 140px;height: 28px">厅、室*</td></tr>
 	<tr style="height: 100px"><td>配套家具*：</td><td colspan="3"><textarea name="housingFurniture"  cols="70" rows="5"></textarea></td></tr>
 	<tr><td colspan="4" style="height: 30px">详细描述*：</td></tr>
 	<tr style="height: 100px"><td colspan="4"><textarea rows="" cols="" id="container" name="description"></textarea></td></tr>
  </table>

<script type="text/javascript">
    var editor = UE.getEditor('container');
</script>

   <input class="btn btn-primary" type="submit" value="提交" class="btn"> <input class="btn btn-primary" type="reset" value="重置" class="btn">
</form>
      </center>
      </div>
       <jsp:include page="../bottom.jsp"></jsp:include>
    </div>
   </div>
  </body>
</html>
