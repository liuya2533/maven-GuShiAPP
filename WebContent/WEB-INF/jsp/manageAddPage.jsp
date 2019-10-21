<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" ></script>
        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> 
        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
			body{
				height: 100%;
				width: 100%;
			}
			.content{
				padding-top: 40px;
				text-align: center;
			}
			.start{
		        cursor: pointer;
		    }
		    .end{
		        cursor: pointer;
		        color: #fff;
		        background: #b1b0b0;
		        border: none;
		    }
		 
			.col-sm-4{
			        border: 1px solid rgb(180, 180, 180);
			        border-radius: 8px;    	
			    }
		</style>
		
		<script type="text/javascript">
		    $(function () {
		    //加载事件
		        var collection = $(".flag");
		        $.each(collection, function () {
		            $(this).addClass("start");
		        });
				$("#submit1").click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/manage/addArt',
						type:'post',
						data:$("#form1").serialize(),
						/* dataType:'json', */
						success:function(data){
							 
							if(data>=1){
								 alert("上传成功！");
							}else{
								alert("上传失败！");
							 }
					    }
							
					});				        	
			   });
				$("#submit2").click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/manage/addauthor',
						type:'post',
						data:$("#form2").serialize(),
						/* dataType:'json', */
						success:function(data){
							if(data==1){
								 alert("上传成功！");
							}else{
								alert("上传失败！");
							 }
					    }
							
					});				        	
			   });
                $("#dynasty_input").blur(function(){
			    	
			    	if($("#author_input").val()==""){
			    		alert($("#dynasty_input").val())
			    	}else{
				    	$.ajax({
							url:'${pageContext.request.contextPath}/manage/checkauthor',
							type:'get',
							data:{'name':$("#author_input").val(),'dynasty':$("#dynasty_input").val()},
							/* dataType:'json', */
							success:function(data){
								if(data=="不存在该作者"){
									
									alert("不存在该作者信息请先添加作者信息再添加古诗内容!");
								}else{
									data= JSON.parse(data);
									console.log(data.id);
									var str=parseInt(data.id);
									$("#authorid-input").val(str);
								}
								
						    },	
						});	
			       }
			    });
		    });
		    //单击事件
		    function dj(dom) {
		        var collection = $(".flag");
		        $.each(collection, function () {
		            $(this).removeClass("end");
		            $(this).addClass("start");
		        });
		        $(dom).removeClass("start");
		        $(dom).addClass("end");
		    }
</script>

	</head>
	<body>
		<div style="">
			<header class="mui-bar mui-bar-nav" style="height: 70px;padding-top: 15px; background: #5F9EA0">
		      
		      <h1 class="mui-title">智能古诗词APP后台管理</h1>
		      
		    </header>
			
		</div>
		<div id="" style="margin-top: 70px;">
		<div class="col-sm-4" style="background-color:#FFBB77;width:20%;float:left;top: 50px;">
		      <ul class="nav nav-pills nav-stacked">
		      <li class="active"><a style="cursor:pointer;height: 50px;"><h4>主页</h4></a></li>
		      <li><a style="cursor:pointer;" class="flag end" onclick="dj(this);">添加古诗词</a></li>
		      <li><a style="cursor:pointer;" class="flag" onclick="dj(this);" href="${pageContext.request.contextPath}/page/maganerpage/2">添加测评题</a></li>
		      <li><a style="cursor:pointer;" class="flag" onclick="dj(this);">用户管理</a></li>
		      <li><a href="#" class="flag" onclick="dj(this);">退出登录</a></li>
		      </ul>
		      <hr class="hidden-sm hidden-md hidden-lg">
		 </div>
		<div id="" class="col-sm-8" style="background-color:#ECF5FF;width:60%;height: 98%;float:right;right: 15%;">
			
				<div class="content" style="float: left; width:700px;padding-right: 70px;">
					<form action="#" method="post" id="form1">
					<span>古诗词内容添加</span>
					<ul class="mui-table-view">
					    <li class="mui-table-view-cell"><label>标题  :</label><input type="text" name="title"/></li>
					    <li class="mui-table-view-cell"><label>作者  :</label><input type="text" name="author" id="author_input"/></li>
					    <li class="mui-table-view-cell"><label>朝代  :</label><input type="text" name="dynasty" id="dynasty_input"/></li>
					    <li class="mui-table-view-cell"><label>形式  :</label><input type="radio" name="type" value="古诗" checked=""/>古诗<input type="radio" name="type" value="文言文"/>文言文<input type="radio" name="type" value="近现代诗"/>近现代诗</li>
					    <li class="mui-table-view-cell"><label>教育等级  :</label><input type="radio" name="style" value="小学" checked=""/>小学<input type="radio" name="style" value="初中" />初中<input type="radio" name="style" value="高中" />高中</li>
					    <li class="mui-table-view-cell"><label>文章  :</label><textarea name="content" rows="3" cols="20" ></textarea></li>
					    <li class="mui-table-view-cell"><label>注释  :</label><textarea name="annotation" rows="3" cols="20" ></textarea></li>
					    <li class="mui-table-view-cell"><label>译文  :</label><textarea name="translation" rows="3" cols="20" ></textarea></li>
					    <li class="mui-table-view-cell"><label>诗词鉴赏  :</label><textarea name="enjoytext" rows="3" cols="20" ></textarea></li>
					    <li class="mui-table-view-cell"><label>名言佳句  :</label><input type="text" name="rhesis" /></li>
					    <li class="mui-table-view-cell"><label>类型（比如写景，咏物，抒情，节气） :</label><input type="text" name="classify_name"/></li>
					    <li class="mui-table-view-cell"><label>诗集  :</label><input type="text" name="poem_book"/></li>
					    <input type="hidden" name="author_info" value=0 id="authorid-input"/>
					</ul>
				    <button type="button" class="btn btn-success" id="submit1">上传古诗</button>
				    <button type="reset" class="btn btn-danger">清 空</button>
			   </form>
		    </div>
		    <div class="content" style="float: left; width: 400px;">
					<form action="#" method="post" id="form2">
					<span>作者信息</span>
					<ul class="mui-table-view">
					    
					    <li class="mui-table-view-cell"><label>作者  :</label><input type="text" name="name"/></li>
					    <li class="mui-table-view-cell"><label>朝代  :</label><input type="text" name="dynasty"/></li>
					    <li class="mui-table-view-cell"><label>作者简介  :</label><textarea name="introduce" rows="3" cols="20" ></textarea></li>
					</ul>
				    <button type="button" class="btn btn-success" id="submit2">上传信息</button>
				    <button type="reset" class="btn btn-info">清空</button>
	     </div>
		</div>
		</div>
	</body>
</html>
