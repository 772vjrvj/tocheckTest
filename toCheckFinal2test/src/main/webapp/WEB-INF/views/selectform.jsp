<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>List</title>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<style type="text/css">
   #container{
      text-align: center;
      width: 1000px;
      height: 50%;
      margin: 0 auto;
      margin-top: 140px;
   }
   .butn{
   	  margin-right:30px;
      font-size: 30px;
      width: 300px; 
      height: 300px; 
      border-radius: 100px;
   }
</style>
</head>
<body>
<div id="container">
<br/>
<br/>
<button type="button" class="butn" style="background-color: white;" onclick="location.href='boardListAlone.do'">Alone</button>
<button type="button" class="butn" style="background-color: black; color:white;" onclick="location.href='boardListWith.do'">With</button>
</div>
<div style="text-align: center;">
</div>
</body>
<jsp:include page="foot.jsp"/>
</html>