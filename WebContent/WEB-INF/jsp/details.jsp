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
		<script src="${pageContext.request.contextPath}/js/recorder.mp3.min.js"></script>
		<style type="text/css">
			* {
			  margin: 0;
			  padding: 0;
			  font-family: "华文楷体";
			}
			html,body{
				height: 100%;
				background:	#FFF8DC ;
				
			}
			ul{
				margin-top: 45px;
				margin-bottom: 60px;
			}
			li{
				width:100%;
                text-align:center;
                list-style: none;
                padding: 10px;
			}
			.ly-foot-div{
				float:left;
				width: 33.3%;
				text-align: center;
				padding-bottom:20px ;
				padding-top: 20px;
			}
			#tape{
				border-radius:50%;
				
			}
			.star{
				background: cadetblue;
				color: #fff;
			}
			.end{
				background: red;
				color: #fff;
			}
			#timer{
			font-size:28px;
			display: none;
			
		}
		#video-div{
			position:fixed;bottom:60px;height: 60px;width: 100%; text-align: center;
		}
		#tape-span{
			position: fixed; right:10px;width: 40px;bottom: 100px;height: 24px;
		}
		</style>
		
		<script type="text/javascript">
		$(function(){
			mui.init();
			place_str($(".place_content"));
			//让内容有句号的换行
			function place_str(obj_html){
				var str=obj_html.html();
				str=str.replace(/。/g,"。<br>");
				str=str.replace(/；/g,"；<br>");
				console.log(str);
				obj_html.html(str);
			}
			var t;
			/* var ssu = new window.SpeechSynthesisUtterance('蓬头稚子学垂纶，侧坐莓苔草映身。路人借问遥招手，怕得鱼惊不应人。');
            window.speechSynthesis.speak(ssu); */
			collect_init();
			
			$("#collect_span").mousedown(function(){
				
				if(${userinfo!=null}){
					if(t==1){
						if(confirm('确定要取消该收藏吗?')){
							$.ajax({
								url:'${pageContext.request.contextPath}/article/removecollect',
								type:'get',
								data:{'artid':${articleInfomap.articleInfo.id}},
								success:function(data){
									if(data==1){
										alert("已取消收藏！");
										$("#collect_span").removeClass("mui-icon-starhalf").addClass("mui-icon-star");
									}else{
										alert("取消收藏失败！");
									}
								}
							});
							t=0;
						}
						
					}else{
						$.ajax({
							url:'${pageContext.request.contextPath}/article/collect',
							type:'get',
							data:{'artid':${articleInfomap.articleInfo.id}},
							success:function(data){
								
								if(data==1){
									alert("收藏成功！");
									$("#collect_span").removeClass("mui-icon-star").addClass("mui-icon-starhalf");
								}else{
									alert("收藏失败！");
								}
							}
						});
						t=1;
					}
				}else{
					alert("请先登录！");
				}
			});
			function collect_init(){
				if(${userinfo == null}){
					$('#collect_span').addClass("mui-icon-star");
					t=0;
				}else{
					if(${(articleInfomap.userid != null)&&(articleInfomap.userid ==userinfo.id)}){
						$('#collect_span').addClass("mui-icon-starhalf");
						t=1;
					}else if(${(articleInfomap.userid != null)&&(articleInfomap.userid !=userinfo.id)}){
						$('#collect_span').addClass("mui-icon-star");
						t=0;
					}else{
						$('#collect_span').addClass("mui-icon-star");
						t=0;
					}
					
				}
			}
			$("#but-back").mousedown(function(){
				window.location.assign("${pageContext.request.contextPath}/article/recommend");
	    		
	    	});
	    	$(".mui-action-menu").mousedown(function(){
				
				mui('.mui-off-canvas-wrap').offCanvas().show();
			});
	    	var mainbody=document.getElementById("main-body");
			var translationbody=document.getElementById("translation-body");
			var enjoybody=document.getElementById("enjoy-body");
			var footdiv1=document.getElementById("foot-div1");
			var footdiv2=document.getElementById("foot-div2");
			var footdiv3=document.getElementById("foot-div3");
			footdiv1.style.borderTop=3+'px '+'solid cadetblue ';
			footdiv2.style.borderTop='none';
			footdiv3.style.borderTop="none";
			footdiv1.onmousedown=function(){
				footdiv1.style.borderTop=3+'px '+'solid cadetblue ';
				mainbody.style.display="block";
				footdiv2.style.borderTop="none"
				translationbody.style.display="none";
				footdiv3.style.borderTop="none"
				enjoybody.style.display="none";
			}
			footdiv2.onmousedown=function(){
				
				footdiv2.style.borderTop=3+'px '+'solid cadetblue ';
				mainbody.style.display="none";
				footdiv1.style.borderTop="none"
				translationbody.style.display="block";
				footdiv3.style.borderTop="none"
				enjoybody.style.display="none";
			}
			footdiv3.onmousedown=function(){
				footdiv3.style.borderTop=3+'px '+'solid cadetblue ';
				mainbody.style.display="none";
				footdiv1.style.borderTop="none"
				translationbody.style.display="none";
				footdiv2.style.borderTop="none"
				enjoybody.style.display="block";
			}
			
			//计时器
			var hours = document.getElementById("hours"),
			minute = document.getElementById("minute"),
			second = document.getElementById("second"),
			timer = null,
			Hours = 0,
			Minute = 0,
			Second = 0;
			
			var temp=true;//开始
			var rec=Recorder();//使用默认配置，mp3格式
			$("#tape").mousedown(function(){
				
				if(temp){
					timer = setInterval(function(){
							Second++;
							if(Second > 59){
								Second = 0;
								Minute++;
								if(Minute >59){
									Minute = 0;
									Hours++;
								}
							}
							if(Second < 10){
								second.innerText = "0" + Second;
							}else{
								second.innerText = Second;
							}
							if(Minute < 10){
								minute.innerText = "0" + Minute;
							}else{
								minute.innerText = Minute;
							}
							if(Hours < 10){
								hours.innerText = "0" + Hours;
							}else{
								hours.innerText = Hours;
							}
						},1000);
					alert("开始录音")
					rec.open(function(){//打开麦克风授权获得相关资源
					    rec.start();//开始录音
					},function(msg,isUserNotAllow){//用户拒绝未授权或不支持
					    console.log((isUserNotAllow?"UserNotAllow，":"")+"无法录音:"+msg);
					});
					$(this).addClass("end").removeClass("star").html("结束");
					
				}else{
					//停止录音时计时器清0
					clearInterval(timer);
					second.innerText = "00" ;
					minute.innerText = "00";
					hours.innerText = "00";
					alert("结束录音");
					rec.stop(function(blob,duration){//到达指定条件停止录音
					            console.log(URL.createObjectURL(blob),"时长:"+duration+"ms");
					            rec.close();//释放录音资源
					            //已经拿到blob文件对象想干嘛就干嘛：立即播放、上传
					            
					            /*立即播放例子*/
					            var audio=$("audio");
					            audio.controls=true;
					            
					            //document.body.appendChild(audio);
					            //简单的一哔
//					            audio.src=URL.createObjectURL(blob);
//					            audio.play();
//					            reader.readAsDataURL(blob);

								/***方式二：使用FormData用multipart/form-data表单上传文件***/
								var reader=new FileReader();
								var form=new FormData();
								form.append("upfile",blob,${articleInfomap.articleInfo.title}); //和普通form表单并无二致，后端接收到upfile参数的文件，文件名为古诗标题.mp3
								form.append("artid",${articleInfomap.articleInfo.id})
								//...其他表单参数
								$.ajax({
								    url:"${pageContext.request.contextPath}/file/upload" //上传接口地址
								    ,type:"POST"
								    ,contentType:false //让xhr自动处理Content-Type header，multipart/form-data需要生成随机的boundary
								    ,processData:false //不要处理data，让xhr自动处理
								    ,data:form
								    ,success:function(data){
								    	if(data>=1){
								    		alert("音频文件上传成功！");
								    	}else{
								    		alert("音频文件上传失败！");
								    	}
								        console.log("上传成功",v);
								    }
								    ,error:function(s){
								        console.error("上传失败",s);
								    }
								});
					            
					        },function(msg){
					        	alert(msg);
					            console.log("录音失败:"+msg);
					        });
					$(this).addClass("star").removeClass("end").html("开始");
				}
				temp=!temp;
			});
			var a=true;
			$("#tape-span").mousedown(function(){
				if(${userinfo!=null}){
				if(a){
					$(this).removeClass("mui-icon-mic").addClass("mui-icon-micoff");
					$("#timer").css("display","block");
					$("audio").css("display","none");
					$("audio")[0].pause();
					
				}else{
					$(this).removeClass("mui-icon-micoff").addClass("mui-icon-mic");
					$("#timer").css("display","none");
					$("audio").css("display","block");
				}
				a=!a;
				}else{
					alert("请先登录");
				}
			});
			$("#record").mousedown(function(){
				 window.location.assign("${pageContext.request.contextPath}/file/loadtape");
				//var ssu = new window.SpeechSynthesisUtterance('hhh');
                // window.speechSynthesis.speak(ssu);
                /*navigator.getUserMedia  = navigator.getUserMedia ||
                          navigator.webkitGetUserMedia ||
                          navigator.mozGetUserMedia ||
                          navigator.msGetUserMedia;

							if (navigator.getUserMedia) {
							    // 支持
							    alert("支持")
							} else {
							    // 不支持
							    alert("不支持");
							}
							navigator.getUserMedia({video: true,audio:true}, function onSuccess(stream) {
							    console.log('已点击允许,开启成功');
							    alert("开启成功")
							}, function onError(error) {
							    console.log("错误：", error);
							    alert("错误")
							});*/
							
                
			})
			
		});
		var temp=true;
		function changeinfo(){
			if(temp){
				$("#author-info").css("display","none");
				$("#article-info").css("display","block");
			}else{
				$("#author-info").css("display","block");
				$("#article-info").css("display","none");
			}
			temp=!temp;
			
		}
		</script>
	</head>
	<body >
	
	   <div id="" style=" height:100%; ">
			<header class="mui-bar mui-bar-nav">
		      <span class="mui-icon mui-icon-back" id="but-back"></span>
		      <h1 class="mui-title">${articleInfomap.articleInfo.title }</h1>
		      <span class="mui-icon " style="float: right;" id="collect_span"></span>
		    </header>
		<div id="main-body" style="display: block;">
			<ul>
				<li>
					<a onclick="changeinfo()">${articleInfomap.articleInfo.author}</a>
				<li>
				<li>
				<c:forEach items="${articleInfomap.classifyList }" var="cl">
				  ${cl.classify_name },
				</c:forEach>
				</li>
				<li>${articleInfomap.articleInfo.dynasty }</li>
				<li id="author-info" style="display:none;">${articleInfomap.articleInfo.introduce}</li>
				<li id="article-info" class="place_content">
					${articleInfomap.articleInfo.content}
					
				</li>
			</ul>
			
			<div  id="video-div">
				<audio src="${pageContext.request.contextPath}/voice/${articleInfomap.articleInfo.voice_url}" controls="controls"></audio>
				  <div id="timer">
				        <span id="hours">00</span>
				        <span>:</span>
				        <span id="minute">00</span>
				        <span>:</span>
				        <span id="second">00</span><br >
				        <button id="tape" class="star">开始</button>
				        <button id="record">记录</button>
				    </div>
			</div>
			<!--  <img src="${pageContext.request.contextPath}/img/timg.jpg" width="30px" height="30px" id="voice-img"/>-->
			<span class="mui-icon mui-icon-mic"  id="tape-span"></span>
		</div>
		
		<div id="translation-body" style="display: none; overflow: auto;">
			<ul>
				<li>注释<li>
				<li>
					<text>
						${articleInfomap.articleInfo.annotation}
					</text>
				</li>
				<li>译文<li>
				<li>
					${articleInfomap.articleInfo.translation}
				</li>
			</ul>
		</div>
		
		<div id="enjoy-body" style="display: none;">
			<ul>
				<li>文章赏析 <li>
				<li>
					${articleInfomap.articleInfo.enjoytext}
				</li>
			</ul>
		</div>
		
		<footer style="position:fixed;bottom:0; width: 100%; background: #FFF;">
	    	
	    		<div class="ly-foot-div" id="foot-div1">
	    			正文
	    		</div>
	    		<div class="ly-foot-div" id="foot-div2">
	    			注译
	    		</div>
	    		<div class="ly-foot-div" id="foot-div3">
	    			赏析
	    		</div>
	    	
	    </footer>
	    </div>
	</body>
</html>