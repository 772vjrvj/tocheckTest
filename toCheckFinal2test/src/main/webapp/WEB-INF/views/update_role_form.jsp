<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Role Update</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<style type="text/css">
	th{
		color: white;
		text-align: center;	
		background-color: #00bbdb;
		width: 130px;
		height:35px;
	}

	td{
		text-align: center;	
		height:35px;
	}
	
	tr:nth-child(2n){
		background-color: #d9edf7;
	
	}
	
	
	h4{	
		text-align: center;
		color: #00bbdb;
		font-weight: bold;
	}	


	body{
		margin: 50px 0;
		}

	#container{
		width: 500px;
		margin: auto;
	
	}

	table {
		margin: auto;
	
	}


</style>
</head>
<body>

<%
HcLoginDto ldto=(HcLoginDto)session.getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("index.jsp");
	}
	HcLoginDto dto=(HcLoginDto)request.getAttribute("dto");

%>
<div id="container">
<h4>회원등급변경하기</h4>
<form action="hccontroller.do?command=update_role" method="post">
	<input type="hidden" name="id" value="<%=dto.getId()%>"/>
	<table id="calendartitle" border="1" style="border: 3px solid white;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>사용여부</th>
			<th>등급</th>
		</tr>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getName()%></td>
			<td>
				<select name="enabled" style="text-align: center;">
					<option value="y" <%=dto.getEnabled().toLowerCase().equals("y")?"selected":""%>>사용중</option>								
					<option value="n" <%=dto.getEnabled().toLowerCase().equals("n")?"selected":""%>>탈&nbsp;&nbsp;&nbsp;&nbsp;퇴</option>
				</select>
			</td>			
			<td>
				<select name="role" style="text-align: center;">
					<option value="admin" <%=dto.getRole().toLowerCase().equals("admin")?"selected":""%>>관리자</option>								
					<option value="user" <%=dto.getRole().toLowerCase().equals("user")?"selected":""%>>일반회원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: right;" >
				<input type="submit" class="btn btn-info btn-xs" value="변경완료"/>
				<input type="button" class="btn btn-info btn-xs" value="목록" onclick="location.href='hccontroller.do?command=userlist'"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>