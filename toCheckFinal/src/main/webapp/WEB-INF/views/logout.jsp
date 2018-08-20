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
정관장을 구입하세요~!
<br/>
${loginId}님 정상적으로 로그아웃 되었습니다.<br/>
<button type="button" onclick="location.href='index.jsp'">로그인 페이지로 가기</button>


</body>
</html>