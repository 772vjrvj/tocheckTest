<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Pw</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<script type="text/javascript">

   $(document).ready(function() {


      $("form").submit(function(){
    	  
         if($("input[name=answer]").val()==""||$("input[name=answer]").val()==null||$("input[name=answer]").val()=="undefined"){

            alert("답을 입력하세요");
            $("input[name=answer]").focus();
            return false;
      	}
         

      });
   });


</script>


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
<div id="backimg"></div>
<form action = "findPw_After.do" method="post">
   <table id="findPw">
      <tr>
         <td>Question</td>
         
         <td><input class="form-control" type="text" name="question" value="${dto_find}" readonly="readonly"/></td>
      </tr>
      <tr>
         <td>Answer</td>
         <td><input class="form-control" type="text" name="answer" ></td>
      </tr>
      <tr>
         
         <td><input class="btn btn-default btn-xs" type="submit" value="Complete"/></td>
      </tr>
   </table>
</form>
</body>
<jsp:include page="foot.jsp"/>
</html>