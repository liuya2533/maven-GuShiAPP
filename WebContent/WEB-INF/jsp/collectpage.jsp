<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<style type="text/css">
			* {
			  font-weight: bold;
			  font-family: "华文楷体";
			}
			li{
				list-style: none;
			}
		</style>
	</head>

	<body>
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script type="text/javascript">
		$(function(){
			mui.init();
			$("#but-back").mousedown(function(){
	    		window.history.back(-1); 
	    	})
		})
		</script>
		<div class="">
			<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">我的收藏</h1>
		      <span class="mui-icon mui-icon-starhalf" style="float: right;"></span>
		    </header>
		</div>
		<div style="margin-top: 40px;">
			<ul class="mui-table-view">
			<c:forEach items="${artList }" var="art">
			    <li class="mui-table-view-cell">
			        <div class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/detail/${art.id}'">
		    		<ul>
		    			<li>
		    			${art.title}
		    			</li>
		    			<li>${art.author}</li>
		    		</ul>
		    	</div>
			    </li>
			  </c:forEach>
			</ul>
		</div>
	</body>

</html>