<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<style type="text/css">
	#container{
		width: 400px;
		margin: 0 auto;
		margin-top: 200px;
		text-align: center;
		
		
	}

</style>
</head>
<body>
<div id="container">

${HcLoginDto.id}님	보유 포인트: ${HcLoginDto.ttpoint}

<button type="button" onclick="location.href='index.jsp'">구매</button>
<input type="button"  value="이전페이지"
				onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'"/>

</div>
</body>
</html>