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
<script type="text/javascript">
	$('#00').click(function(){
		var click_id=$(this).attr("src");
// 		parent.opener.document.getElementById("image").src=document.getElementById(a).src;
		alert("아이디 전달~!!!!!!!!!!!");
		close();
	});
	
	function ff(ts){
		opener.document.getElementById("image").src=ts;
		close();
	}
</script>
</head>
<body>
<table border="1">
	<c:forEach var="i" begin="1" end="25" step="1">
	<c:choose>
	<c:when test="${i%5 eq 1}">
		<tr>
			<td><input type="image" id="${i}" src="icon/${i}.png" width="100px" height="100px" onclick="ff('icon/${i}.png')"/></td>
	</c:when>
	<c:when test="${i%5 eq 2 ||i%5 eq 3 || i%5 eq 4}">
			<td><input type="image" id="${i}" src="icon/${i}.png" width="100px" height="100px" onclick="ff('icon/${i}.png')"/></td>
	</c:when>
	<c:when test="${i%5 eq 0}">
		<td><input type="image" id="${i}" src="icon/${i}.png" width="100px" height="100px" onclick="ff('icon/${i}.png')"/></td>
	</tr>
	</c:when>
	</c:choose>
</c:forEach>
</table>
</body>
</html>