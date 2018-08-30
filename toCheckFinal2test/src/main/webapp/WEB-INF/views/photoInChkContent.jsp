<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>photoInChk</title>
<jsp:include page="head.jsp"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
th {
	color: black;
	text-align: center;
	height: 35px;
}

td {
	text-align: center;
	height: 35px;
}


h4 {
	text-align: center;
	color: black;
	font-weight: bolder;
}

h5 {
	text-align: center;
	color: #245682;
	font-weight: bold;
}

body {
	margin: 50px 0;
}

#container {
	width: 1500px;
	margin: auto;
}

#photo{
	display:inline-block;
	width:150px;
	height: 255px;
	background-color: white;
	
}

   table{
      margin: auto;
      border-collapse: collapse;
   }
</style>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>



</head>
<body>
	<div id="container">
		<table>
			<col width="180px">
			<col width="180px">
			<col width="180px">
			<col width="180px">
			<tr><td colspan="4">
			<h3>개인 인증 하기</h3>
			<h4>${dto.title}</h4>
			<h4>${Year1}년 ${Month1}월 ${Date1}일</h4>
			<h4>${diffdays} 일째</h4>
			<h5><span style="color: red">${diffdays}</span>/${dto.term}</h5>
	           <input type="button"  value="이전페이지" onclick="location.href='habitCalDetail.do?calString=a&pKey=${dto.pKey}&id=${dto.id}&paramview=1'"/>        
	        <br/>
			<br/>
			</td></tr>
		</table>
	<form action="photoInChkInsert.do" method="post" enctype="multipart/form-data">
	   <input type="hidden" name="id" value="${HcLoginDto.id}"/>
	   <input type="hidden" name="paramview" value="${paramview}"/>
	   <input type="hidden" name="pKey" value="${dto.pKey}"/>
	   <table border="1">
	      <col width="600px">
	      <tr>
	         <td colspan="3"><h4>인증 사진 올리기</h4>
	         <c:choose>
	         	<c:when test="${HcLoginDto.id eq loginId}">
			         <input  type="file" name="file" id="imgInp"  value="사진 찾기"/>
	         	</c:when>
	         	<c:otherwise>
	         	
	         	</c:otherwise>
	         
	         </c:choose>
	         <img id="blah" src="resources/${HcInChkDto.inChkPhoto2}" alt="your image" />         
	      </tr> 
	   </table>
	   
	   <table border="1">
	      <col width="100px">
	      <col width="400px">
	      <col width="100px">
	      <tr >
	         <th>아이디</th>
	         <td colspan="3">${HcLoginDto.id}</td>
	      </tr>
	      <tr >
	         <th>제목</th>
	         	<c:choose>
	         		<c:when test="${HcLoginDto.id eq loginId }">
	    		     	<td colspan="3"><input class="contents" type="text" name="inChkTitle" style="width: 490px;" required="required" autocomplete="off"/></td>
	         		</c:when>
	         		<c:otherwise>
			          	<td colspan="3">${HcInChkDto.inChkTitle}</td>
	         		</c:otherwise>
	         	</c:choose>
	      </tr>
	      <tr>
	         <th>내용</th>
	         	<c:choose>
	         		<c:when test="${HcLoginDto.id eq loginId }">	         
	         			<td colspan="3"><textarea class="contents" style="width: 490px;"  rows="5" cols="55" name="inChkContent" required="required" autocomplete="off" ></textarea></td>
	         	    </c:when>
	         		<c:otherwise>
			          	<td colspan="3" >${HcInChkDto.inChkContent}</td>
	         		</c:otherwise>	
	         	</c:choose>         		
	      </tr>
	      <tr>
	         <td colspan="3" style="text-align: right;">
	         	<c:choose>
	            	<c:when test="${HcLoginDto.id eq loginId }">
	            		<input class="btn btn-default btn-xs" type="submit"  value="인증하기"/>
	            	</c:when>
	            	<c:otherwise>
	            	
	            	</c:otherwise>
	            </c:choose>
	         </td>
	      </tr>
	   </table>
	</form>
	</div>
</body>
</html>