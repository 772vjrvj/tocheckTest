<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<jsp:include page="style.jsp"/>
<jsp:include page="head.jsp"/>
<style>
h5{
   font-size: 32px;
}
.carousel {
  height: 100%;
  width: 100%;
  position: absolute;
  transform-style: preserve-3d;
  transition: transform 1s;
}

.next, .prev {
  height: 100%;
  width:  100%;
  position: absolute;
  padding: 1em 2em;
  cursor: pointer;
  transition: box-shadow 0.1s, top 0.1s;
  
}
.next {
 	top: 330px;
 	left: -60px; 
 	}
.prev {
	 top: 330px;
	 right: -210px;
	 
	 }
.btn{
   	 width:  50%;
  	 height: 50%;
  	 left: 100px;
   }
</style>
<style type="text/css">
	#gtitle{
		font-size: 20px;
	}
   #motion{
   		width: 200px;
   		height: 200px;
	}

   h6,h5 {
      text-align: center;
      margin: 5px auto;
      color: black;
      font-weight: bold;
   }
	.item {
	  display: inline-block;
	  position: absolute;
	  background: white;
	  width: 300px;
	  height: 250px;
	  line-height: 250px;
	  font-size: 5em;
	  text-align: center;
	  color: #FFF;
	  opacity: 0.95;
	  border-radius: 10px;
	}
	
	.a0 {
	  transform: rotateY(0deg) translateZ(300px);
	  background: #fbfbfb;
	}
	.a1 {
	  transform: rotateY(60deg) translateZ(300px);
	  background: #fbfbfb;
	}
	.a2 {
	  transform: rotateY(120deg) translateZ(300px);
	  background: #fbfbfb;
	}
	.a3 {
	  transform: rotateY(180deg) translateZ(300px);
	  background: #fbfbfb;
	}
	.a4 {
	  transform: rotateY(240deg) translateZ(300px);
	  background: #fbfbfb;
	} 
	.a5 {
	  transform: rotateY(300deg) translateZ(300px);
	  background: #fbfbfb;
	}
   .container{display: inline-block;}
   .container {
     width: 300px;
     height: 250px;
     position: relative;
     perspective: 1200px;
     left: 36%; 
     margin-top: 10%;
   }
   
</style>

<script type="text/javascript">
	var carousel ;
	currdeg  = 0;
	$(function () {
	   carousel=$(".carousel");
	$(".next").on("click", { d: "n" }, rotate);
	$(".prev").on("click", { d: "p" }, rotate);
	});
	
	function rotate(e){
	if(e.data.d=="n"){
	currdeg = currdeg - 60;
	}
	if(e.data.d=="p"){
	currdeg = currdeg + 60;
	}
	carousel.css({
	"-webkit-transform": "rotateY("+currdeg+"deg)",
	"-moz-transform": "rotateY("+currdeg+"deg)",
	"-o-transform": "rotateY("+currdeg+"deg)",
	"transform": "rotateY("+currdeg+"deg)"
	});
	}
</script>
</head>
<body>
<div class="container">
   <div class="carousel">
          <div class="item a0"><a href="habitCalForm.do?id=${loginId}">+</a></div>
          <div class="item a1"><a href="habitCalForm.do?id=${loginId}">+</a></div>
          <div class="item a2"><a href="habitCalForm.do?id=${loginId}">+</a></div>
          <div class="item a3"><a href="habitCalForm.do?id=${loginId}">+</a></div>
          <div class="item a4"><a href="habitCalForm.do?id=${loginId}">+</a></div>
          <div class="item a5"><a href="habitCalForm.do?id=${loginId}">+</a></div>
      <c:choose>
       <c:when test="${fn:length(list1) eq 0}">
             
       </c:when>
       <c:otherwise>
          <c:forEach var="dto" items="${list1}" varStatus="status">
               <div class="item a${status.index}">
                  <a style="display: block;" href="habitCalDetail.do?pKey=${dto.pKey}&id=${loginId}">
                  <img id="motion" style="text-align: center;" src="${dto.photo}"></a>
                  </div>
         </c:forEach>
       </c:otherwise>
      </c:choose>
   </div>
   <div class="next"><img class="btn" src="img/left.svg"/></div>
   <div class="prev"><img class="btn" src="img/right.svg"/></div>                                                            
</div>
</body>
<jsp:include page="foot.jsp"/>
</html>