$(document).ready(function() {
    $("#comment_submit").click(function(){
    	
    	var comment = $("#comments").val();
    	
    	$("textarea").val("");
    	var house_id = $("#imageurl").attr("alt");
    	//alert(house_id);
    	var date = new Date();
    	var time = date.toLocaleDateString();
    	var json = {comments:comment,day:time};
    	var comment_words = encodeURI(JSON.stringify(json));
    	$.ajax({
    		url:"addComments.action?house_id="+house_id,
    		data:"comments_word="+comment_words,
    		success:function(data){
    			$("#comment_table").append("<tr height='30px'><td>"+time+"</td></tr>");
    	    	$("#comment_table").append("<tr><td>"+comment+"</td></tr>");
    		}
    	});
    	//alert(date1);
    	//alert(year+"-"+month+"-"+day);
    });
    
    $(".zan_btn").click(function(){
    	var house_id = $("#imageurl").attr("alt");
    	var success = "success";
    	$.ajax({
    		url:"praise.action?house_id="+house_id,
    		success:function(data){
    			var result = eval("("+data+")");
    			if(result == success){
    				alert("感谢点赞！！");
    			}
    		}
    	});
    });
    
    $(".Anonymous_report_btn").click(function(){
        $(".jubao").fadeToggle();
      });
    
    $("#report_btn").click(function(){
    	var house_id = $("#housess_id").attr("value");
    	var report_content = $("#report_content").val();
    	var json = {id:house_id,content:report_content};//转化为json数组形式
    	var parameter = encodeURI(JSON.stringify(json));//转码
    	$.ajax({
    		url:"Anonymous_report.action",
    		data:"param="+parameter,
    		success:function(data){
    			alert("感谢您的举报，我们会尽快处理！");
    			$(".jubao").hide();
    		}
    	});
        
      });
    
});