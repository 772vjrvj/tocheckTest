<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="head.jsp"/>
<style type="text/css">
	#container{
		width: 600px;
		margin: 0 auto;
		margin-top: 140px;
		text-align: center;
	}
</style>
</head>
<body>
<div id="container">
	<h2>${msg}</h2>
	<h3>문제가 계속 된다면 관리자에게 문의 주세요.</h3>
	<h3>홍길동 Tel)010-1234-5678</h3>
	<a href="index.jsp" style="font-size: 20px;">메인으로 이동</a>
</div>
</body>
</html>