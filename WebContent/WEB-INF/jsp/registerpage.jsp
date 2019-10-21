<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
	</head>

	<body>
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
		</script>
	</body>

</html><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" ></script>
		<script type="text/javascript">
			window.onload=function(){
				document.addEventListener('plusready', function(){
		   			//console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
					mui.init();
				});
		   	var msg="";
		   	$("input[type='email']").blur(function(){
		   		if($(this).val()==""){
		   			alert("邮箱不能为空!");
		   		}else{
		   			$.ajax({
						url:'${pageContext.request.contextPath}/user/checkemail',
						type:'get',
						data:{'email':$(this).val()},
						success:function(data){
							if(data>=1){
								alert("该邮箱已被注册");
								msg=data;
							}
						}
					});
		   		}
		   		
		   	})
			document.getElementById("reg-button").onmousedown=function(){
				if($("input[type='email']").val()==""){
					alert("邮箱不能为空！");
				}else if($("input[name='username']").val()==""){
					alert("用户名不能为空！");
				}else if($("input[type='password']").val()==""){
					alert("密码不能为空！");
				}else if(msg>=1){
					alert("该邮箱已被注册");
				}else{
					document.getElementById("reg-from").submit();
				}
				
			}
			document.getElementById("but-back").onmousedown=function(){
				window.history.back(-1); 
	    	}
			}
			
		</script>
    <style type="text/css">
    	html,body { 
		  margin: 0; 
		  padding:0; 
		  height: 100%; 
		  overflow: hidden;
		  } 
		  .content{
		  	margin-top: 70px;
		  	height: 100%;
		  	justify-content: center;
		  }
		  .level-span{
		  	margin-top: 8px;
		  	
		  }	  
    </style>
</head>
<body>
	<div class="">
		<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">注册</h1>
		      
		    </header>
	</div>
	<div class="content">
		<form class="mui-input-group" action="${pageContext.request.contextPath}/user/register" method="post" id="reg-from">
		    <div class="mui-input-row">
		        <label>邮箱:</label>
		    <input type="email" class="mui-input-clear" placeholder="请输入邮箱" name="email" id="userEmail">
		    </div>
		    <div class="mui-input-row">
		        <label>昵称:</label>
		    <input type="text" class="mui-input-clear" placeholder="请输入用户名" name="username" >
		    </div>
		    <div class="mui-input-row" class="level-div">
		        <label>等级:</label>
		        <div class="" style="margin-top: 10px;">
		       <span ><input type="radio"  name="edulevel" value="小学" style="width: 13px;" checked="checked">小学</span>
			   <span><input type="radio"  name="edulevel" value="初中"  style="width: 13px;">初中</span>
			   <span><input type="radio"  name="edulevel" value="高中"  style="width: 13px;">高中</span>
			   <span><input type="radio"  name="edulevel" value="其他"  style="width: 13px;">其他</span>
		        </div>
			   
		    </div>
		    <div class="mui-input-row">
		        <label>密码:</label>
		        <input type="password" class="mui-input-password" placeholder="请输入密码" name="password" id="uerPassord">
		    </div>
		    <div class="mui-button-row">
		        <button type="button" class="mui-btn mui-btn-danger" id="reg-button">注册</button>
		    </div>
	   </form>
    </div>
	
</body>
</html>