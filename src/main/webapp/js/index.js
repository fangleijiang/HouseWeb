
$(function(){
	var index=0;
	var len=$(".slider>li").length;
	var adTimer;
	
	/*鼠标移到哪一个数字上，显示第几张图片*/
	$(".num li").mouseover(function(){
	    index=$(this).index();/* index=$(".num li").index(this);*/
		showImg(index);
	}).eq(0).mouseover();/*eq(0).mouseover()用于初始化，也可以设置其中任何一张图片为初始化时的图片*/
	
	/*鼠标移到ad上时，停止自滑动，移出时恢复自滑动*/
	$(".center_c_top").hover(function(){
		clearInterval(adTimer);
	  },function(){
		  adTimer=setInterval(function(){
			  showImg(index);
			  index++;
			  if(index==len){index=0;}
			  
		    },1500);
		}).trigger("mouseleave");/*删除trigger影响不大？*/
});

function showImg(index){
	var show_width=$(".center_c_top").width();
	$(".slider").stop(true,false).animate({left:-index*show_width},500);/*stop(true,false)可防止鼠标移动太快时图片来不及移到而引起鼠标停留时还在移动*/
	$(".num li").removeClass("on").eq(index).addClass("on");
	
	
}

$(document).ready(function() {
	var page=1;
	var i=5;
	var show_width=$(".center_c_center").width();
	var len=$(".c_c_c_ul").find("li").length;
	var page_count=Math.ceil(len/i);
    $(".turn_right").click(function(){
		if(!$(".c_c_c_ul").is(":animated")){
		  if(page==page_count){
		    $(".c_c_c_ul").stop(false,true).animate({left:'0px'},'slow');
		    page=1;
		  }else{
			  $(".c_c_c_ul").stop(false,true).animate({left:'-='+show_width},'slow');
			  page++;
			
			}
		}
	});
	$(".turn_left").click(function(){
		if(!$(".c_c_c_list").is(":animated")){
		  if(page==1){
		    $(".c_c_c_ul").stop(false,true).animate({left:'-='+show_width*(page_count-1)},'slow');
		    page=page_count;	
			
		  }else{
			  $(".c_c_c_ul").stop(false,true).animate({left:'+='+show_width},'slow');
			  page--;
			
		   }
		}
	});
});


$(function(){
	var curY;//获取所选项的top值
	var curX;//获取所选项的height值
	var curW;//获取所选项的width
	var srtY;//设置提示箭头的top值
	var srtX;//设置提示箭头的left值
	var objL;//获取当前对象
	
    function setInitValue(obj){
	    curY=obj.offset().top;
		curH=obj.height();
		curW=obj.width();
		/*srtY=curY+(curH/2)+"px";设置提示箭头的top值*/
		/*srtX=curW-15+"px";设置提示箭头的left值*/
	}
	//设置当前所选项的鼠标滑过事件
	
	//合租子列表
	$(".hezu").mouseover(function(){
		
		objL=$(this);//获取当前对象
		setInitValue(objL);//设置当前位置
		var allY=curY-curH+"px";//设置提示框的top值
		//objL.addClass("optnFocus");增加获取焦点时的样式
		objL.next("ul").show().css({"top":allY,"left":curW+50});//显示并设置提示框的坐标
		//$("#sort").show().css({"top":srtY,"left":srtX});显示并设置提示箭头的坐标
	});
	$(".hezu").mouseout(function(){//设置当前所选项的鼠标移出事件
	    //$(this).removeClass("optnFocus");
		$(this).next("ul").hide();//隐藏提示框
		//$("#sort").hide();	隐藏提示箭头
	});
	$(".hezu_tip").mouseover(function(){
		$(this).show();
	}).mouseout(function(){
		$(this).hide();
	   });
	
	//蔬菜子列表
	$(".vegetable").mouseover(function(){
		
		objL=$(this);//获取当前对象
		setInitValue(objL);//设置当前位置
		var allY=curY-curH+"px";//设置提示框的top值
		//objL.addClass("optnFocus");增加获取焦点时的样式
		objL.next("ul").show().css({"top":allY,"left":curW+120});//显示并设置提示框的坐标
		//$("#sort").show().css({"top":srtY,"left":srtX});显示并设置提示箭头的坐标
	});
	$(".vegetable").mouseout(function(){//设置当前所选项的鼠标移出事件
	    //$(this).removeClass("optnFocus");
		$(this).next("ul").hide();//隐藏提示框
		//$("#sort").hide();	隐藏提示箭头
	});
	$(".vegetable_tip").mouseover(function(){
		$(this).show();
	}).mouseout(function(){
		$(this).hide();
	   });
		
});

/*遮罩层
$(document).ready(function(e) {
    $(".login_in").click(function(){登录
		$("#mask,#signup").show();
		$("#denglu").show();
		$("#zhuce").hide();
		showDialog();//设置提示对话框的top与left
		$(".denglu").css("color","#f00").siblings('div').css("color","#666");
	});
	 $(".login_register").click(function(){注册
		$("#mask,#signup").show();
		$("#zhuce").hide();
		$("#denglu").show();
		showDialog();//设置提示对话框的top与left
		$(".denglu").css("color","#f00").siblings('div').css("color","#666");
	});
	 //根据当前页面与滚动条位置，设置提示对话框的top与left
   function showDialog(){
	   var objW=$(window);//当前窗口
	   var objC=$("#signup");//对话框
	   var brsW=objW.width();
	   var brsH=objW.height();
	   var sclL=objW.scrollLeft();
	   var sclT=objW.scrollTop();   
	   var curW=objC.width();
	   var curH=objC.height();
	   var left=sclL+(brsW-curW)/2;//计算对话框居中时的左边距
	   var top=sclT+(brsH-curH)/2;//计算对话框居中时的上边距
	   objC.css({"left":left,"top":top});//设置对话框在页面中的位置
   }
   
   $(window).resize(function(){ //页面窗口大小改变事件
	   if($("#signup").is(":hidden")){return;}   
	   else{showDialog();}//设置提示对话框的top和left
   });
   
   $(".close_it").click(function(){
	   $("#mask,#signup").hide();
   });
   $(".input_register").click(function(){
	   $("#mask,#signup").hide();
   });
   $(".denglu").click(function(){
	   $("#denglu").show();
	   $("#zhuce").hide();
	   $(".zhuce").css("color","#666");
	   $(this).css({'color':'#f00','border-bottom':'#f00'}); 
	   
   });
   $(".zhuce").click(function(){
	   $("#zhuce").show();
	   $("#denglu").hide();
	   $(".denglu").css("color","#666"); 
	   $(this).css("color","#f00");
	   $(this).css("border-bottom","#f00");
   });
});
*/
/*评论界面
$(document).ready(function() {
	$(".message_input textarea").click(function(){
		$(this).empty("请发表你的伟大言论吧:-D");
	});
    $(".publish").click(function(){
		var your_message=$(".message_input textarea").val();
		var your_time=new Date().toLocaleString();//
		var your_name ;      //用户名，如何获取？
		if(your_message!=""){
			$(".comment ul").prepend("<li><div class='person_message'><div class='person_name'><a href='#'>"+your_name+"</a>&nbsp;&nbsp;|&nbsp;"+your_time+"&nbsp;|&nbsp;<a href='#'>回复</a></div><div class='person_words'>"+your_message+"</div></div></li>");
			$(".message_input textarea").val("");
		}
	});
});*/

/*点击关注*/
$(document).ready(function(){
	$(".people_attent").click(function(){
		/*$(this).unbind('click');*/
		var user_id = $(this).attr("title");
		var success = "success";
		var failure = "failure";
		$.ajax({
			url:"userAttentionuser.action?id="+user_id,
			success:function(data){
				var result =  eval(data);
				if(result == success){
					alert("关注好友成功！");
					//return;
				}
				else if(result == failure){
					alert("请先登录！");
					//return;
				}
				else{
					alert("您已经关注过了");
					//return;
				}
				
				
			}
		
		});
		//return;
	});
	
});

