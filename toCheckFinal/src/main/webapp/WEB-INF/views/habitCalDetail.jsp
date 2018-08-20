<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세보기</title>
<jsp:include page="head.jsp"/>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

$(function(){
	if($("#switchCheck").attr("checked")=="checked")	{
		$("#switchText").css('color','black').text("공개");			
	}else{
		$("#switchText").css('color','red').text("비공개");			
	}
	
    $("#switchCheck").change(function(){
    	if($("#switchCheck").is(":checked"))	{
    		$("#switchText").css('color','black').text("공개");			
    	}else{
    		$("#switchText").css('color','red').text("비공개");			
    	}

    });

	
});


</script>
<style type="text/css">
*{font-family: 'Roboto', sans-serif;}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 8px;
  right: 0;
  bottom: 0;
  left: 37px;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #00bbdb;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}


body{
margin: 25px 0px;
}

</style>


<style type="text/css">
	#calendar{
		border: 1px solid #00bbdb;
		border-collapse: collapse;
	}
	#calendar th{
		width:80px;
		background-color: #00bbdb;
		
	}
	
	#calendar td{
		width:80px;
		height:100px;
		text-align: left;
		vertical-align: top;
	}

	#container{
	width: 600px;
	margin: auto;
	left: 150px;	
	}
	
	
	#calendartitle {
		border: 1px solid #00bbdb;
		border-collapse: collapse;
		height: 90px;
		margin: auto;
		
	}
	
	table{
		margin: auto;
		border-collapse: collapse;
	
	}
	
	
</style>

<style>
.switch {
  position: relative;
  display: inline-block;
  width: 33px;
  height: 20px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 13px;
  width: 13px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #00bbdb;
}

input:focus + .slider {
  box-shadow: 0 0 1px #00bbdb;
}

input:checked + .slider:before {
  -webkit-transform: translateX(13px);
  -ms-transform: translateX(13px);
  transform: translateX(13px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

</head>
<body>

<div id="container">
<form action="insertCheck.do" method="post">
	<input type="hidden" name="pKey" value="${pKey}"/>
	<input type="hidden" name="id" value="${id}"/>
	
	
	<table style="border-collapse: collapse; border: white">
		<col width="188px">
		<col width="188px">
		<col width="188px">
	<tr><th colspan="3" style="color:#245682; text-align: center; font-size: 20px;">${dto.title}</th></tr>
	<tr><td style="color: white">&nbsp;</td></tr>
	</table>	
	
	<table id="calendartitle" border="1" style="border: 3px solid #00bbdb;">
		<col width="188px">
		<col width="188px">
		<col width="188px">
			<tr>
				<th style="background-color:#00bbdb; color:white; text-align: center;">시작일</th>
				<th style="background-color:#00bbdb; color:white; text-align: center;">종료일</th>
				<th style="background-color:#00bbdb; color:white; text-align: center;">기간</th>
			</tr>
			<tr>
				<td style="color:#245682; text-align: center;">${map.stYear}년 ${map.stMonth}월 ${map.stDate}일</td>
				<td style="color:#245682; text-align: center;">${map.edYear}년 ${map.edMonth}월 ${map.edDate}일</td>
				<td style="color:red; text-align: center;">${map.term}</td>
			</tr>
			<tr>
				<td colspan="3" style="color:#245682; text-align: center;">${dto.content}</td>				
			</tr>
	</table>
	<table id="calendartitle" style="border-collapse: collapse; border: white; height: 30px;">
		<col width="188px">
		<col width="188px">
		<col width="188px">
			<tr>
				<td colspan="3" style="text-align: right;">
					<input type="button" class="btn btn-info btn-xs" value="메인" onclick="location.href='${dto.endList eq 'N' ? 'main':'habitCalCompleteList'}.do?id=${id}&role=${HcLoginDto.role}'"/>
					<input type="submit" class="btn btn-info btn-xs" value="체크완료"/>
					<input type="button" class="btn btn-info btn-xs" value="삭제" onclick="location.href='habitCalDelete.do?pKey=${pKey}&id=${id}'"/>
					<input type="button" class="btn btn-info btn-xs" value="${dto.endList eq 'N' ? '체크리스트 종료':'체크리스트 복원'}"onclick="location.href='updateEndList.do?pKey=${pKey}&id=${id}&endList=${dto.endList}'"/>
					<div style="height: 5px;"></div>
					<jsp:useBean id="together" class="com.hk.toCheckFinal.utils.Util"/>
					
					<label class="switch">
  						<input type="checkbox" ${dto.calWith eq 'Y' ? 'checked':''} id="switchCheck" name="switchCheck" value="${dto.calWith}"  ${together.together(dto.withh)}>
  						<span class="slider round"></span>
					</label>
					<div style="font-size: 12px; vertical-align:text-top; color: #245682; font-weight: bolder; " id="switchText"></div>		
				</td>
			</tr>
	</table>
	<c:set var="i" value="0"/><c:set var="st" value="0"/><c:set var="ed" value="0"/>
		<c:forEach var = "i" begin = "${map.stYear}" end = "${map.edYear}">	
		
			<table style="border-collapse: collapse; border: white">
			<tr><td style="color: white">&nbsp;</td></tr>
			</table>	
			<table id="calendar" border="1">
			<tr><th style="color: white; text-align: center;">${i}년</th></tr>
			</table>				
			
			<c:choose>
			    <c:when test="${map.stYear eq map.edYear}">
					<c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="${map.edMonth}"/>
			    </c:when>
		   		<c:otherwise>
				<c:choose>
				    <c:when test="${i eq map.stYear}">
						<c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="12"/>
				    </c:when>					
				    <c:when test="${i gt map.stYear and i lt map.edYear}">
						<c:set var="st" value="1"/><c:set var="ed" value="12"/>
				    </c:when>					
				    <c:when test="${map.stYear eq map.edYear}">
						<c:set var="st" value="1"/><c:set var="ed" value="${map.edMonth}"/>
				    </c:when>					

				</c:choose>
				</c:otherwise>
			</c:choose>

		<c:forEach var = "j" begin = "${st}" end = "${ed}">
			<table id="calendar" border="1" style="text-align: center;">
							<caption style="font-weight:bolder; text-align: center; color:#245682;">${j}월</caption>
			<tr style="color: white;">
				<th >일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
			</tr>
			<tr>
			
			<jsp:useBean id="dayOfWeek" class="com.hk.toCheckFinal.utils.cal"/>
			<jsp:useBean id="lastDay" class="com.hk.toCheckFinal.utils.cal"/>
			<jsp:useBean id="Util" class="com.hk.toCheckFinal.utils.Util"/>
			
		<c:forEach var = "k" begin = "1" end = "${dayOfWeek.calGet1(i,j,1)-1}">
			<td>&nbsp;</td>
		</c:forEach>

		<c:forEach var = "n" begin = "1" end = "${lastDay.calGet2(i,j,1)}">
			<td>
				<p class="countview" style="color:${Util.fontColor(dayOfWeek.calGet1(i,j,1), n)};">${n}</p>
				<c:choose>
				    <c:when test="${(i==map.stYear&&j==map.stMonth&&n<map.stDate)||(i==map.edYear&&j==map.edMonth&&n>map.edDate)}">
				    	</td>
				    </c:when>
					<c:otherwise>
						<input  class="option-input checkbox" type="checkbox" name="chk" value='${Util.substring(i)}${Util.isTwo(j+"")}${Util.isTwo(n+"")}'
						
						${Util.checked(chkss, Util.substring(i),Util.isTwo(j+""),Util.isTwo(n+""))}  
						${Util.today(Util.substring(i),Util.isTwo(j+""),Util.isTwo(n+""))}
						/></td>
				    </c:otherwise>
				</c:choose>
				<c:choose>
<%-- 				<c:when test="${(dayOfWeek.calGet1(i,j,1)-1+n)%7 eq 0}"> --%>
					<c:when test="${Util.trtd(dayOfWeek.calGet1(i,j,1),n)}">
						</td><tr>
					</c:when>
				</c:choose>
		</c:forEach>
<%-- 	<c:forEach var = "m" begin = "0" end = "${(7-((dayOfWeek.calGet1(i,j,1)-1+lastDay.calGet2(i,j,1))%7))%7-1}"> --%>
		<c:forEach var = "m" begin = "0" end = "${Util.blank(dayOfWeek.calGet1(i,j,1),lastDay.calGet2(i,j,1))}">
		
			<td>&nbsp;</td>
		</c:forEach>
			</table>
		<br>			
		</c:forEach>
		</c:forEach>
</form>
</div>
</body>
</html>