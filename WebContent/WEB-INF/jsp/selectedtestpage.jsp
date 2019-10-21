<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/template-web.js"></script>
		<script type="text/javascript">
			$(function(){
				mui.init();
				$(".selected-li").mousedown(function(){
					if($(this).html()=="看图猜句"){
						alert("工程师正在努力开发中。。。");
					}else{
					var type=$("input[type='radio']:checked").val();
					var dynasty=$(this).html();
					window.location.assign("${pageContext.request.contextPath }/selectedTest/?type="+type+"&"+"dynasty="+dynasty);
					}
				});
				$("#but-back").mousedown(function(){
		    		window.history.back(-1); 
		    	});
			})
		</script>
		<style type="text/css">
			html,body{
				height: 100%;
				background:	#FFF8DC ;
				font-size: 18px;
				font-weight: bold ;
				overflow: hidden;
			}
			li{
				list-style: none;
				float: left;
				display: block;
				width: 50%;
				padding-top: 15px;
				padding-bottom: 15px;
				border: 2px solid 	Black;
				border-radius: 10px;
				margin-bottom: 10px;
				
			}
			
		</style>
	</head>

	<body>
		
		<div class="">
			<header class="mui-bar mui-bar-nav" ">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">诗词自测</h1>
		    </header>
		</div>
		<div style="margin-top: 40px;text-align: center;">
			
		    <img src="${pageContext.request.contextPath }/img/testpage.jpg" style="width: 100%;height: 40%;"/>
			<div style="width: 100%; margin-top:5%;  height: 100%;" class="content-div">
				<div id="">
					<span>难度：</span><input type="radio" name="difficult" value="选择题" checked/>选择题    &nbsp; &nbsp;<input type="radio" name="difficult" value="填空题" />填空题
				</div>
				<ul style="padding-left: 10px;padding-right: 10px;">
					<li class="selected-li" >唐诗</li>
					<li class="selected-li" >宋词</li>
					<li class="selected-li" >文言文</li>
					<li class="selected-li" >随机测试</li>
					<li class="selected-li" >看图猜句</li>
				</ul>
			</div>
		</div>
		
	</body>

</html>