<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style type="text/css">
	table{
   	  border: 1px solid black;
      margin: auto;
      border-collapse: collapse;
   }
   tr{
      border: 1px solid black;
      width:80px;
      height:35px;
      text-align: center;
      padding-top:5px;
      padding-bottom:5px;
   }
   td{
   	  border: 1px solid black;
      height: 32px;
      text-align: left;
      padding-top: 5px;
      padding-bottom: 5px;
   }
    body{
	  	position: absolute; 
   	  	background: url("img/background.jpg") fixed center center;   
   	  	background-size: cover;  
    	width: 100%; 
    	height: 100%; 
	}
</style>
<script type="text/javascript">
	function ff(ts){
		opener.document.getElementById("image").src=ts;
		opener.document.getElementsByName("photo")[0].value=ts;
		close();
	}
</script>
</head>
<body>
<table>
	<c:forEach var="i" begin="1" end="500" step="1">
	<c:choose>
	<c:when test="${i%5 eq 1}">
		<tr>
			<td><input type="image" src="icon/Shape ${i}.png" width="100px" height="100px" onclick="ff('icon/Shape ${i}.png')"/></td>
	</c:when>
	<c:when test="${i%5 eq 2 ||i%5 eq 3 || i%5 eq 4}">
			<td><input type="image" src="icon/Shape ${i}.png" width="100px" height="100px" onclick="ff('icon/Shape ${i}.png')"/></td>
	</c:when>
	<c:when test="${i%5 eq 0}">
		<td><input type="image" src="icon/Shape ${i}.png" width="100px" height="100px" onclick="ff('icon/Shape ${i}.png')"/></td>
	</tr>
	</c:when>
	</c:choose>
</c:forEach>
</table>
</body>
</html>