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
		<table>
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<tr><td colspan="4">
		<h3>인증 하기 목록</h3>
		<h4>${dto.title}</h4>
		<h4>${Year1}년 ${Month1}월 ${Date1}일</h4>
		<h4>${diffdays} 일째</h4>
		<h5><span style="color: red">${diffdays}</span>/${dto.term}</h5>
		<c:choose>
		<c:when test="${paramview eq '0'}">
			<input type="button"  value="메인" onclick="location.href='${dto.endList eq 'N' ? 'main':'habitCalCompleteList'}.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'"/>
		</c:when>
        <c:otherwise>
           <input type="button"  value="이전페이지" onclick="location.href='boardlist.do?id=${loginId}&with=${dto.withh eq 'Y'?'2':'1'}'"/>
        </c:otherwise>
        </c:choose>		
        <input type="button"  value="전체일정보기"/>
        <br/>
		<br/>
		</td></tr>
		<c:forEach var="list" items="${list}" varStatus="status">
			<c:choose>
			<c:when test="${(status.count)%4 eq 1}">
				<tr><td>
					<div id="photo">사진</div>
					<div>아아디: ${list.id}</div>
					<c:choose>
						<c:when test="${list.inChkTime eq '/'}">

						</c:when>
						<c:otherwise>
							<div>제목: ${list.inChkTitle}</div>
							<div>인증시간: ${list.inChkTime}</div>
						</c:otherwise>				
					</c:choose>
					<c:choose>
						<c:when test="${list.id eq HcLoginDto.id }">
							<input type="button"  value="인증하기"  onclick="location.href='photoInChkContent.do?id=${HcLoginDto.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}'"/>							
						</c:when>
						<c:otherwise>
							<div style="height: 25px;"></div>						
						</c:otherwise>						
					</c:choose>
				</td>
			</c:when>
			<c:when test="${(status.count)%4 eq 2||(status.count)%4 eq 3}">
				<td>
					<div id="photo">사진</div>
					<div>아아디: ${list.id}</div>				
					<c:choose>
						<c:when test="${list.inChkTime eq '/'}">

						</c:when>
						<c:otherwise>
							<div>제목: ${list.inChkTitle}</div>
							<div>인증시간: ${list.inChkTime}</div>
						</c:otherwise>				
					</c:choose>
					<c:choose>
						<c:when test="${list.id eq HcLoginDto.id }">
							<input type="button"  value="인증하기"  onclick="location.href='photoInChkContent.do?id=${HcLoginDto.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}'"/>							
						</c:when>
						<c:otherwise>
							<div style="height: 25px;"></div>						
						</c:otherwise>				
					</c:choose>				
				</td>
			</c:when>
			<c:when test="${(status.count)%4 eq 0}">
				<td>
					<div id="photo">사진</div>
					<div>아아디: ${list.id}</div>
					<c:choose>
						<c:when test="${list.inChkTime eq '/'}">

						</c:when>
						<c:otherwise>
							<div>제목: ${list.inChkTitle}</div>
							<div>인증시간: ${list.inChkTime}</div>
						</c:otherwise>				
					</c:choose>
					<c:choose>
						<c:when test="${list.id eq HcLoginDto.id }">
							<input type="button"  value="인증하기"  onclick="location.href='photoInChkContent.do?id=${HcLoginDto.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}'"/>							
						</c:when>
						<c:otherwise>
							<div style="height: 25px;"></div>						
						</c:otherwise>					
					</c:choose>				
				</td><tr>
			</c:when>
			</c:choose>	
			</c:forEach>
			<c:forEach var = "m" begin = "1" end = "${(4-(fn:length(list))%4)%4}">
				<c:choose>
					<c:when test="${m eq (4-(fn:length(list))%4)%4}">
						<td>&nbsp;</td></tr>
					</c:when>
					<c:otherwise>
						<td>&nbsp;</td>
					</c:otherwise>				
				</c:choose>
			</c:forEach>
</table>
	</div>
</body>
</html>