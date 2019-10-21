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
		  	color: #778899;
		  	font-size:14px;
		  }
		  .content-div{
		  	margin-top: 220px;
		  	
		  }
		</style>
		<script type="text/javascript">
			$(function(){
				mui.init();
				var selebut=$(".nav-li");
				loadart("小学");
				selebut.eq(0).mousedown(function(){
					loadart($(this).html());
					selebut.eq(0).css("color","cadetblue");
					selebut.eq(1).css("color","#D2691E");
					selebut.eq(2).css("color","#D2691E");
				});
				selebut.eq(1).mousedown(function(){
					loadart($(this).html());
					selebut.eq(1).css("color","cadetblue");
					selebut.eq(0).css("color","#D2691E");
					selebut.eq(2).css("color","#D2691E");
				});
				selebut.eq(2).mousedown(function(){
					loadart($(this).html());
					selebut.eq(2).css("color","cadetblue");
					selebut.eq(1).css("color","#D2691E");
					selebut.eq(0).css("color","#D2691E");
				});
				$("#but-back").mousedown(function(){
		    		window.history.back(-1); 
		    	});
				function loadart(leveEdu){
					$.ajax({
						url:'${pageContext.request.contextPath}/article/byStyle',
						type:'get',
						data:{'style':leveEdu,'type':"文言文"},
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
	</head>

	<body>
		
		<div class="">
			<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">文言文</h1>
		      
		    </header>
		</div>
		
		<div class="nav-card mui-bar mui-bar-nav" style="margin-top: 45px; width: 100%; padding: 0;" >
			<ul class="mui-table-view">
		    <li class="mui-table-view-cell" style="padding: 0;">
		    	<img src="${pageContext.request.contextPath}/img/poterypage.jpg" style="height: 150px; width: 100%;"/>
				<!--页脚，放置补充信息或支持的操作-->
				<div class="nav-card-footer">
					<ul style="width: 100%; margin: auto;">
						<li style="color: cadetblue;" class="nav-li">小学</li>
						<li class="nav-li">初中</li>
						<li class="nav-li">高中</li>
					</ul>
				</div>
		    </li>
		    
		</ul>
			<!--内容区-->
		</div>
		<div class="content-div" >
			
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