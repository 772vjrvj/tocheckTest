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
<h2>시스템오류입니다.:(내용:${msg})</h2>
<h3>관리자에 문의하세요. 관리자:홍길동 000-111-2222</h3>
<a href="index.jsp">메인으로 이동</a>
</body>
</html>