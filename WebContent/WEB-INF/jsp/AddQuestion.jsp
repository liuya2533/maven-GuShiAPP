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
		        var artid="";
		        $("#submit").click(function(){
		        	if($("#artid-input").val()==""){
		        		alert("不存在该古诗，请先添加该古诗再添加该古诗的测评题！");
		        	}else{
		        		
		        	
					$.ajax({
						url:'${pageContext.request.contextPath}/manage/addQuestion',
						type:'post',
						data:$("form").serialize(),
						/* dataType:'json', */
						success:function(data){
							if(data==1){
								 alert("上传成功！");
							}else{
								alert("上传失败！");
							 }
					    },	
					});	
		        	}
			   });
		        $("#author_input").blur(function(){
			    	
			    	if($("#title_input").val()==""){
			    		alert("请先填写古诗标题")
			    	}else{
				    	$.ajax({
							url:'${pageContext.request.contextPath}/manage/checkArt',
							type:'get',
							data:{'title':$("#title_input").val(),'author':$("#author_input").val()},
							/* dataType:'json', */
							success:function(data){
								if(data=="不存在该古诗"){
									
									alert("请先添加该古诗再添加该古诗的测评题!");
								}else{
									data= JSON.parse(data);
									console.log(data.id);
									var str=data.id;
									$("#artid-input").val(str);
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
		      <li><a style="cursor:pointer;" class="flag" onclick="dj(this)" href="${pageContext.request.contextPath}/page/maganerpage/1">添加古诗词</a></li>
		      <li><a style="cursor:pointer;" class="flag end" onclick="dj(this)">添加测评题</a></li>
		      <li><a style="cursor:pointer;" class="flag" onclick="dj(this)" >用户管理</a></li>
		      <li><a href="#" class="flag" onclick="dj(this);">退出登录</a></li>
		      </ul>
		      <hr class="hidden-sm hidden-md hidden-lg">
		 </div>
		<div id="" class="col-sm-8" style="background-color:#ECF5FF;width:60%;height: 98%;float:right;right: 15%;">
			
				<div class="content">
					<form action="#" method="post">
					<span>古诗词内容添加</span>
					<ul class="mui-table-view">
					    <li class="mui-table-view-cell"><label>古诗词标题  :</label><input type="text"  id="title_input"/></li>
					    <li class="mui-table-view-cell"><label>古诗词作者  :</label><input type="text"  id="author_input"/></li>
					    <input type="hidden" name="artid" value="" id="artid-input"/>
					    <li class="mui-table-view-cell"><label>问题  :</label><input type="text" name="question"/></li>
					    <li class="mui-table-view-cell"><label>答案  :</label><input type="text" name="answer"/></li>
					    <li class="mui-table-view-cell"><label>类型  :</label><input type="radio" name="type" value="选择题" checked=""/>选择题</li>
					    <li class="mui-table-view-cell"><label>选项1  :</label><input type="text" name="selected_1"/></li>
					    <li class="mui-table-view-cell"><label>选项2  :</label><input type="text" name="selected_2"/></li>
					    <li class="mui-table-view-cell"><label>选项3  :</label><input type="text" name="selected_3"/></li>
					    <li class="mui-table-view-cell"><label>选项4  :</label><input type="text" name="selected_4"/></li>
					</ul>
				    <button type="button" class="btn btn-success" id="submit">上传</button>
				    <button type="reset" class="btn btn-info">清空</button>
			   </form>
		    </div>
		</div>
		</div>
	</body>
</html>
