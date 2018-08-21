<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>목표 시작하기</title>
<jsp:include page="head.jsp"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<style type="text/css">
	body{
		margin: 50px 0;
	}
	#calendar{
		border: 1px solid #00bbdb;
		border-collapse: collapse;
	}
	th{
		width:80px;
		height:35px;
		text-align: center;
	}
	td{
		height: 32px;
		text-align: left;
	}
	h4{	
		text-align: center;
		font-weight: bold;
	}
	#container{
		
		width: 600px;
		margin: 0 auto;
		margin-top: 140px;
	}
	
	table{
		margin: auto;
		border-collapse: collapse;
		border: 1px solid white;
	}
	
/* 	select[name=date] > option {display: none;} */
	
</style>
<script type="text/javascript">

	$(document).ready(function() {
		
		$("form").submit(function(){
			if($("select[name=month]").val()==0){
				alert("월을 입력하세요");
				$("select[name=month]").focus();
				return false;
				
			}else if($("select[name=date]").val()==0){
				alert("일을 입력하세요");
				$("select[name=date]").focus();
				return false;
				
			}else if($("select[name=term]").val()==0){
				$("select[name=term]").focus();
				alert("기간을 입력하세요");
				return false;
			}else if($("select[name=intoper]").val()==0){
				$("select[name=intoper]").focus();
				alert("인원을 입력하세요");
				return false;
			}else if($("select[name=recruit]").val()==0){
				$("select[name=recruit]").focus();
				alert("인원을 입력하세요");
				return false;
			}
		});

		$("select[name=year]").change(function(){
			$("select[name=month]").val("0");
			$("select[name=date]").empty();
			$("select[name=date]").append('<option value="0">선택</option>');
			
			$("select[name=term]").empty();
			$("select[name=term]").append('<option value="0">선택</option>');

			$("select[name=month]").focus();
		});
		
		$("select[name=month]").change(function(){
			$("select[name=date]").focus();
			$("select[name=date]").empty();	
			
			$("select[name=term]").empty();
			$("select[name=term]").append('<option value="0">선택</option>');			
			
			if(($("select[name=month]").val())==0){
				$("select[name=date]").empty();
				$("select[name=date]").append('<option value="0">선택</option>');
				$("select[name=month]").focus();
			}else if(($("select[name=month]").val())==2){

				if(($("select[name=year]").val())%4==0&&($("select[name=year]").val())%100!=0||($("select[name=year]").val())%400==0){
					var op="";
					for(var i=0;i<=29;i++){
						op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
					}
					$('select[name=date]').append(op);
					
				}else{
					
					var op="";			
					for(var i=0;i<=28;i++){
						op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
					}
					$('select[name=date]').append(op);				
				}
			}else if(($("select[name=month]").val())==4||($("select[name=month]").val())==6||($("select[name=month]").val())==9||($("select[name=month]").val())==11){

				var op="";			
				for(var i=0;i<=30;i++){
					op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
				}
				
				$('select[name=date]').append(op);		
				
			}else{

				var op="";			
				for(var i=0;i<=31;i++){
					op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
				}
				
				$('select[name=date]').append(op);		
			}
		});
		
		
		$("select[name=date]").change(function(){
			$("select[name=term]").empty();
			$('#endDate').empty();						
			if($("select[name=date]").val()==0){
				$("select[name=term]").append('<option value="0">선택</option>');
				$("select[name=date]").focus();			
			}else{
				$("select[name=term]").focus();
				var op="";			
				for(var i=0;i<=365;i++){
					op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
				}
				$('select[name=term]').append(op);		
			}
		});

		$(".contents").focus(function(){
				if($("select[name=month]").val()==0||$("select[name=date]").val()==0||$("select[name=term]").val()==0){
					if($("select[name=month]").val()==0){
						alert("월을 입력하세요");
						$("select[name=month]").focus();
					}else if($("select[name=date]").val()==0){
						alert("일을 입력하세요");
						$("select[name=date]").focus();
					}
				}
		});
		
		$("select[name=term]").change(function(){
			if($("select[name=term]").val()==0){
	 			$('#endDate').empty();
	 			$('#usePoint').empty();
			}else{				
				endInput($(this).val());
				pointInput($(this).val());
			}
		});
	});

	function pointInput(termVal){
		
		var usepoint=termVal*100;
		
		$('#usePoint').text("※ "+usepoint+"포인트가 차감됩니다.");		
	}

	function endInput(termVal){
		
		var year=$('select[name=year]').val();
		var month=$('select[name=month]').val();
		var date=$('select[name=date]').val();

						
			var date1 = new Date(parseInt(year),parseInt(month)-1,parseInt(date)+parseInt(termVal)-1);
			var edDate2=date1.getFullYear()+"년 "+(date1.getMonth()+1)+"월 "+ date1.getDate()+"일 ";
	 			$('#endDate').text(edDate2);
		
	}
</script>
<body>
<div id="container">
<form action="habitCalInsert.do" method="post">
	<input type="hidden" name="id" value="${HcLoginDto.id}"/>
	<table class="table" border="1">
		<col width="188px">
		<col width="188px">
		<col width="188px">
		<tr>
			<td colspan="3"><h4>${HcLoginDto.id}의 목표 만들기</h4><p style="text-align: right; font-weight:bold;" >보유 포인트 : ${HcLoginDto.ttpoint}&nbsp;</p></td>
		</tr>	
	</table>
	
	<table class="table" border="1">
		<col width="100px">
		<col width="200px">
		<col width="150px">
		<tr>
			<th>목표제목</th>
			<td><input class="contents" type="text" name="title" style="width: 200px;" required="required" autocomplete="off"/></td>
			<th>인원
			<select name="recruit">
					<c:forEach var = "i" begin = "0" end = "100">
						<option value="${i}" >${i eq 0 ? "선택":i}</option>
			</c:forEach>
			</select>명
			</th>
		</tr>
		<tr>
			<th>모션선택</th>
			<td colspan="2">
				<input type="button"  name="photo" value="선택"/>
			</td>
		</tr>				
		<tr>
			<th>시작일</th>
			<td colspan="2">
				<select name="year">
					<c:forEach var = "i" begin = "${map.year}" end = "${map.year+5}">
						<option value="${i}" ${map.year eq i ? "selected":""} >${i}</option>
					</c:forEach>
				</select>년
				<select name="month">
					<c:forEach var = "i" begin = "0" end = "12">
						<option value="${i}" ${map.month eq i ? "selected":""} >${i eq 0 ? "선택":i}</option>
					</c:forEach>
				</select>월
				<select name="date">
					<c:forEach var = "i" begin = "0" end = "${map.lastDay}">
						<option value="${i}" ${map.date eq i ? "selected":""} >${i eq 0 ? "선택":i}</option>
					</c:forEach>
				</select>일  
			</td>
		</tr>
		<tr>
			<th>기간</th>
			<td colspan="2">
				<select name="term">
					<c:forEach var = "i" begin = "0" end = "365">
						<option value="${i}" >${i eq 0 ? "선택":i}</option>
					</c:forEach>
				</select>일 &nbsp;&nbsp;
				<span style="text-align: right; color: red;" id="usePoint"></span>
			</td>
		</tr>
		<tr>
			<th>종료일</th>
			<td colspan="2" id="endDate"></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>사용포인트</th> -->
<!-- 			<td colspan="2" id="usePoint"></td> -->
<!-- 		</tr> -->
		<tr>
			<th>계획</th>
			<td colspan="2"><textarea class="contents"  rows="5" cols="55" name="content" required="required" autocomplete="off" ></textarea></td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: right;">
				<input type="submit"  value="체크리스트 만들기"/>
				<input type="button"  value="취소"
				onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'"/>
				<input id="endInput1" type="hidden" onclick="endInput()">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>