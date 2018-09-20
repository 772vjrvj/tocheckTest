<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Logout</title>
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet"><title>Insert title here</title>
<jsp:include page="style.jsp"/>
<style type="text/css">
   #text{
      width: 400px;
      margin: 0 auto;
      margin-top: 120px;
      text-align: center;
      font-size: 42px;
      text-decoration: none;
   }
   a:hover,a:link,a:visited {
      text-decoration: none;
}
</style>
</head>
<body>
<div id="text"><a href="index.jsp">
You have been successfully logged out.</a></div>
<jsp:include page="foot.jsp"/>
</body>
</html>