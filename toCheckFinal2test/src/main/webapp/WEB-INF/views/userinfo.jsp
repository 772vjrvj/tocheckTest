<%@page import="com.hk.toCheckFinal.dtos.HcLoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ��</title>
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
         <h2 style="text-align: center;">���� ����</h2>
   <table border="1">
   <col width="100px">
   <col width="500px">
      <tr>
         <th>���</th>
         <th>����</th>
      </tr>
      <tr>
         <td  id="firstTd">���̵�</td>
         <td  id="secondTd" >${HcLoginDto.id}</td>
      </tr>
      <tr>
         <td id="firstTd">�̸�</td>
         <td id="secondTd">${HcLoginDto.name}</td>
      </tr>
      <tr>
         <td id="firstTd">�ּ�</td>
         <td id="secondTd">${HcLoginDto.address}</td>
      </tr>
      <tr>
         <td id="firstTd">��ȭ��ȣ</td>
         <td id="secondTd">${HcLoginDto.phone}</td>
      </tr>
      <tr>
         <td  id="firstTd">�̸���</td>
         <td  id="secondTd">${HcLoginDto.email}</td>
      </tr>
      <tr>
         <td id="firstTd">���</td>
         <td id="secondTd">�Ϲ�ȸ��</td>
      </tr>
      <tr>
         <td id="firstTd">��������Ʈ</td>
         <td id="secondTd">${HcLoginDto.ttpoint}</td>
      </tr>
      <tr>
         <td colspan="2" style="text-align: right; ">
            <button  class="btn btn-default btn-xs"  onclick="location.href='updateform.do?id=${HcLoginDto.id}'">����</button>
            <button  class="btn btn-default btn-xs"  onclick="location.href='deluser.do?id=${HcLoginDto.id}'">Ż��</button>
            <button  class="btn btn-default btn-xs"  onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'">����</button>
            <button class="btn btn-default btn-xs"onclick="location.href='habitCalCompleteList.do?id=${HcLoginDto.id}'">�Ϸ��� ����Ʈ</button>
         </td>
      </tr>
   </table>
</div>
</body>
</html>