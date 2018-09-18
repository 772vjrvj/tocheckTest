<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Anton|Nanum+Gothic|Song+Myung" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<jsp:include page="style.jsp"/>
<style type="text/css">
   table{
        border-top: 1px solid #c0c0c0;
      margin: auto;
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
<form action = "findPw.do" method="post">
   <table id="findPw">
      <tr>
         <td>아이디를 입력해주세요</td>
      </tr>
      <tr>
         <td><input class="form-control" type="text" name="id"/></td>
      </tr>
      <tr>
         <td>번호를 입력해주세요</td>
      </tr>
      <tr>
         <td><input class="form-control" type="tel" name="phone"/></td>
      </tr>
      <tr>
         <td><input class="btn btn-default btn-xs" type="submit" value="본인확인"/></td>
      </tr>
   </table>
</form>
</body>
<jsp:include page="foot.jsp"/>
</html>