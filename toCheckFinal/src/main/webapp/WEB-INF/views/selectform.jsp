<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="head.jsp"/>
</head>
<body>
${id}님의 선택목록
<br/>
<br/>
<button type="button" onclick="location.href='boardlist.do?id=${id}&role=${role}&with=1'">혼자 하기 목록</button>
<button type="button" onclick="location.href='boardlist.do?id=${id}&role=${role}&with=2'">함께 하기 목록</button>
<button type="button" onclick="location.href='main.do?id=${id}&role=${role}'">이전페이지</button>


</body>
</html>