<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" ></script>
		<script src="${pageContext.request.contextPath }/js/template-web.js"></script>
		<script type="text/javascript">
		     
			$(function(){
				mui.init();
				mui(".mui-scroll-wrapper").scroll();
				var string="作者";
				loadart(string);
				$("#nav-div li").mousedown(function(){
					
					var i=$(this).index();
					$(this).removeClass("rmoclass").addClass("addclass");
					$("#nav-div li:not(:eq("+i+"))").removeClass("addclass").addClass("rmoclass");
					string=$(this).html()
					loadart(string);
				});
				function loadart(classify_name){
					console.log(classify_name);
					$.ajax({
						url:'${pageContext.request.contextPath}/article/byclassify',
						type:'get',
						data:{'classify_name':classify_name},
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
				
			});
			function jump(temp){
				var classify=$(".addclass").html();
				console.log(classify);
				window.location.assign("${pageContext.request.contextPath}/article/artbyclassify?classify="+classify+"&classify_name="+temp);
			}
		
		</script>
		<style type="text/css">
			html,body{
				height: 100%;
				background:	#FFF8DC ;
				font-size: 18px;
				font-weight: bold ;
				overflow: hidden;
			}
			#nav-div li{
				list-style: none;
				padding-bottom:15px ;
				
			}
			.addclass{
				color: cadetblue;
			}
			.rmoclass{
				color: 	#D2691E;
			}
		</style>
	</head>

	<body>
		
	<header class="mui-bar mui-bar-nav">
      <span class="mui-icon mui-icon-back" id="but-back"></span>
      <h1 class="mui-title">分类筛选</h1>
    </header>
    <div style="margin-top: 40px; overflow: hidden;">
    	<div id="nav-div" style="float: left; width: 25%;">
    		<ul>
    			<li class="addclass">作者</li>
    			<li class="rmoclass">朝代</li>
    			<li class="rmoclass">类型</li>
    			<li class="rmoclass">诗集</li>
    		</ul>
    	</div>
    	<script type="text/html" id="artinfo">
          <ul class="mui-table-view">
            {{each strList as value i}}
                <li class="mui-table-view-cell ">
                   <div class="mui-navigate-right" >
                     <div class="classify_name" onclick="jump('{{value}}')"  style="width:50%;font-size:15px">{{value}}</div>
                   </div>                 
                </li>
            {{/each}}
          </ul>
        </script>
    	<div id="" style="left:25%;top:40px;width: 75%;" class="mui-scroll-wrapper mui-content">
    	<div id="" class="mui-scroll content-div">
    	
		</div>
		</div>
    </div>
	</body>

</html>