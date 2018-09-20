<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome</title>
<jsp:include page="style.jsp"/>
<style type="text/css">
	#container{
		margin: 0 auto;
		margin-top: 120px;
		text-align: center;
	}
	#content{
		font-size: 42px;
	}
</style>
</head>
<body>
<div id="container">
	<p id="content">${id}님회원 가입을 축하드립니다.</p>
	<input class="btn btn-default btn-xs" type="button" value="확인" onclick="Chk()"/>
</div>
</body>
<script type="text/javascript">
function Chk(){
	location.href = "index.jsp";
}
</script>
</html>