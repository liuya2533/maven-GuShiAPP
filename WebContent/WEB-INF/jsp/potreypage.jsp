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
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/jquery-2.1.4.min.js" ></script>
		<script src="${pageContext.request.contextPath }/js/template-web.js"></script>
		<script type="text/javascript">
			$(function(){
				mui.init();
				var nav1=$("#nav-li1");
				var nav2=$("#nav-li2");
				var nav3=$("#nav-li3");
				
				nav1.css("color","cadetblue");
				loadart("小学");
				nav1.mousedown(function(){
					nav1.css("color","cadetblue");
					nav2.css("color","#D2691E");
					nav3.css("color","#D2691E");
					
					loadart($(this).html());
					
				});
				nav2.mousedown(function(){
					nav2.css("color","cadetblue");
					nav1.css("color","#D2691E");
					nav3.css("color","#D2691E");
					loadart($(this).html());
				});
				nav3.mousedown(function(){
					nav3.css("color","cadetblue");
					nav2.css("color","#D2691E");
					nav1.css("color","#D2691E");
					loadart($(this).html());
				});
				$("#but-back").mousedown(function(){
		    		window.history.back(-1); 
		    	});
				function loadart(leveEdu){
					$.ajax({
						url:'${pageContext.request.contextPath}/article/byStyle',
						type:'get',
						data:{'style':leveEdu,'type':"古诗"},
						/* dataType:'json', */
						success:function(data){
							 
							 var obj=data;
							 obj=JSON.parse(obj);  //这里需要装换为json格式
							var html=template("artinfo",obj);
				            $('.content-div').html(html);
						}
					});
				}
			})
			
		</script>
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
				font-weight: bold;
				font-size:18px;
		        font-family: "华文楷体";
			}
			li{
				list-style: none;
			}
			.nav-card-footer{
				border-bottom:1px solid #808080;
				height: 30px;
			}
			.nav-card-footer li{
				float: left;
				padding-top: 3px;
				padding-left:60px ;
				color: 	#D2691E;
			}
			
			.nav-card img{
    		background-size:contain|cover;
			width:100%;
			height: 100%;
    	}
    	 .title-li{
		  	color: #4169E1;
		  	font-size:18px;
		  	padding-bottom: 5px;
		  }
		  .author-li{
		    font-size:14px;
		  	color: #778899;
		  }
		  .content-div{
		  	margin-top: 220px;
		  }
		</style>
		
	</head>

	<body>
		
		<div class="">
			<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">古诗词</h1>
		      
		    </header>
		</div>
		
		<div class="nav-card mui-bar mui-bar-nav" style="margin-top: 45px; width: 100%; padding: 0;" >
			<ul class="mui-table-view">
		    <li class="mui-table-view-cell" style="padding: 0;">
		    	<img src="${pageContext.request.contextPath}/img/wenyanwen.jpg" style="height: 150px; width: 100%;"/>
				<!--页脚，放置补充信息或支持的操作-->
				<div class="nav-card-footer">
					<ul style="width: 100%; margin: auto;">
						<li  id="nav-li1">小学</li>
						<li id="nav-li2">初中</li>
						<li id="nav-li3">高中</li>
					</ul>
				</div>
		    </li>
		    
		</ul>
			<!--内容区-->
		</div>
		<div class="content-div" >
			
			</ul>
		</div>
		<script type="text/html" id="artinfo">
             <ul class="mui-table-view">
              {{each list as value i}}
			    <li class="mui-table-view-cell">
			        <div class="mui-navigate-right" >
		    		<ul ontouchstart="window.location.href='${pageContext.request.contextPath}/article/detail/{{value.id}}'" style="width:50%">
		    			<li class="title-li">
		    			{{value.title}}
		    			</li>
		    			<li class="author-li">{{value.author}}</li>
		    		</ul>
		    	</div>
			    </li>
              {{/each}}
             </ul>
		</script>
	</body>

</html>