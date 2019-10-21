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
		<script src="${pageContext.request.contextPath }/js/template-web.js"></script>
		<script type="text/javascript">
			$(function(){
				mui.init();
				var no=0;
				var j=0;
				var arr=new Array();
				var grade=0; //得分
				$("#but-back").mousedown(function(){
		    		window.history.back(-1); 
		    	});
				//选择题模块
				if(${questionMap.type=='选择题'}){
					
				
					$(".selected-li").mousedown(function(){
						
						var i=$(this).index();
						$(this).css("background","#00FFFF");
						arr[j]=$(".selected-li:eq("+(i+4*no)+")").html();
						$(".selected-li:not(:eq("+(i+4*no)+"))").css("background","#F0FFFF");
					});
					
					$(".content-div").eq(0).css("display","block");
					$(".content-div:not(:eq("+no+"))").css("display","none");
					$("#selected-but").mousedown(function(){
						
						if(no<$(".content-div").length-2){
							no=no+1;
							$(".content-div:eq("+no+")").css("display","block");
							$(".content-div:not(:eq("+no+"))").css("display","none");
							j++;
						   if(no==$(".content-div").length-2){
						   	 $("#selected-but").html("提交"); 
						   }
					     }else if($("#selected-but").html()=="再来一次"){
					    		 window.location.assign("${pageContext.request.contextPath }/selectedTest/?type="+"选择题"+"&"+"dynasty=${questionMap.dynasty}");
					     }else{
					     	console.log(arr);
					     	for(var i=0;i<arr.length;i++){
					     		console.log($(".answer-input:eq("+i+")").val());
					     		if(arr[i]==$(".answer-input:eq("+i+")").val()){
					     			
					     			grade=grade+1;
					     		}
					     	}
					     	
					     	$(".content-div:eq("+no+")").html("<span>您的正确率为：</span><span>"+grade+'/'+arr.length+"</span>");
					     	$(".content-div:eq("+no+")").css("display","block");
					     	$("#selected-but").html("再来一次");
					     }
						
					});
				
				}else if(${questionMap.type=='填空题'}){
					
				
					$(".gap-div").eq(0).css("display","block");
					$(".gap-div:not(:eq("+no+"))").css("display","none");
					putgap($(".answer-input:eq("+no+")").val(),no);
					var i_num=0;
					//填空题按钮
					$("#gap-but").mousedown(function(){
						console.log($(".gap-li").length);
						//获取当前这道题空格里的内容
						var gap_text="";
						for(var i=i_num;i<$(".gap-li").length;i++){
							gap_text=gap_text+$(".gap-li:eq("+i+") input").val();
						}
						arr[j]=gap_text;
						i_num=$(".gap-li").length;
						if(no<$(".gap-div").length-2){
							
							no=no+1;
							$(".gap-div:eq("+no+")").css("display","block");
							$(".gap-div:not(:eq("+no+"))").css("display","none");
							putgap($(".answer-input:eq("+no+")").val(),no);
							j++;
						   if(no==$(".gap-div").length-2){
						   	$("#gap-but").html("提交");
						   }
					     }else if($("#gap-but").html()=="再来一次"){
					    		 window.location.assign("${pageContext.request.contextPath }/selectedTest/?type="+"填空题"+"&"+"dynasty=${questionMap.dynasty}");
					     }else{
					     	for(var i=0;i<arr.length;i++){
					     		if(arr[i]==$(".answer-input:eq("+i+")").val()){
					     			grade=grade+1;
					     		}
					     	}
					     	$(".gap-div:eq("+no+")").html("<span>您的正确率为：</span><span>"+grade+'/'+arr.length+"</span>");
					     	$(".gap-div:eq("+no+")").css("display","block");
					     	$("#gap-but").html("再来一次");
					     }
						
					});
					//根据str答案来产生多少个空格
					function putgap(str,eqnum){
						var num=str.length;
						
						var text1="";
						for(var i=0;i<num;i++){
							
							text1=text1+"<li class='gap-li'><input type='text' size='1' maxlength='1' name='firstname' value=''></li>"
						}
						$(".gap-ul:eq("+eqnum+")").html(text1);
					}
				}
				function updateGrade(grade,queArr){
					var data={};
					data["grade"]=grade;
					data["queArr"]=queArr;
					$.ajax({
						type: "POST",
						url: "servehotselectiveajax.htm?&CSRFToken="+$("#CSRFToken").val(),
						data: JSON.stringify(data),//必须
						contentType : "application/json;charsetset=UTF-8",//必须
						dataType:"json",//必须
						cache: true,
						async: false,
						error: function (request) {
						     alert("Connection error");
						},
						success: function (data) {
							
						}
					});

				}
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
			.content-div{
			
			}
			.gap-li{
				margin-right: 2px;
				width: 12%;
				display: inline-block;
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
		<c:if test="${questionMap.type=='填空题'}">
		<div style="margin-top: 40px;text-align: center;" class="content">
		 <c:forEach items="${questionMap.questionList }" var="que" varStatus="num">
			<div style="width: 100%; margin-top: 40%; margin-bottom:60px; "class="gap-div">
				<span >${num.index+1 } : </span><span>${que.question},(   )。</span>
				<ul class="gap-ul" style="padding-left: 10px;" >
				
				</ul>
				<input type="hidden" value="${que.answer}" class="answer-input"/>
			</div>
		</c:forEach>
			
			<div id="" style="height:50px;padding-top: 40px;" >
			<button style="border-radius:5px ; background: #00FFFF;" id="gap-but" >下一题</button>
		    </div>
		</div>
		</c:if>
		
		<c:if test="${questionMap.type=='选择题'}">
		<div style="margin-top: 40px;text-align: center;" class="content" >
		  <c:forEach items="${questionMap.questionList }" var="que" varStatus="num">
			<div style="width: 80%; margin-top: 30%; margin-left: 5%;" class="content-div">
				<span >${num.index+1 } : </span><span>${que.question},(   )。</span>
				
				<ul class="" style="">
					<li class="selected-li">${que.selected_1}</li>
					<li class="selected-li">${que.selected_2}</li>
					<li class="selected-li">${que.selected_3}</li>
					<li class="selected-li">${que.selected_4}</li>
				</ul>
				<input type="hidden" value="${que.answer}" class="answer-input"/>
			</div>
			</c:forEach>
			
			
			<div id="">
			<button style="border-radius:5px ; background: #00FFFF;" id="selected-but">下一题</button>
		</div>
		</div>
		</c:if>
	</body>

</html>