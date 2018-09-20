
<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>User List</title>
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
		width: 650px;
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
	List<HcLoginDto> list=(List<HcLoginDto>)request.getAttribute("list");//스코프에 객체를 담으면 자동으로 Object형 변환됨


%>
<div id="container">
<h4>회원정보목록조회</h4>
	<table id="calendartitle" border="1" style="border: 3px solid white;">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>등급</th>
		<th>사용여부</th>
		<th>정보변경</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			%>
			<tr><td colspan="4">------가입한 회원이 없습니다.-----</td></tr>
			<%
		}else{
		//향상된 for문 : for(받을 갑 타입 정의 : 꺼낼)
			for(HcLoginDto dto:list){
			%>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>	
				<td><%=dto.getRole().toUpperCase()%></td>
				<td><%=dto.getEnabled().toLowerCase().equals("y")?"사용중":"탈퇴"%></td>
				<td><button style="width: 80px;" class="btn btn-info btn-xs" onclick="location.href='hccontroller.do?command=update_role_form&id=<%=dto.getId()%>'">변경</button></td>
			</tr> 
			<%  
			}
		}
	%>
	<tr>
		<td colspan="5" style="text-align: right;"><button class="btn btn-info btn-xs" onclick="location.href='hccontroller.do?command=main&id=<%=ldto.getId()%>'">메인</button>&nbsp;&nbsp;</td>
	</tr>
</table>
</div>
</body>
</html>