<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath }/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath }/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script>
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
				margin-left: 0;
				padding-left: 8px;
				
			}
			.addclass{
				color: cadetblue;
			}
			.rmoclass{
				color: 	#D2691E;
			}
			.nav-card img{
			width:100%;
			height: 100%;
    	}
    	 .title-li{
		  	color: #4169E1;
		  	font-size: 18px;
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
		<script type="text/javascript">
			$(function(){
				mui.init();
				$("#nav-ul li").mousedown(function(){
					
					var i=$(this).index();
					$(this).removeClass("rmoclass").addClass("addclass");
					$("#nav-ul li:not(:eq("+i+"))").removeClass("addclass").addClass("rmoclass");
					loadart($(this).html());
				});
				function loadart(leveEdu){
					$.ajax({
						url:'${pageContext.request.contextPath}/article/byStyle',
						type:'get',
						data:{'style':leveEdu,'type':"近现代诗"},
						success:function(data){
							 
							 var obj=data;
							 obj=JSON.parse(obj);  //这里需要装换为json格式
							var html=template("artinfo",obj);
				            $('.content-div').html(html);
						}
					});
				}
				$("#but-back").mousedown(function(){
		    		window.history.back(-1); 
		    	});
			})
		</script>
	</head>

	<body>
		
		<div class="">
			<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">近现代诗</h1>
		      
		    </header>
		</div>
		
		<div class="nav-card mui-bar mui-bar-nav" style="margin-top: 45px; width: 100%; padding: 0;" >
			<ul class="mui-table-view">
		    <li class="mui-table-view-cell" style="padding: 0;">
		    	<img src="${pageContext.request.contextPath }/img/moderpage.jpg" style="height: 150px; width: 100%;"/>
				<!--页脚，放置补充信息或支持的操作-->
				<div class="nav-card-footer">
					<ul id="nav-ul">
						<li class="addclass">20年代</li>
						<li class="rmoclass">30年代</li>
						<li class="rmoclass">40年代</li>
						<li class="rmoclass">50年代</li>
						<li class="rmoclass">60年代</li>
						<li class="rmoclass">70年代</li>
						
					</ul>
				</div>
		    </li>
		    
		</ul>
			<!--内容区-->
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
		<div class="content-div" >
			
		</div>
	</body>

</html>