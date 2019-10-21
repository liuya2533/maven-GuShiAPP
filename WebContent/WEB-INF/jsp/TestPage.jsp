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
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/template-web.js"></script>
		<script type="text/javascript">
			$(function(){
				mui.init();
				var no=0;
				var j=0;
				var arr=new Array();
				var grade=0; //得分
				
				$(".selected-li").mousedown(function(){
					
					var i=$(this).index();
					$(this).css("background","#00FFFF");
					arr[j]=$(".selected-li:eq("+(i+4*no)+")").html();
					$(".selected-li:not(:eq("+(i+4*no)+"))").css("background","#F0FFFF");
				});
				
				$(".selected-li:eq(0)").html();
				$(".selected-li:eq(1)").html();
				$(".selected-li:eq(2)").html();
				$(".selected-li:eq(3)").html();
				$("#gap-but").mousedown(function(){
					
				});
                $("#selected-but").mousedown(function(){
                	$.ajax({
						url:'${pageContext.request.contextPath}/article/collect',
						type:'get',
						data:{'id':},
						success:function(data){
							
							if(data==1){
								alert("收藏成功！");
								$("#collect_span").removeClass("mui-icon-star").addClass("mui-icon-starhalf");
							}else{
								alert("收藏失败！");
							}
						}
					});
				});
				
				
				//根据str答案来产生多少个空格
				function putgap(str,eqnum,typenum){
					var num=str.length;
					
					var text1="";
					for(var i=0;i<num;i++){
						if(typenum==0){
							text1=text1+"<li class='gap-li'><input type='text' style='padding:5px 10px' size='1' maxlength='1' name='firstname' value=''></li>";
						}else if(typenum==1){
							
							text1=text1+"<li class='gap-li'><input type='text' style='padding:5px 10px' size='1' maxlength='1' name='firstname' value='"+str[i]+"'></li>"
						}
						
					}
					$(".gap-ul:eq("+eqnum+")").html(text1);
				}
				//在空格处添加答案
			});
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
			}
			.selected-li{
				background: #F0FFFF;
				width: 100%;
				height: 45px;
				border: 2px solid 	#B0C4DE;
				padding-top: 10px;
				border-radius: 10%;
				margin-bottom: 10px;
			}
			
			.gap-li{
				margin-right: 2px;
				width: 12%;
				display: inline-block;
			}
			.answer-input{
				text-align: center;
			}
		</style>
	</head>

	<body>
		
		<div class="">
			<header class="mui-bar mui-bar-nav" ">
		      <span class="mui-icon mui-icon-back"></span>
		      <h1 class="mui-title">诗词自测</h1>
		    </header>
		</div>
		
		
		<div style="margin-top: 40px;text-align: center; display: none;"  class="content">
			<div style="width: 100%; margin-top: 40%; margin-bottom:60px; "class="gap-div">
				<span class="que-no">1/20 : </span><span class="que-title">蓬头稚子学垂纶</span>,(   )。
				<ul class="gap-ul" style="padding-left: 10px;" >
				    
				</ul>
				<input type="text" value="侧坐莓苔草映身侧坐莓苔草映身" class="answer-input"  readonly="readonly" style='width: 200px; word-wrap:break-word; overflow: hidden;'/>
				<div id="" style="margin-top: 30px;">
					<span>答案:</span><br>
					<textarea style='width: 200px;text-align: center;' class="que-answer">侧坐莓苔</textarea>
				</div>
				
			</div>
			
			<div id="" style="height:40px;padding-top: 30px;" >
			<button style="border-radius:5px ; background: #00FFFF;" id="gap-but" >下一题</button>
		    </div>
		</div>
		
		<div style="margin-top: 40px;text-align: center;  " class="content" >
			<div style="width: 80%; margin-top: 30%; margin-left: 5%;" class="content-div">
				<span class="que-no">1/20 : </span><span class="que-title">蓬头稚子学垂纶</span>,(   )。
				
				<ul class="" style="">
					<li class="selected-li">侧坐莓苔草映身</li>
					<li class="selected-li">路人借问遥招手</li>
					<li class="selected-li">怕得鱼惊不应人</li>
					<li class="selected-li">湖光秋月两相和</li>
				</ul>
				<input type="hidden" value="侧坐莓苔草映身" class="answer-input"/>
			</div>
			<div id="">
			<button style="border-radius:5px ; background: #00FFFF;" id="selected-but">下一题</button>
		</div>
		</div>
		
	</body>

</html>