
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<%
   response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 폼</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
   <jsp:include page="head.jsp"/>
<style type="text/css">
   #container{
      width: 400px;
      height: 50%;
      margin: 0 auto;
      margin-top: 140px;   
   }
</style>
<script type="text/javascript">
   function idChk() {
      var id = document.getElementsByName("id")[0].value;
      if (id == null || id == "" || id == undefined) {
         alert("아이디를 반드시 입력해 주세요.");
         document.getElementsByName("id")[0].focus();
      } else {
         window
               .open("idchk.do?id=" + id, "중복체크",
                     "width=400px,height=400px");
      }
   }

   function idChk1() {
      document.getElementsByName("id")[0].setAttribute('title', 'n');
      document.getElementsByName("id")[0].removeAttribute('readonly');
      document.getElementsByName("id")[0].focus();
   }
   
   $(function() {

      $("form").submit(
            function() {
               if ($("input[name=pwCheck]").val() != $(
                     "input[name=password]").val()) {
                  alert("비밀번호가 일치하지 않습니다.");
                  $("input[name=password]").focus();
                  return false;
               }
               if (document.getElementsByName("id")[0].title == 'n') {
                  alert("중복체크를 하세요");
                  return false;
               }
            });

      $("input[name]").not("[name=id]").focus(function() {
         var idTitle = document.getElementsByName("id")[0].title;
	         if (idTitle == "n") {
	            alert("아이디 중복체크를 확인하세요!!");
	            document.getElementsByName("id")[0].focus();
         }else{
        	 
         }
      });
   });

   function pwCheckFunction() {
      var pw = $("input[name=password]").val();
      var pwCheck = $("input[name=pwCheck]").val();
      if (pw == null || pw == "" || pw == undefined || pwCheck == null
            || pwCheck == "" || pwCheck == undefined) {
         $("#pwCheckText").text("");
      } else {
         if (pw == pwCheck) {
            $("#pwCheckText").css('color', 'black').text("비벌번호 일치");

         } else {
            $("#pwCheckText").css('color', 'red').text("비벌번호 불일치");
         }
      }
   }
</script>
</head>
<body>
   <div id="container">
      <form action="regist_after.do" method="post">
         <table id="calendartitle">
            <col width= 400px/>
            <tr>
               <th style="text-align: center;" colspan="3"><h1>회원 가입</h1></th>
            </tr>
            <tr>
               <td><input width="200px;" class="form-control" class="box" placeholder="아이디" width="300px"
                  id="id" type="text" name="id" title="n" required="required"
                  autocomplete="off" />
                  <input class="btn btn-default btn-xs" type="button" value="아이디 중복체크" onclick="idChk()" /> 
               </td>
            </tr>
            <tr>
               <td><input class="form-control" class="box" placeholder="비밀번호"
                  type="password" name="password" required="required"
                  onblur="pwCheckFunction()" /></td>
            </tr>
            <tr>
               <td>
               <input class="form-control" class="box"
                  placeholder="비밀번호 확인" type="password" name="pwCheck"
                  required="required" onblur="pwCheckFunction()" />
                  <div style="display: inline-block; font-size: 12px;"
                     id="pwCheckText"></div></td>
            </tr>
            <tr>
               <td><input class="form-control" placeholder="이름" class="box"
                  type="text" name="name" required="required" autocomplete="off" /></td>
            </tr>
            <tr>
               <td><input class="form-control" placeholder="주소" class="box"
                  type="text" name="address" required="required" autocomplete="off" /></td>
            </tr>
            <tr>
               <td><input class="form-control" placeholder="전화번호" class="box"
                  type="tel" name="phone" required="required" autocomplete="off" /></td>
            </tr>
            <tr>
               <td><input class="form-control" placeholder="E-mail"
                  class="box" type="email" name="email" required="required"
                  autocomplete="off" /></td>
            </tr>
            <tr>
               <td colspan="2">
                  <input class="btn btn-default btn-xs" type="submit" value="가입"> 
                  <input class="btn btn-default btn-xs" type="button" value="취소" onclick="location.href='index.jsp'"> 
                  &nbsp;
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>