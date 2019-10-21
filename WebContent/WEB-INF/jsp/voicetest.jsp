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
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<style type="text/css">
			* {
			  font-weight: bold;
			  font-size: 18px;
			  font-family: "华文楷体";
			}
			li{
				list-style: none;
			}
			 .title-li{
		  	color: #4169E1;
		  	font-size: 18px;
		  }
		  .author-li{
		  	color: #778899;
		  	font-size: 14px;
		  }
		</style>
		
		<script type="text/javascript">
		$(function(){
			mui.init();
			
			document.getElementById("but-back").onmousedown=function(){
				window.history.back(-1); 
	    	}
		});
		function deteletape(obj,id){
			if(confirm("是否要删除？")){
				obj.parentNode.parentNode.parentNode.parentNode.removeChild(obj.parentNode.parentNode.parentNode);
				//删除数据库的
				$.ajax({
					url:'${pageContext.request.contextPath}/file/deltape',
					type:'get',
					data:{'id':id},
					success:function(data){
						alert(data);
					}
				});
			}
            
		}
		</script>
	</head>

	<body>
		
		<div class="">
			<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">我的录音记录</h1>
		      
		    </header>
		</div>
		<div style="margin-top: 40px;">
			<ul class="mui-table-view">
			<c:forEach items="${tapeList }" var="tape">
			    <li class="mui-table-view-cell">
		    		<ul>
		    			<li class="title-li">
		    			${tape.voice_name}
		    			</li>
		    			<li>
		    				${tape.tape_time }
		    			</li>
		    			<li class="author-li">
		    			
		    				<audio src="${pageContext.request.contextPath}/voice/${tape.voice_name}" controls="preload" style="width: 80%;"></audio>
		    				<span class="mui-icon mui-icon-trash"  onmousedown="deteletape(this,${tap.id})"></span>
		    			</li>
		    		</ul>
			    </li>
			   </c:forEach>
			</ul>
		</div>
	</body>

</html>