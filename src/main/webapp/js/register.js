$(document).ready(function(){
		$("#login_name").blur(function(){
			$("#login_div").empty();
			var loginName = $("input[name='loginName']").val();
			var Json = {login:loginName};
			var Login_name  = encodeURI(JSON.stringify(Json));
			var yes = "yes";
			var no = "no";
			 $.ajax({  
                 url:"checkRegister.action" ,  
                 data:"login_name=" + Login_name,   
                 success:function(data){ 
                    var ar = eval("(" +data+")");
                   if(ar == yes){
                	   $("#login_div").append("<img src=\"web_image/ok.png\">此用户名可以注册！");
                   }
                   else if(ar == no){
                	   $("#login_div").append("<img src=\"web_image/no.png\">此用户名已被注册！");
                   }
                   else{
                	   return;
                   }
                } 
            });  
		});
		
		$("#password2").blur(function(){
			$("#password4").empty();
			var password1 = $("input[name='password']").val();
			var password2 = $("input[name='password2']").val();
			//alert(password1==password2);
			
			if(password1==password2){
				/* $("#password3").append("<img src=\"web_image/ok.png\">");*/
				 $("#password4").append("<img src=\"web_image/ok.png\">验证成功！");
			}
			else{
				$("#password4").append("<img src=\"web_image/no.png\">两次输入不正确！");
			}
		});
});