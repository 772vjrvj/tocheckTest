<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<jsp:include page="style.jsp"/>
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
      text-align: left;
      padding-top: 5px;
      padding-bottom: 5px;
   }
</style>
<body>
<form action = "findId_after.do" method="post">
   <table id="findId">
      <tr>
         <td><h2>Find Id</h2></td>
      </tr>
      <tr>
         <td><input class="form-control" type="text" name="name" placeholder="이름을 입력해주세요." /></td>
      </tr>
      <tr>
         <td><input class="form-control" type="tel" name="phone" placeholder="전화번호를 입력해주세요."/></td>
      </tr>
      <tr>
         <td><input class="btn btn-default btn-xs" type="submit" value="아이디 찾기"  /></td>
      </tr>
   </table>
</form>
</body>
<jsp:include page="foot.jsp"/>
</html>