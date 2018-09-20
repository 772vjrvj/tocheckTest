<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ERROR</title>
<style type="text/css">
	#container{
		width: 600px;
		margin: 0 auto;
		margin-top: 140px;
		text-align: center;
	}
</style>
</head>
<jsp:include page="style.jsp"/>
<body>
<div id="container">
	<h2>Not Found your Id or Password!!</h2>
	<h2>Try Again.</h2>
	<h2>
	<a href="index.jsp" style="font-size: 20px;">Main</a>
	</h2>
</div>
</body>
</html>