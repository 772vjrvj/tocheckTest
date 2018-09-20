<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Info</title>
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
   }
   
   h2{   
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
   }
</style>
<body>
<div id="container">
         <h2 style="text-align: center;">My Info</h2>
   <table>
   <col width="100px">
   <col width="500px">
      <tr>
         <th>&nbsp;</th>
         <th>Content</th>
      </tr>
      <tr>
         <td  id="firstTd">ID</td>
         <td  id="secondTd" >${HcLoginDto.id}</td>
      </tr>
      <tr>
         <td id="firstTd">Name</td>
         <td id="secondTd">${HcLoginDto.name}</td>
      </tr>
      <tr>
         <td id="firstTd">Address</td>
         <td id="secondTd">${HcLoginDto.address}</td>
      </tr>
      <tr>
         <td id="firstTd">Tel</td>
         <td id="secondTd">${HcLoginDto.phone}</td>
      </tr>
      <tr>
         <td  id="firstTd">E-mail</td>
         <td  id="secondTd">${HcLoginDto.email}</td>
      </tr>
      <tr>
         <td id="firstTd">Role</td>
         <td id="secondTd">일반회원</td>
      </tr>
      <tr>
         <td id="firstTd">Question</td>
         <td id="secondTd">${HcLoginDto.question}</td>
      </tr>
      <tr>
         <td id="firstTd">Answer</td>
         <td id="secondTd">${HcLoginDto.answer}</td>
      </tr>
      <tr>
         <td colspan="2" style="text-align: right; ">
            <button  class="btn btn-default btn-xs"  onclick="location.href='updateform.do?id=${HcLoginDto.id}'">Update</button>
            <button  class="btn btn-default btn-xs"  onclick="location.href='deluser.do?id=${HcLoginDto.id}'">Delete</button>
            <button  class="btn btn-default btn-xs"  onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'">Main</button>
            <button class="btn btn-default btn-xs"onclick="location.href='habitCalCompleteList.do?id=${HcLoginDto.id}'">Complet List</button>
         </td>
      </tr>
   </table>
</div>
</body>
<jsp:include page="foot.jsp"/>
</html>