<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet">
<title>Promise</title>
<style type="text/css">
   #container{
      position: absolute; 
          background: url("img/promise.jpg") no-repeat fixed center center;  
          background-size: contain;
       width: 100%; 
       height: 100%; 
       z-index: -1;
       top:0;
       left:0; 
       margin: 0 auto;
   }
   #content{
      width: 360px;
      margin: 0 auto;
      margin-top: 100px;
      text-align: center;
   }
   *{
      font-family: 'Song Myung', serif;
   }
   #content{
      font-size: 24px;
   }
   #title{
      font-size: 72px;
   }
   #stap{
      position: absolute;
      width: 120px;
   }
</style>
</head>
<body>
<form action="promiseCheck.do?id=${map.id}&pKey=${map.pKey}&hostId=${map.hostId}" method="post">
<div id="container">
<div id="content">
<h1 id="title">서 약 서</h1>
하라. 무조건 하는 것이 배를 만드는 비결의 전부이다. 원하기만 하면 누구든 훌륭한 배를 만들 수 있다. 약간의 연구, 약간의 연습, 그리고 물론 약간의 경험도 필요하긴 하다. 그런데 경험은 시작을 하는 순간 축적되기 시작한다. "나는 경험이 전혀 없어요." 그런 소리를 많이 듣는데, 처음부터 경험이 있는 사람은 아무도 없다. 시작하라. 뭐든 시작하면 저절로 경험이 생긴다. 배를 만드는 내 친구는 이렇게 말한다. "어서 만드세요. 그건 배일 뿐이에요." 처음 해보는 일이라서 좀 서툴다면 그게 어떻단 말인가. 얼마 후에는 일이 척척 손에 붙게 될 것이다. -R.D컬러
<p>동의하십니까?<input type="checkbox" name="promise" required="required"> &nbsp; <img id="stap" src="img/stamp.jpg"></p>
<input type="button" value="취소" onclick="location.href='habitCalWithDetailView.do?pKey=${map.pKey}&id=${map.hostId}'"/><input type="submit"  value="확인"/>
</div>
</div>
</form>
</body>
</html>