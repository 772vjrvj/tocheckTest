<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<jsp:include page="head.jsp"/>
<style>
	body{
		margin: 50px 0;
		}
	#container{
		width: 600px;
		margin: 0 auto;
		margin-top: 140px;
	}
	td{
		text-align: center;	
		height:35px;
		font-weight: bolder;
	}
	th{
		color: white;
		text-align: center;	
		width: 100px;
		height:35px;
	}
	#firstTd{
		text-align: center;	
		height:35px;
		font-weight: bolder;
		color: #00bbdb;
	}
	#secondTd{
		text-align: center;	
		height:35px;
		font-weight: normal;
		color: black;
	}
		
	.color{
		text-align: center;	
		height:35px;
		font-weight: bolder;
		color: #00bbdb;
	}
	h4{	
		text-align: center;
		font-weight: bold;
	}
	table {
		margin: auto;
		border-collapse: collapse;
		border: 1px solid white;
		
	}
</style>
<body>
<div id="container">
<form action="updateform_after.do" method="post">
	<input type="hidden" name="id" value="${HcLoginDto.id}"/>
	<table border="1">
	<col width="100px">
	<col width="600px" >
		<tr>
			<td colspan="2"><h4 style="text-align: center;">나의 정보 수정</h4></td>
		</tr>	
	</table>
	
	<table border="1">
	<col width="100px">
	<col width="182px" >
		<tr>
			<th>목록</th>
			<th style="width: 600px;">내용</th>
		</tr>
		<tr>
			<td class="color" id="firstTd">아이디</td>
			<td class="color" id="secondTd" >${HcLoginDto.id}</td>
		</tr>
		<tr>
			<td id="firstTd">이름</td>
			<td id="secondTd">${HcLoginDto.name}</td>
		</tr>
		<tr>
			<td class="color" id="firstTd">주소</td>
			<td class="color" id="secondTd"><input style="width: 550px; text-align:center; background-color: #d9edf7;" type="text" name="address" value="${HcLoginDto.address}"/></td>
		</tr>
		<tr>
			<td id="firstTd">전화번호</td>
			<td id="secondTd"><input type="tel" style="background-color:white; width: 550px; text-align:center;" name="phone" value="${HcLoginDto.phone}"/></td>
		</tr>
		<tr>
			<td class="color" id="firstTd">이메일</td>
			<td class="color" id="secondTd"><input style="width: 550px;text-align:center; background-color: #d9edf7;" type="email" name="email" value="${HcLoginDto.email}"/></td>
			
		</tr>
		<tr>
			<td id="firstTd">등급</td>
			<td id="secondTd">일반회원</td>
		</tr>
		<tr>
			<td id="firstTd">보유포인트</td>
			<td id="secondTd">${HcLoginDto.ttpoint}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;background-color: #d9edf7;">
				<input type="button" class="btn btn-info btn-xs"  onclick="location.href='userinfo.do?id=${HcLoginDto.id}'" value="취소">
				<input type="submit"  class="btn btn-info btn-xs"  value="수정완료">
			</tr>
	</table>
</form>
</div>
</body>
</html>