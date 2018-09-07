<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 폼</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<style>
   #container{
      width: 600px;
      margin: 0 auto;
      margin-top: 120px;
   }
   td{
      text-align: center;   
      height:35px;
      font-weight: bolder;
   }
   th{
      text-align: center;   
      width: 100px;
      height:35px;
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
   }
   
   h2{   
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
   }
   table{
      margin : auto;
      border-collapse: collapse;
      border: 1px solid white;
   }
</style>
<body>
<div id="container">
         <h2 style="text-align: center;">나의 정보</h2>
   <table border="1">
   <col width="100px">
   <col width="500px">
      <tr>
         <th>목록</th>
         <th>내용</th>
      </tr>
      <tr>
         <td  id="firstTd">아이디</td>
         <td  id="secondTd" >${HcLoginDto.id}</td>
      </tr>
      <tr>
         <td id="firstTd">이름</td>
         <td id="secondTd">${HcLoginDto.name}</td>
      </tr>
      <tr>
         <td id="firstTd">주소</td>
         <td id="secondTd">${HcLoginDto.address}</td>
      </tr>
      <tr>
         <td id="firstTd">전화번호</td>
         <td id="secondTd">${HcLoginDto.phone}</td>
      </tr>
      <tr>
         <td  id="firstTd">이메일</td>
         <td  id="secondTd">${HcLoginDto.email}</td>
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
         <td colspan="2" style="text-align: right; ">
            <button  class="btn btn-default btn-xs"  onclick="location.href='updateform.do?id=${HcLoginDto.id}'">수정</button>
            <button  class="btn btn-default btn-xs"  onclick="location.href='deluser.do?id=${HcLoginDto.id}'">탈퇴</button>
            <button  class="btn btn-default btn-xs"  onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'">메인</button>
            <button class="btn btn-default btn-xs"onclick="location.href='habitCalCompleteList.do?id=${HcLoginDto.id}'">완료한 리스트</button>
         </td>
      </tr>
   </table>
</div>
</body>
</html>