<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Id</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<style type="text/css">
    table{
        border-top: 1px solid #c0c0c0;
        margin: auto;
        margin-top: 100px;
   }
   th{
      border-bottom: 1px solid #c0c0c0;
      width:80px;
      height:35px;
      text-align: center;
      padding-top:5px;
      padding-bottom:5px;
   }
   td{
      border-bottom: 1px solid #c0c0c0;
      height: 32px;
      text-align: center;
      padding-top: 5px;
      padding-bottom: 5px;
   }
</style>
<jsp:include page="style.jsp"/>
<body>
<div id="container">
<table>
	<tr>
		<td>
			<h2 id="content">Your Id is '${dto.id}'.</h2><br/>
			<input class="btn btn-default btn-xs" type="button" value="Ok" onclick="Chk()"/>
			<br/>
			&nbsp;
		</td>
	</tr>
</table>
</div>
</body>
<jsp:include page="foot.jsp"/>
<script type="text/javascript">
function Chk(){
   location.href = "index.jsp";
}

</script>
</html>