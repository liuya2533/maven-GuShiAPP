<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>	
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" ></script>
    <style type="text/css">
    	html,body { 
		  margin: 0; 
		  height: 100%; 
		  overflow: hidden;
		  } 
		  .content{
		  	margin-top: 70px;
		  	height: 100%;
		  	justify-content: center;
		  	}	  
     } 
    </style>
    <script type="text/javascript">
    window.onload=function(){
    	document.addEventListener('plusready', function(){
   			//console.log("所有plus api都应该在此事件发生后调用，否则会出现plus is undefined。"
   			mui.init()
   		});
    	document.getElementById("fromcommit").onmousedown=function(){
	    		
	           /*  $.ajax({
					url:'${pageContext.request.contextPath}/user/login',
					type:'post',
					data:$("#login_from").serialize(),
					success:function(data){
					 alert(data);
				    }
						
				});	 */
				if($(" input[ type='email' ] ").val()==""){
					alert("邮箱不能为空");
				}else if($(" input[ type='password' ] ").val()==""){
					alert("密码不能为空");
				}else{
					document.getElementById("login-from").submit();
				}
				
			}
    	
    	document.getElementById("but-back").onmousedown=function(){
    		window.history.back(-1); 
    	}
	}
    </script>
</head>
<body>
	<div class="">
		<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">登录注册</h1>
		      <span class="mui-icon mui-icon-star" style="float: right;"></span>
		    </header>
	</div>
	<div class="content">
		<form class="mui-input-group" action="${pageContext.request.contextPath}/user/login" method="post" id="login_from">
		    <div class="mui-input-row">
		        <label>邮箱</label>
		    <input type="email" class="mui-input-clear" placeholder="请输入用户名" name="email">
		    </div>
		    <div class="mui-input-row">
		        <label>密码</label>
		        <input type="password" class="mui-input-password" placeholder="请输入密码" name="password">
		    </div>
		    <div class="mui-button-row">
		        <button type="submit" class="mui-btn mui-btn-primary" id="fromcommit">登录</button>
		        <button type="button" class="mui-btn mui-btn-danger" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/registerpage'">注册</button>
		    </div>
	   </form>
    </div>
	
</body>
</html>