<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>photoInChk</title>
<jsp:include page="head.jsp"/>

<style type="text/css">
th {
	color: white;
	text-align: center;
	height: 35px;
}

td {
	text-align: center;
	height: 35px;
}


h4 {
	text-align: center;
	color: black;
	font-weight: bolder;
}

h5 {
	text-align: center;
	color: #245682;
	font-weight: bold;
}

body {
	margin: 50px 0;
}

#container {
	width: 1500px;
	margin: auto;
}

#photo{
	display:inline-block;
	width:150px;
	height: 255px;
	background-color: white;
	
}

table {
	margin: auto;
	width: 1100px;
}
</style>


</head>
<body>
	<div id="container">

	</div>
</body>
</html>