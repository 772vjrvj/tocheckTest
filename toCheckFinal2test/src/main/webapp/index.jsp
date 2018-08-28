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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Anton|Nanum+Gothic|Song+Myung" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
      #backimg{
            content:"";
  		   	position: absolute; 
  	  		background: url("img/index_back.jpg") no-repeat center center;  
  	  		background-size: cover; 
    		width: 100%; 
    		height: 100%; 
    		z-index: -1;
    		opacity: 0.7;
    		top:0;
    		left:0;
   	   }
   	   #container{
   	   	 margin: 0 auto;
   	   	 width: 400px; height: 50%;
   	   }
   	   table{
   	   	 position:absolute;
   	     margin-top: 120px;
   	   }
   	   h1{
   	     margin-top: 140px;
   	  	 font-family: 'Anton', sans-serif;
   	  	 font-size: 140px;
   	  	 opacity: 1.0;
   	  	 text-align: center;
   	   }
   	   *{
   	   	   	   font-family: 'Do Hyeon', serif;
   	   }
</style>
<script type="text/javascript">
	$(function(){
		var id=document.getElementById("id").value;
		if(id=="" || id==null){
			document.getElementById("login").disabled='disabled';
		} else {
			document.getElementById("login").removeAttribute("disabled");
		}
	});
</script>
</head>
<body>
<div id="backimg"></div>
 	 <div id="container">
 	 <h1>GET GOALS</h1>
      <form action="login_after.do" method="post">
         <table id="inputText" style="border-spacing: 50px 50px">
            <col width="400px">
            <col width="400px">
            <col width="400px">
            <tr>
               <td><input id="id" name="id" style="width: 400px;" value="" class="form-control" type="text"  placeholder="아이디를 입력해주세요."/></td>
            </tr>
            <tr>
               <td><input class="form-control" type="password" name="password" placeholder="패스워드를 입력해주세요."/></td>
            </tr>
            <tr>
               <td>&nbsp</td>
            </tr>
            <tr>
               <td colspan="2">
                  <input class="btn btn-default btn-xs" id="login" type="submit" value="로그인"/> 
                  <input class="btn btn-default btn-xs" type="button" value="회원가입" onclick="location.href='regist.do'" />
               </td>
            </tr>
         </table>
      </form>
	</div>
</body>
</html>