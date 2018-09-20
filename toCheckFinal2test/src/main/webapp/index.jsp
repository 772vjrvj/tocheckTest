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
<title>Home</title>
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	  address{
		text-align: center;
		margin-top: 200px;
	  }
      body{
            content:"";
  		   	position: absolute; 
  	  		background: url("img/background.jpg") fixed no-repeat center center;  
  	  		background-size: cover; 
    		width: 100%; 
    		height: 100%; 
    		z-index: -1;
    		top:0;
    		left:0;
   	   }
   	   #container{
   	   	 max-width: none !important;
   	   	 margin: 0 auto;
   	   	 width: 400px; height: 50%;
   	   }
   	   table{
   	   	 position:absolute;
   	     margin-top: 100px;
   	   }
   	   h1{
   	     margin-top: 140px;
   	  	  font-family: 'Playfair Display', serif;
   	  	 font-size: 140px;
   	  	 opacity: 1.0;
   	  	 text-align: center;
   	   }
   	   *{
   	   	   	   font-family: 'Playfair Display', serif;
   	   }
   	   #butn{
   	   	 position: absolute;
   	     width: 400px;
   	   	 text-align: center;
   	   	 top:660px;
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
               <td><input id="id" name="id" style="width: 400px;" value="" class="form-control" type="text"  placeholder="Input Your Id"/></td>
            </tr>
            <tr>
               <td><input class="form-control" type="password" name="password" placeholder="Input Your Password"/></td>
            </tr>
            <tr>
               <td>&nbsp</td>
            </tr>
         </table>
         <div id="butn">
              <input class="btn btn-default btn-xs" id="login" type="submit" value="Login"/> 
              <input class="btn btn-default btn-xs" type="button" value="Sign up" onclick="location.href='regist.do'" />
              <input class="btn btn-default btn-xs" type="button" value="Forgot Id" onclick="location.href='findId.do'" />
              <input class="btn btn-default btn-xs" type="button" value="Forgot Pw" onclick="location.href='findPw_identi.do'" />
         </div>
      </form>
	</div>
	<address>
53, Yangsan-ro, Yeongdeungpo-gu, Seoul, Republic of Korea
<br/>
Respect your efforts, respect yourself. Self-respect leads to self-discipline. When you have both firmly under your belt, that's real power.
</address>
</body>
</html>