<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세보기</title>
<jsp:include page="style.jsp"/>
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
	   if($("#switchCheck").attr("checked")=="checked")   {
	      $("#switchText").css('color','black').text("공개");         
	   }else{
	      $("#switchText").css('color','red').text("비공개");         
	   }
	   

	});
	

</script>
<style type="text/css">
	
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
	  background: #a8a8a8;
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
	  background: #a8a8a8;
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
		img{
		top: 28%;
		left:32%;
		text-align: center;
		width:700px;
		height: 700px;
		opacity: 0.4;
		z-index: -5;
		position: absolute;
		}
	
	   #calendar{
	      border: 1px solid #a8a8a8;
	      border-collapse: collapse;
	   }
	   #calendar th{
	      width:80px;
	      background-color: #a8a8a8;
	      text-align: center;
	      
	   }
	   
	   #calendar td{
	      width:100px;
	      height:100px;
	      text-align: left;
	      vertical-align: top;
	   }
	
	   #list{
	   width: 564px;
	   display: none;
	   text-align:left;
	   }
	
	   #container{
	   width: 800px;
	   margin: 0 auto 0 auto;
	   }
	   
	   
	   #calendartitle {
	      border: 1px solid #a8a8a8;
	      border-collapse: collapse;
	      height: 90px;
	      margin: auto;
	      
	   }
	   
	   table{
	      margin: auto;
	      border-collapse: collapse;
	      border-radius: 30px;
	   }

	</style>
	
</head>
<body>
	
	<div id="container">
	         <jsp:useBean id="Cal" class="com.hk.toCheckFinal.utils.cal"/>
	         <jsp:useBean id="Util" class="com.hk.toCheckFinal.utils.Util"/>	   
	         <input type="hidden" name="pKey" value="${pKey}"/>
	   
	   <table style="border-collapse: collapse; border: white">
	      <col width="188px">
	      <col width="188px">
	      <col width="188px">
	   <tr><th colspan="3" style="color:#245682; text-align: center; font-size: 20px;">${dto.title}</th></tr>
	   <tr><td style="color: white">&nbsp;</td></tr>
	   </table>   
	   <table id="calendartitle" border="1" style="border: 3px solid #a8a8a8;">
	      <col width="188px">
	      <col width="188px">
	      <col width="188px">
	         <tr>
	            <th style="background-color:#a8a8a8; color:white; text-align: center;">시작일</th>
	            <th style="background-color:#a8a8a8; color:white; text-align: center;">종료일</th>
	            <th style="background-color:#a8a8a8; color:white; text-align: center;">기간</th>
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
	   <img alt="이미지" src="${dto.photo}" >
	   
	   <c:choose>
	   	<c:when test="${dto.endList eq 'N'}">
	   	
	   	</c:when>
	   	<c:otherwise>
			   <table id="calendartitle" style="border-collapse: collapse; border: white; height: 30px;">
			      <col width="188px">
			      <col width="188px">
			      <col width="188px">
			         <tr>
			            <td colspan="3" style="text-align: right;">
                    	<input type="button" class="btn btn-default btn-xs" value="삭제" onclick="location.href='habitCalDeleteAlone.do?pKey=${dto.pKey}&id=${dto.id}&which=completeList'"/>
			            </td>
			         </tr>
			   </table>
	   	</c:otherwise>
	   </c:choose>
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
	         
	      <c:forEach var = "k" begin = "1" end = "${Cal.dayOfWeek(i,j,1)-1}">
	         <td>&nbsp;</td>
	      </c:forEach>
	
	      <c:forEach var = "n" begin = "1" end = "${Cal.lastDay(i,j,1)}">
	         <td>
	            <c:choose>
	                <c:when test="${(i==map.stYear&&j==map.stMonth&&n<map.stDate)||(i==map.edYear&&j==map.edMonth&&n>map.edDate)}">
		            	<p class="countview" style="color:${Util.fontColor(Cal.dayOfWeek(i,j,1), n)};">${n}</p>
	                </c:when>
	               <c:otherwise>
	               				<p class="countview" style="color:${Util.fontColor(Cal.dayOfWeek(i,j,1), n)};">${n}</p>
				                  <input  class="option-input checkbox" type="checkbox" name="chk" value='${Util.substring(i)}${Util.isTwo(j+"")}${Util.isTwo(n+"")}'
				                  ${Util.checked(chkList, Util.substring(i),Util.isTwo(j+""),Util.isTwo(n+""))} onclick='return(false)'
				                  />
				                  
				                  </td>
	                </c:otherwise>
	            </c:choose>
	            <c:choose>
	               <c:when test="${Util.trtd(Cal.dayOfWeek(i,j,1),n)}">
	                  </td><tr>
	               </c:when>
	               <c:otherwise>
	                  </td>
	               </c:otherwise>
	            </c:choose>
	      </c:forEach>
	      <c:forEach var = "m" begin = "1" end = "${Util.blank(Cal.dayOfWeek(i,j,1),Cal.lastDay(i,j,1))}">
	         <td>&nbsp;</td>
	      </c:forEach>
	         </table>
	      <br>         
	      </c:forEach>
	      </c:forEach>
	</div>
	</body>
	</html>