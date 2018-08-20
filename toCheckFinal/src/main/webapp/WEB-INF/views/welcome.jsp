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
${id}님회원 가입을 축하드립니다. 
<input type="button" value="확인" onclick="Chk()"/>

<script type="text/javascript">
function Chk(){
	location.href = "index.jsp";
}


</script>



</body>
</html>