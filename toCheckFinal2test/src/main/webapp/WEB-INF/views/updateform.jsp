<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>updateform</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<style>
   #container{
      width: 600px;
      margin: 0 auto;
      margin-top: 60px;
   }
   table{
      margin : auto;
      border-top: 1px solid #c0c0c0;
   }
   th{
      border-bottom: 1px solid #c0c0c0;
      text-align: center;   
      width: 100px;
      height:35px;
      padding-top:10px;
      padding-bottom:10px;
   }
   td{
  	  border-bottom: 1px solid #c0c0c0;
      text-align: center;   
      height:35px;
      font-weight: bolder;
      padding-top:10px;
      padding-bottom:10px;
   }
   #firstTd{
      text-align: center;   
      height:35px;
      font-weight: bolder;
   }
   #secondTd{
      text-align: center;   
      height:35px;
      font-weight: normal;
      color: black;
   }
      
   .color{
      text-align: center;   
      height:35px;
      font-weight: bolder;
   }
   h2{   
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
   }
   .box{
        width: 400px;
   }
</style>
<body>
<div id="container">
<form action="updateform_after.do" method="post">
   <input type="hidden" name="id" value="${HcLoginDto.id}"/>
         <h2 style="text-align: center;">나의 정보 수정</h2>
   <table>
   <col width="100px">
   <col width="500px" >
      <tr>
         <th>목록</th>
         <th style="width: 400px;">내용</th>
      </tr>
      <tr>
         <td id="firstTd">아이디</td>
         <td id="secondTd" >${HcLoginDto.id}</td>
      </tr>
      <tr>
         <td id="firstTd">이름</td>
         <td id="secondTd">${HcLoginDto.name}</td>
      </tr>
      <tr>
         <td id="firstTd">주소</td>
         <td id="secondTd"><input class="box" type="text" style="text-align:center;"  name="address" value="${HcLoginDto.address}"/></td>
      </tr>
      <tr>
         <td id="firstTd">전화번호</td>
         <td id="secondTd"><input class="box" type="tel" style="background-color:white; text-align:center;" name="phone" value="${HcLoginDto.phone}"/></td>
      </tr>
      <tr>
         <td id="firstTd">이메일</td>
         <td id="secondTd"><input class="box" type="email" style="text-align:center;" name="email" value="${HcLoginDto.email}"/></td>
         
      </tr>
      <tr>
         <td id="firstTd">등급</td>
         <td id="secondTd">일반회원</td>
      </tr>
      <tr>
         <td id="firstTd">보유포인트</td>
         <td id="secondTd">${HcLoginDto.ttpoint}</td>
      </tr>
      <tr>
         <td colspan="2" style="text-align: right;">
            <input type="submit" class="btn btn-default btn-xs" value="수정완료">
            <input type="button" class="btn btn-default btn-xs" onclick="location.href='userinfo.do?id=${HcLoginDto.id}'" value="취소">
         </tr>
   </table>
</form>
</div>
</body>
<jsp:include page="foot.jsp"/>
</html>