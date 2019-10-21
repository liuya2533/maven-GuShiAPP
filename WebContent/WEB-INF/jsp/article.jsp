<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
	</head>
	<body>
		<div>
			<ul>
				<li>${articleInfo.title}</li>
				<li>${articleInfo.author}</li>
				<li>
					${articleInfo.content}
				</li>
			</ul>
		</div>
	</body>
</html>
