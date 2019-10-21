<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script type="text/javascript">
			$(function(){
				mui.init();
				$("#but-back").mousedown(function(){
		    		window.history.back(-1); 
		    	})
			})
			
		</script>
	</head>

	<body>
		
		<div class="">
        		<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">我的信息</h1>
		      <span class="mui-icon mui-icon-settings" style="float: right;" ></span>
		    </header>
        	</div>
		<div style="margin-top:45px ;">
			<form class="mui-input-group">
			    <div class="mui-input-row">
			        <label>昵 称:</label>
			        <input type="text" class="" value="${userinfo.username }" readonly="true">
			    </div>
			    <div class="mui-input-row">
			        <label>邮 箱:</label>
			        <input type="email" class="" value="${userinfo.email }" readonly="true">
			    </div>
			    <div class="mui-input-row">
			        <label>性 别:</label>
			        <input type="text" class="" value="${userinfo.sex }" readonly="true">
			    </div>
			    <div class="mui-input-row">
			        <label>等 级:</label>
			        <input type="text" class="" value="${userinfo.edulevel }" readonly="true">
			    </div>
			    <div class="mui-input-row">
			        <label>分 数:</label>
			        <input type="text" class="" value="${userinfo.grade }" readonly="true">
			    </div>
			</form>
		</div>
	</body>

</html>