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
		<script src="${pageContext.request.contextPath}/js/iscroll.js" ></script>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" ></script>
		<style type="text/css">
			* {
		   font-weight: bold;
		   font-size:18px;
		   font-family: "华文楷体";
		   }
		   
			li{
			list-style:none;
			}
		   .nav-ul{
		  	list-style-type:none;
			margin-top:10px;
			margin-bottom: 10px;
			padding:0;
			overflow:hidden;
			background:#fff;
			
		  } 
		  .nav-li{
		  	float: left;
		  }
		  .nav-div{
		  	display: block;
		  	padding: 10px;
		  	color: #0000FF;
		  }
		  #like_div{
		  	background: #FFF;
		  	padding-top:10px ;
		  	padding-bottom: 5px ;
		  }
		  .title-li{
		  	color: #4169E1;
		  	font-size: 18px;
		  }
		  .author-li{
		  	color: #778899;
		  	font-size:14px;
		  }
		</style>
		<script type="text/javascript">
		$(function(){
			mui.init()
			mui(".mui-scroll-wrapper").scroll();
			//var Scroll = new iScroll('wrapper',{hScrollbar:false, vScrollbar:true});
			function jump(url){
				window.location.assign("${pageContext.request.contextPath}/article/detail/"+url);
			}
			
		});
		</script>
	</head>
	<body >
		
		<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
  <!-- 主页面容器 -->
  <div class="mui-inner-wrap">
     <!-- 菜单容器 -->
    <aside class="mui-off-canvas-left">
      <div class="mui-scroll-wrapper" style="background: #F5DEB3;">
        <div class="mui-scroll">
        <div class="">
        	<header class="mui-bar mui-bar-nav">
		    <span class="mui-icon mui-icon-back"></span>
		    <h1 class="mui-title">用户中心</h1>
		    </header>
        </div>
        <div id="" style="height: 100%; background: #fff; margin-top: 40px;">
        
          <ul class="mui-table-view">
			    
			      <c:if test="${userinfo == null}">
			        <li class="mui-table-view-cell">
			        <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/login'">我的信息</div>
			        </li>
			        <li class="mui-table-view-cell">
			        <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/login'">我的收藏</div>
			        </li>
			        <li class="mui-table-view-cell">
			        <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/login'">古诗测评</div>
			         </li>
			      </c:if>
			      <c:if test="${userinfo != null}">
			       <li class="mui-table-view-cell">
			       <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/myinfopage'">我的信息</div>
			       </li>
			       <li class="mui-table-view-cell">
			       <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/mycollect'">我的收藏</di>
			       </li>
			       <li class="mui-table-view-cell">
			       <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/selectedtestpage'">古诗测评</div>
			       </li>
			       <li class="mui-table-view-cell">
			       <div class="mui-navigate-right" class="mui-navigate-right" ontouchstart="window.location.href='${pageContext.request.contextPath}/user/loginout'">退出登录</div>
			       </li>
			      </c:if>
			    
			    
			</ul>
			</div>
        </div>
      </div>
    </aside>
    <!-- 主页面标题 -->
    <header class="mui-bar mui-bar-nav">
      <a class="mui-icon mui-action-menu mui-icon-bars mui-pull-left" ontouchstart="mui('.mui-off-canvas-wrap').offCanvas().show()"></a>
      <h1 class="mui-title">主页</h1>
      <span class="mui-icon mui-icon-search" style="float: right;" id="search-span" ontouchstart="window.location.href='${pageContext.request.contextPath}/page/searchpage'"></span>
    </header>
    <!-- 主页面内容容器 -->
    <div class="mui-content mui-scroll-wrapper">
      <div class="mui-scroll">
      <div>
      		<ul class="nav-ul">
      			<li class="nav-li">
      				<div class="nav-div" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/select/近现代诗'">
      					近现代诗
      				</div>
      			</li>
      			<li class="nav-li">
      				<div class="nav-div" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/select/文言文'">
      					文言文
      				</div>
      			</li>
      			<li class="nav-li">
      				<div class="nav-div" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/select/古诗'">
      					古诗
      				</div>
      			</li>
      			<li class="nav-li" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/select/名句 '">
      				<div class="nav-div">
      					名句
      				</div>
      			</li>
      			<li class="nav-li" ontouchstart="window.location.href='${pageContext.request.contextPath}/article/select/分类 '">
      				<div class="nav-div">
      					分类
      				</div>
      			</li>
      		</ul>
      	</div>
      	<div class=""  id="like_div">
      		<p style="color:black; width: 100%; text-align: center; color:#D2691E">猜你喜欢</p>
      	</div>
      	<div  style="top:100px;height: 550px;" class="mui-scroll-wrapper mui-content">
      		
      	
      	<div  class="mui-scroll">
      	
        <ul class="mui-table-view" id="scroll" >
		<c:forEach items="${artList }" var="art">
		    <li class="mui-table-view-cell">
		    	
		    	<div class="mui-navigate-right" >
		    		<ul ontouchstart="window.location.href='${pageContext.request.contextPath}/article/detail/${art.id}'" style="width:50%">
		    			<li class="title-li">
		    			${art.title}
		    			</li>
		    			<li class="author-li">${art.author}</li>
		    		</ul>
		    	</div>
		    	
		    </li>
		    </c:forEach>
		</ul>
		</div>
		</div>
		</div>
      </div>
    </div>  
  </div>
</div>
	</body>
</html>