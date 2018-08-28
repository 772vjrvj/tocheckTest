
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 중복체크</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript">
	function confirm(isS){
		if(isS=="n"){
			var inputId= opener.document.getElementsByName("id")[0];
			inputId.value=""; //회원가입폼에 아이디 입력박스를 ""으로 초기화하고
			inputId.focus(); //사용자가 바로 입력할 수 있게 커서를 넣어준다.
		}else{
			opener.document.getElementsByName("id")[0].title="y"; //중복체크완료여부
			opener.document.getElementsByName("id")[0].setAttribute( 'readonly', 'readonly' )
			opener.document.getElementsByName("password")[0].focus();
		}
		self.close();//자신의 창을 닫아준다.
	}
</script>
<style type="text/css">
	body{
		background-color: #fd6c8b;
		margin: 25px 0;
		}
	td{
		height: 30px;
		text-align: center;		
	}
	th{
		height: 30px;
		text-align: center;		
	}
	h3{	
		text-align: center;
		font-weight: bold;
	}
	#container{
		width: 350px;
		margin: auto;
	}
</style>
</head>
<body>
<div id="container">
<table id="calendartitle" border="1" style="border: 1px solid white;">
<col width="100px"><col width="250px" >
	<tr>
		<td colspan="2" style="text-align: center;"><h3>GET GOALS</h3></td>
	</tr>	
</table>

<table id="calendartitle" border="1" style="border: 1px solid white;" >
<col width="150px"><col width="250px" >
	<tr>
		<th>아이디</th>
		<td>${map.id}</td>
	</tr>
	<tr>
		<th>사용여부</th>
		<td>${map.nycontent}</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button id="butn" class="btn btn-default btn-xs" onclick="confirm('${map.isS}')">확인</button>
		</td>
	</tr>
</table>
</div>
</body>
</html>