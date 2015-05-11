<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  function getQueryString(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) return decodeURI (r[2]); return null; 
		} 

		var address1 = getQueryString("address");
		function low_price1() {
			$("#low_high1").attr('href',
					'selectPrice.action?low=600&&high=1000&&address=' + address1 + '');
		}
		function low_price2() {
			$("#low_high2").attr('href',
					'selectPrice.action?low=0&&high=600&&address=' + address1 + '');
		}
		function low_price3() {
			$("#low_high3").attr('href',
					'selectPrice.action?low=1500&&high=2000&&address=' + address1 + '');
		}
		function low_price4() {
			$("#low_high4").attr('href',
					'selectPrice.action?low=1000&&high=1500&&address=' + address1 + '');
		}
		function low_price5() {
			$("#low_high5").attr('href',
					'selectPrice.action?low=2500&&high=3000&&address=' + address1 + '');
		}
		function low_price6() {
			$("#low_high6").attr('href',
					'selectPrice.action?low=2000&&high=2500&&address=' + address1 + '');
		}
		function low_price7() {
			$("#low_high7").attr('href',
					'selectPrice.action?low=3000&&high=10000&&address=' + address1 + '');
		}
  </script>
  </head>
  
  <body>
    <div class="center_left">
      <ul class="menu">
        <li  class="hezu"><span class="images"><img src="img/left_nav/zhengzufang.png" /></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=整租房">整租房&nbsp;></a></span></li>
         <ul class="tip hezu_tip">
            <li class="tip_li" >
              <span class="tip_name">房间数量</span>
              <span class="tip_n_icon">
                <ul>
                	<li><a href="#">四室</a></li>
                	 <li><a href="#">三室</a></li>
               		 <li><a href="#">两室</a></li>
                  	<li><a href="#">一室</a></li>
                  	<li><a href="#">更多</a></li>
                </ul>
              </span>
            </li>
            <li class="tip_li" >
              <span class="tip_name">价&nbsp;&nbsp;格</span>
              <span class="tip_n_icon">
                <ul>
                 <li><a  id="low_high1" href="" onclick="low_price1()">600-1000元</a></li>
                  <li><a id="low_high2" href="" onclick="low_price2()">600元以下</a></li>
                  <li><a id="low_high3" href="" onclick="low_price3()">1500-2000元</a></li>
                  <li><a id="low_high4" href="" onclick="low_price4()">1000-1500元</a></li>
                  <li><a id="low_high5" href="" onclick="low_price5()">2500-3000元</a></li>
                  <li><a id="low_high6" href="" onclick="low_price6()">2000-2500元</a></li>
                  <li><a id="low_high7" href="" onclick="low_price7()">3000以上</a></li>
                </ul>
              </span>
            </li>
          
          </ul>
        <li><span class="images"><img src="img/left_nav/hezufang.png" /></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=合租房">合租房</a></span></li>
        <li><span class="images"><img src="img/left_nav/ershoufang.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=二手房">二手房</a></span></li>
        <li><span class="images"><img src="img/left_nav/duanzurizufang.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=短租/日租房">短租/日租房</a></span></li>
        <li><span class="images"><img src="img/left_nav/jiatinglvguan.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=家庭旅馆">家庭旅馆</a></span></li>
        <li><span class="images"><img src="img/left_nav/jiudianshigongyu.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=酒店式公寓">酒店式公寓</a></span></li>
        <li><span class="images"><img src="img/left_nav/binguan.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=宾馆招待所">宾馆招待所</a></span></li>
        <li><span class="images"><img src="img/left_nav/qingnianlvshe.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=青年旅舍">青年旅舍</a></span></li>
        <li><span class="images"><img src="img/left_nav/tesekezhan.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=特色客栈">特色客栈</a></span></li>
        <li><span class="images"><img src="img/left_nav/jingjixingjiudian.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=经济型酒店">经济型酒店</a></span></li>
        <li><span class="images"><img src="img/left_nav/xingjijiudian.png"/></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=星级酒店">星级酒店</a></span></li>
        
        
      <br/>
      </ul>
      <br />
      <ul class="menu">
         <li><span class="images"><img src="img/left_nav/ershoufang.png" /></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=精装二手房">精装二手房</a></span></li>
         <li><span class="images"><img src="img/left_nav/zhixuyijian.png" /></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=刚需一间">刚需一间</a></span></li>
         <li><span class="images"><img src="img/left_nav/mianshuifangyuan.png" /></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=免税房源">免税房源</a></span></li>
         <li><span class="images"><img src="img/left_nav/lvguanduanzu.png" /></span><span class="menu_name"><a href="searcheHouseInfoByRentType.action?rentType=旅馆短租">旅馆短租</a></span></li>
         <br /><br />
         <li><a href="#">全部菜谱分类</a></li>
         <br />
      </ul>
      
      
      <div class="center_left_bottom">
        <div class="c_c_c_head" style="padding-top:15px;">
          <span>时令食材</span>&nbsp;&nbsp;
          <span><a href="#">全部</a></span>
        </div>
        <div class="center_left_list">
          <ul>
            <li><a href="#"><img src="img/shiling (1).jpg"  title="橙子"/></a></li>
            <li><a href="#"><img src="img/shiling (2).jpg"  title="肥牛"/></a></li>
            <li><a href="#"><img src="img/shiling (3).jpg"  title="牛油果"/></a></li>
            <li><a href="#"><img src="img/shiling (4).jpg"  title="柚子" /></a></li>
            <li><a href="$"><img src="img/shiling (5).jpg"  title="冬笋"/></a></li>
            <li><a href="#"><img src="img/shiling (6).jpg"  title="山楂"/></a></li>
            <li><a href="#"><img src="img/shiling (7).jpg"  title="牛肉末"/></a></li>
            <li><a href="#"><img src="img/shiling (8).jpg"  title="羊肉"/></a></li>
            <li><a href="#"><img src="img/shiling (9).jpg"  title="马蹄"/></a></li>
            <li><a href="#"><img src="img/shiling (10).jpg" title="蓝莓"/></a></li>
            <li><a href="#"><img src="img/shiling (11).jpg" title="木瓜"/></a></li>
            <li><a href="#"><img src="img/shiling (12).jpg" title="牛腩"/></a></li>
          </ul>
          
        </div>
        
      </div>
      
      
    </div>
    
    
  </body>
</html>
