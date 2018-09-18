<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<jsp:include page="style.jsp"/>
<style type="text/css">
   
</style>
<body>
<div id="container">
<p id="content">회원님의 아이디는  ${dto.id} 입니다.</p>
<input class="btn btn-default btn-xs" type="button" value="확인" onclick="Chk()"/>
</div>

</body>
<jsp:include page="foot.jsp"/>
<script type="text/javascript">
function Chk(){
   location.href = "index.jsp";
}

</script>
</html>