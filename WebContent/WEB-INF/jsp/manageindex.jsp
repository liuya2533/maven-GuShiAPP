<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8"> 
	<title>智能古诗词APP后台管理</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	function r()
	{
	
		var username=document.getElementById("username");
		
		var pass=document.getElementById("password");
		if(username.value=="")
		{
		alert("请输入用户名");
		username.focus();
		return;
		}
		if(pass.value=="")
		{
		alert("请输入密码");
		return;
		}
		return true;
	}
	</script>
	
	<style>
		body 
       {
	       background-image:url(${pageContext.request.contextPath}/img/background.jpg);
	       background-size:100%;
       }
	</style>
	
</head>
<body>

<div class="panel panel-default" style="width:600px;height:400px;float:right;margin:250px 150px;border-radius: 25px;">
	<div class="panel-heading" style="height:90px;border-radius: 25px 25px 0px 0px;">
		<h1 style="font-family:华文行楷;text-align:center">智能古诗词APP后台管理</h1>
	</div>
	
	<form action="${pageContext.request.contextPath}/user/managerlogin" method="POST">
	<div class="form-group">
		<br>
		<label for="firstname" class="col-sm-2 control-label"><p style="margin-left:20px;font-family:华文行楷;font-size:22px">账号</p></label>
		<div class="col-sm-10">
			<input type="text" name="email" id="username" class="form-control">
		</div>
	</div>
	<br><br>
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label"><p style="margin-left:20px;font-family:华文行楷;font-size:22px">密码</p></label>
		<div class="col-sm-10">
			<input type="password" name="password" id="password" class="form-control">
		</div>
	</div>
	   
	
	<br><br><br><br><br><br>
	<div style="text-align:center">
		<button type="submit" class="btn btn-success" style="width:25%;height:50px;font-size:20px">登录</button>
		<button type="reset" class="btn btn-info" style="width:25%;height:50px;font-size:20px">重置</button>
	</div>	
	</form>	
</div>


</body>
</html>
