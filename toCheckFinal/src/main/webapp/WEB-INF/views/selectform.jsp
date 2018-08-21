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
		text-align: center;
		width: 1000px;
		height: 50%;
		margin: 0 auto;
		margin-top: 140px;
	}
	.butn{
		width: 300px; 
		height: 300px; 
		border-radius: 21px;
	}
</style>
</head>
<body>
<div id="container">
<div style="text-align: center;">${id}님의 선택목록</div>
<br/>
<br/>
<button type="button" class="butn" style="background-color: red;" onclick="location.href='boardlist.do?id=${id}&role=${role}&with=1'">혼자 하기 목록</button>
<button type="button" class="butn" style="background-color: green;" onclick="location.href='boardlist.do?id=${id}&role=${role}&with=2'">함께 하기 목록</button>
<button type="button" onclick="location.href='main.do?id=${id}&role=${role}'">이전페이지</button>
</div>
</body>
</html>