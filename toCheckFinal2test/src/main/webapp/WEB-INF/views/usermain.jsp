<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>usermain</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<jsp:include page="style.jsp"/>
<jsp:include page="head.jsp"/>
<style type="text/css">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,700);
.snip1273 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  margin: 10px 1%;
  min-width: 310px -60px;
  max-width: 310px;
  width: 100%;
  color: #ffffff;
  text-align: left;
  background-color: #000000;
  font-size: 16px;
}
.snip1273 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in;
  transition: all 0.4s ease-in;
}
.snip1273 img {
  position: relative;
  max-width: 100%;
  vertical-align: top;
}
.snip1273 figcaption {
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
  padding: 20px 30px;
}
.snip1273 figcaption:before,
.snip1273 figcaption:after {
  width: 1px;
  height: 0;
}
.snip1273 figcaption:before {
  right: 0;
  top: 0;
}
.snip1273 figcaption:after {
  left: 0;
  bottom: 0;
}
.snip1273 h3,
.snip1273 p {
  line-height: 1.5em;
}
.snip1273 h3 {
  margin: 0 0 5px;
  font-weight: 700;
  text-transform: uppercase;
}
.snip1273 p {
  font-size: 0.8em;
  font-weight: 500;
  margin: 0 0 15px;
}
.snip1273 a {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  z-index: 1;
}
.snip1273:before,
.snip1273:after,
.snip1273 figcaption:before,
.snip1273 figcaption:after {
  position: absolute;
  content: '';
  background-color: #ffffff;
  z-index: 1;
  -webkit-transition: all 0.4s ease-in;
  transition: all 0.4s ease-in;
  opacity: 0.8;
}
.snip1273:before,
.snip1273:after {
  height: 1px;
  width: 0%;
}
.snip1273:before {
  top: 0;
  left: 0;
}
.snip1273:after {
  bottom: 0;
  right: 0;
}
.snip1273:hover img,
.snip1273.hover img {
  opacity: 0.4;
}
.snip1273:hover figcaption,
.snip1273.hover figcaption {
  opacity: 1;
}
.snip1273:hover figcaption:before,
.snip1273.hover figcaption:before,
.snip1273:hover figcaption:after,
.snip1273.hover figcaption:after {
  height: 100%;
}
.snip1273:hover:before,
.snip1273.hover:before,
.snip1273:hover:after,
.snip1273.hover:after {
  width: 100%;
}
.snip1273:hover:before,
.snip1273.hover:before,
.snip1273:hover:after,
.snip1273.hover:after,
.snip1273:hover figcaption:before,
.snip1273.hover figcaption:before,
.snip1273:hover figcaption:after,
.snip1273.hover figcaption:after {
  opacity: 0.1;
}

</style>

</style>
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
	  color: black;
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
<script type="text/javascript">
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
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
	         
				<figure class="snip1273" style="margin-top: 20px;">
	                  <img id="motion" style="text-align: center;" src="${dto.photo}">
	                  <figcaption style="margin-top: 60px;">
	                      <a style="display: block;" href="habitCalDetail.do?pKey=${dto.pKey}&id=${loginId}">
	                      <h5 style="font-size: 30px;">${dto.title}</h5>
	                      <c:choose>
	                      <c:when test="${dto.withh eq 'Y'}">
	                      <p style="color: red; font-size: 30px;">With</p>
	                      </c:when>
	                      <c:otherwise>
	                      <p style="color: blue; font-size: 30px;">Alone</p>
	                      </c:otherwise>
	                      </c:choose>
	                      </a>
	                  </figcaption>
				</figure>
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