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
${HcLoginDto.id}님          보유 포인트: ${HcLoginDto.ttpoint}
<br/>
<button type="button" onclick="location.href='index.jsp'">구매</button>
<input type="button"  value="이전페이지"
				onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'"/>

</body>
</html>