
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자메인</title>


<script type="text/javascript" src="//bl.ocks.org/brattonc/raw/5e5ce9beee483220e2f6/e92e678341ca79fef669ec9bdbc7553845966222/liquidFillGauge.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>

<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="head.jsp"/>


<style>




.carousel {
  height: 100%;
  width: 100%;
  position: absolute;
  transform-style: preserve-3d;
  transition: transform 1s;
}

.item {
  display: block;
  position: absolute;
  background: white;
  width: 250px;
  height: 200px;
  line-height: 200px;
  font-size: 5em;
  text-align: center;
  color: #FFF;
/*   opacity: 0.9; */
  border-radius: 10px;
}

.a0 {
  transform: rotateY(0deg) translateZ(250px);
  background: #fd6c8b;
}
.a1 {
  transform: rotateY(60deg) translateZ(250px);
  background: #fd6c8b;
}
.a2 {
  transform: rotateY(120deg) translateZ(250px);
  background: #fd6c8b;
}
.a3 {
  transform: rotateY(180deg) translateZ(250px);
  background: #fd6c8b;
}
.a4 {
  transform: rotateY(240deg) translateZ(250px);
  background: #fd6c8b;
} 
.a5 {
  transform: rotateY(300deg) translateZ(250px);
  background: #fd6c8b;
}

.next, .prev {
  color: #444;
  position: absolute;
  top: 100px;
  padding: 1em 2em;
  cursor: pointer;
  background: #CCC;
  border-radius: 5px;
  border-top: 1px solid #FFF;
  box-shadow: 0 5px 0 #999;
  transition: box-shadow 0.1s, top 0.1s;
}
.next:hover, .prev:hover { color: #000; }
.next:active, .prev:active {
  top: 104px;
  box-shadow: 0 1px 0 #999;
}
.next { right: -300px; }
.prev { left: -300px; }

</style>


<style type="text/css">
   body {
      padding: 25px;
   }
   
   
   img{
	width: 130px;
	height: 130px;
	
}

   h6,h5 {
      text-align: center;
      margin: 5px auto;
      color: black;
      font-weight: bold;
   }
   a:hover, a:visited, a:link{
      color:black;
      text-decoration:none;
   }

   /* 게이지 막대 컨테이너 */
   figure {
        position: relative;  
        width: 250px; 
        margin:auto;
       height: 25px; 
      border-radius: 8px;
      background: #cecece;
      background: -moz-linear-gradient(top,  #cecece 0%, #ffffff 100%);
      background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cecece), color-stop(100%,#ffffff));
      background: -webkit-linear-gradient(top,  #cecece 0%,#ffffff 100%);
      background: -o-linear-gradient(top,  #cecece 0%,#ffffff 100%);
      background: -ms-linear-gradient(top,  #cecece 0%,#ffffff 100%);
      background: linear-gradient(to bottom,  #cecece 0%,#ffffff 100%);
      filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cecece', endColorstr='#ffffff',GradientType=0 );
   }
   
   /* 게이지 모양 */
   figure div:nth-child(1) {
       width: 250px; 
        position: relative;  
       height: 25px; 
      border-radius: 6px;
   }
   /* 게이지 막대 */
   .progress-fixed div[class*=progress-fixed__bar] {
      background: #fd6c8b;
   }

   /* 퍼센트 글씨 */
   figure div:nth-child(2) {
      position: absolute;  
        top: -88px;  
        right: 10px;  
      font-size: 12px;
      font-weight: bold;
      font-family: sans-serif;
      color: #fff;
      text-shadow: 0 0 2px #000, 0 0 10px #000;
   }


   /*  ** 달성률 a태크  */
   figure div:nth-child(3){
      position: relative;  
      font-size: 15px;
      color: black;
        font-weight: bold;
   }

   /*    전체달성률 둘러싼것  */
   div.liquidGauge {
      text-align: center;  margin: auto;
   }    
   
   /*    공모양 전체 달성률  */
   svg.liquidGauge {
      margin: auto; width: 150px;
      height: 150px;
   }

   /*    전체 박스 */
   #container{
   width: 500px;
   margin-top: 120px;
   
/*    float: left; */
   }

   #container2{
   width: 1400px;
	margin: 50px auto ;
   }


	.container1,#container{display: inline-block;}
	
	.container1 {
	  width: 250px;
	  height: 200px;
	  position: relative;
	  perspective: 1000px;
	   top:-100px; 
	   left: 250px; 
	}

</style>


<script type="text/javascript">
var BG = {}; // BAR GRAPH window object

// FIXED
BG.fixed = function(percentage, duration,i) {
   var pixels = Math.floor(percentage * 2.5); // Percent as a whole number times 2.5 for 250 max pixels
   // Animate bar graph
   var count1 = 0,
   bar = $('.progress-fixed__bar'+i),
   interval1 = Math.floor(duration / pixels),
   incrementer1 = setInterval(function() {
      (count1 <= pixels) ? (bar.width(count1), count1++) : clearInterval(incrementer1);
   }, interval1);
   // Animate percent number
   var count2 = 0,
   percent = $('.progress-fixed__percent'+i),
   interval2 = Math.floor(duration / percentage),
   incrementer2 = setInterval(function() {
      (count2 <= percentage) ? (percent.text(count2 + "%"), count2++) : clearInterval(incrementer2);
   }, interval2);
};


//INITIATE FUNCTIONS
BG.init = function(per,i) {
   BG.fixed(per, 800,i);  // Percentage, duration
};

//TRIGGER INIT
$(function() {

   $(".bar").trigger("click");

});

</script>

<script type="text/javascript">
function loadLiquidGauge(id, value, color, animateTime, waveHeight) {
     if (typeof(color) == "undefined") color = "#000";
     if (typeof(animateTime) == "undefined") animateTime = 1000;
     if (typeof(waveHeight) == "undefined") waveHeight = 0.05;
     
     var gauge = liquidFillGaugeDefaultSettings();
     gauge.circleColor = color;
     gauge.textColor = "black";
     gauge.waveTextColor = "#fff";
     gauge.waveColor = color;
     gauge.circleThickness = 0.1;
     gauge.textVertPosition = 0.5;
     gauge.waveHeight = waveHeight;
     gauge.waveAnimateTime = animateTime;
     
     loadLiquidFillGauge(id, value, gauge);
   }
   
   $(document).ready(function() {
   $("#totalper").trigger("click");
   });
</script>
</head>
<body>

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


<div id="container2">

<div id="container">
<h1 style="text-align: center;">${HcLoginDto.id}님 진행중인 체크 리스트</h1>
<p style="color: #245682; text-align: right; font-weight: bolder; font-size: 15px;" >보유포인트 : ${HcLoginDto.ttpoint}</p>
<br/>
   <input id="totalper" type="hidden"  onclick="loadLiquidGauge('liquidGaugeWater', ${sum}, '#fd6c8b', 1000)">
   <div class="liquidGauge"><h5>전체달성률</h5></div>
   <div class="liquidGauge"><svg class="liquidGauge" id="liquidGaugeWater"></svg></div>
   <div class="liquidGauge">
<br/>

   <br/>
   <br/>
   <button type="button" class="btn btn-default btn-xs" onclick="location.href='selectform.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'">목록보기</button>
   <button type="button" class="btn btn-default btn-xs" onclick="location.href='habitCalForm.do?id=${HcLoginDto.id}'">시작하기</button>
   <button type="button" class="btn btn-default btn-xs" onclick="location.href='point.do?id=${HcLoginDto.id}'">포인트 사용</button></div>
   <div class="liquidGauge"></div>
   <br/>
   <div class="liquidGauge"><button type="button" class="btn btn-default btn-xs" onclick="location.href='userinfo.do?id=${HcLoginDto.id}'">나의 정보 보기</button>
   <span>&nbsp;</span><button type="button" class="btn btn-default btn-xs" onclick="location.href='logout.do'">로그아웃</button></div>
   
</div>


<div class="container1">
	<div class="carousel">
		    <div class="item a0"><a href="habitCalForm.do?id=${HcLoginDto.id}">+</a></div>
		    <div class="item a1"><a href="habitCalForm.do?id=${HcLoginDto.id}">+</a></div>
		    <div class="item a2"><a href="habitCalForm.do?id=${HcLoginDto.id}">+</a></div>
		    <div class="item a3"><a href="habitCalForm.do?id=${HcLoginDto.id}">+</a></div>
		    <div class="item a4"><a href="habitCalForm.do?id=${HcLoginDto.id}">+</a></div>
		    <div class="item a5"><a href="habitCalForm.do?id=${HcLoginDto.id}">+</a></div>
		<c:choose>
	    <c:when test="${fn:length(list) eq 0}">
	          진행중이 리스트가 없습니다.
	    </c:when>
	    <c:otherwise>
	       <c:forEach var="dto" items="${list}" varStatus="status">
	         <c:choose>
	          <c:when test="${dto.endList eq 'Y'}">
	          
	          </c:when>
	          <c:otherwise>
	            <c:set var="per" value="0.0"/>
	            <c:choose>
	               <c:when test="${dto.chkss eq 0}">
	                  
	               </c:when>
	               <c:otherwise>
	                  <c:set var="per" value="${(dto.chkss/dto.term)*100}"/>   
	               </c:otherwise>
	            </c:choose>
	            
	            <div class="item a${status.index}">
	            
		            <img alt="" src="${dto.photo}">
		            <br>        
		            <div class="progress-fixed">
		                 <figure>
		                   <div class="progress-fixed__bar${status.index}"></div>
		                   <div class="progress-fixed__percent${status.index}"></div>
		                   <div class="pertitle"><p style="display:inline-block; ${dto.withh eq 'Y' ? 'color: blue;':'color: red;'} text-align: left; font-weight: bolder; font-size: 11px;" >${dto.withh eq 'Y' ? '함께':'혼자'}</p><a href="habitCalDetail.do?calString=a&pKey=${dto.pKey}&id=${dto.id}&paramview=0">&nbsp;${dto.title}</a></div>   
		                 </figure>
		            </div>
		            <input class="bar" type="hidden"  onclick="BG.init(${per},${status.index})"/>
		        </div>    
		            
	         </c:otherwise>
	         </c:choose>
	      </c:forEach>
	    </c:otherwise>
	   </c:choose>
	
	</div>
	<div class="next">Next</div>
	<div class="prev">Prev</div>																				
</div>

</body>
</html>