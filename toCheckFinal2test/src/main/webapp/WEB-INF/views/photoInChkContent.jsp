<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Certification</title>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
table {
	margin: auto;
	border-top: solid 1px #c0c0c0;
}

th {
	border-bottom: 1px solid #c0c0c0;
	color: black;
	text-align: center;
	height: 35px;
	padding: 2px;
}

td {
	border-bottom: 1px solid #c0c0c0;
	text-align: center;
	height: 35px;
	padding: 2px;
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

#container {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
}

#photo {
	display: inline-block;
	width: 150px;
	height: 255px;
	background-color: white;
}
#tit{
	margin-top: 40px;
	font-size: 24px;
	text-align: center;
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
	<div id="tit">
	<span style="font-size: 20px;">${dto.title}</span> - ${map.ToYear1}/${map.ToMonth1}/${map.ToDate1} (<span style="color: red">${diffdays}</span>/${dto.term})
	</div>
	   <br/>
	   <input type="hidden" name="id" value="${HcInChkDto.id}"/>
	   <input type="hidden" name="pKey" value="${HcInChkDto.pKey}"/>
		
	   
	   <table>
	      <col width="100px">
	      <col width="400px">
	      <col width="100px">
	      <tr>
	         <td colspan="3">
	         <img id="blah" src="resources/${HcInChkDto.inChkPhoto2}" alt="your image" width="100%" height="400px" />         
	      </tr> 
	      <tr >
	         <th>ID</th>
	         <td colspan="3">${HcInChkDto.id}</td>
	      </tr>
	      <tr >
	         <th>Title</th>
	         <td colspan="3">${HcInChkDto.inChkTitle}</td>
	
	      </tr>
	      <tr>
	         <th>Content</th>
	         <td colspan="3">${HcInChkDto.inChkContent}</td>
	      </tr>
	      <tr>
	         <td colspan="3" style="text-align: right;">
	            <input class="btn btn-default btn-xs" type="button"  value="Before" onclick="location.href='habitCalDetail.do?pKey=${dto.pKey}&id=${dto.id}'"/>
           		<c:choose>
					<c:when test="${HcInChkDto.id eq loginId}">
		         	<input class="btn btn-default btn-xs" type="button"  value="Update"  onclick="location.href='photoInChkCrud.do?id=${HcInChkDto.id}&inChkDate=${HcInChkDto.inChkDate}&pKey=${HcInChkDto.pKey}&crud=update'"/>

					</c:when>
					<c:otherwise>
					
					</c:otherwise>				
				</c:choose>
	         </td>
	      </tr>
	   </table>
	</div>
</body>
</html>