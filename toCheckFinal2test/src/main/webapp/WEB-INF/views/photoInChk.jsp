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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>

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
	margin: 0 auto 0 auto;
}

#container {
	width: 1200px;
	margin: auto;
}

#photo{
	display:inline-block;
	width:300px;
	height:300px;
	
}

#image_section{
	width:100%;
	height:100%;

}


table {
	margin: auto;
	width: 1100px;
}
</style>

<script type="text/javascript">

</script>

</head>
<body>
	<div id="container">
		<table>
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<tr><td colspan="4">
		<input id="diff" type="hidden" value="${diffdays}"/>
		<h4>${dto.title}</h4>
		<h4>${Year1}년 ${Month1}월 ${Date1}일</h4>

		
		<c:choose>
			<c:when test="${diffdays==dto.term}">
					<h4 style="color: red">마지막 날</h4>
			</c:when>
			<c:otherwise>
			
			</c:otherwise>

		</c:choose>
		
		<h4>${diffdays} 일째</h4>
		<h5><span style="color: red">${diffdays}</span>/${dto.term}</h5>
		<c:choose>
			<c:when test="${paramview eq '0'}">
				<input type="button"  value="메인" onclick="location.href='${dto.endList eq 'N' ? 'main':'habitCalCompleteList'}.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'"/>
			</c:when>
	        <c:otherwise>
	           <input type="button"  value="이전페이지" onclick="location.href='boardlist.do?id=${loginId}&with=${dto.withh}'"/>
	        </c:otherwise>
        </c:choose>		
        <input type="button"  value="전체일정보기" onclick="location.href='habitCalDetail.do?calString=b&pKey=${dto.pKey}&id=${dto.id}&paramview=${paramview}'"/> 
        <br/>
		<br/>
		</td></tr>
		<c:forEach var="list" items="${list}" varStatus="status">
			<c:choose>
			<c:when test="${(status.count)%4 eq 1}">
				<tr><td>
							<div id="photo">
							<img id="image_section" src="resources/${list.inChkPhoto2}" alt="your image" />
							</div>
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
						<c:when test="${list.id eq loginId && thisDate eq today}">
							<c:choose>		
								<c:when test="${list.inChkTime eq '/'}">
									<input type="button"  value="인증하기"  onclick="location.href='photoInChkContent.do?id=${loginId}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=content'"/>
								</c:when>
								<c:otherwise>
									<input type="button"  value="수정하기"  onclick="location.href='photoInChkContent.do?id=${loginId}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=update'"/>
								</c:otherwise>
							</c:choose>			
						</c:when>
						<c:otherwise>
									<input type="button"  value="내용보기"  onclick="location.href='photoInChkContent.do?id=${list.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=content'"/>
						</c:otherwise>						
					</c:choose>
				</td>
			</c:when>
			<c:when test="${(status.count)%4 eq 2||(status.count)%4 eq 3}">
				<td>
							<div id="photo">
							<img id="image_section" src="resources/${list.inChkPhoto2}" alt="your image" />
							</div>
							<div>아이디: ${list.id}</div>	
					<c:choose>
						<c:when test="${list.inChkTime eq '/'}">

						</c:when>
						<c:otherwise>
							<div>제목: ${list.inChkTitle}</div>
							<div>인증시간: ${list.inChkTime}</div>
						</c:otherwise>				
					</c:choose>
					<c:choose>
						<c:when test="${list.id eq loginId && thisDate eq today}">
							<c:choose>		
								<c:when test="${list.inChkTime eq '/'}">
									<input type="button"  value="인증하기"  onclick="location.href='photoInChkContent.do?id=${loginId}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=content'"/>
								</c:when>
								<c:otherwise>
									<input type="button"  value="수정하기"  onclick="location.href='photoInChkContent.do?id=${loginId}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=update'"/>
								</c:otherwise>
							</c:choose>								
						</c:when>
						<c:otherwise>
									<input type="button"  value="내용보기"  onclick="location.href='photoInChkContent.do?id=${list.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=content'"/>
						</c:otherwise>				
					</c:choose>				
				</td>
			</c:when>
			<c:when test="${(status.count)%4 eq 0}">
				<td><div id="photo">
							<img id="image_section" src="resources/${list.inChkPhoto2}" alt="your image" />
							</div>
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
						<c:when test="${list.id eq loginId && thisDate eq today}">
							<c:choose>		
								<c:when test="${list.inChkTime eq '/'}">
								
									<input type="button"  value="인증하기"  onclick="location.href='photoInChkContent.do?id=${loginId}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=content'"/>
								</c:when>
								<c:otherwise>
									<input type="button"  value="수정하기"  onclick="location.href='photoInChkContent.do?id=${loginId}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=update'"/>
								</c:otherwise>
							</c:choose>							
						</c:when>
						<c:otherwise>
									<input type="button"  value="내용보기"  onclick="location.href='photoInChkContent.do?id=${list.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&paramview=${paramview}&crud=content'"/>
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