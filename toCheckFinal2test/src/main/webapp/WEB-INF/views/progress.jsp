
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Progress</title>


<script type="text/javascript" src="//bl.ocks.org/brattonc/raw/5e5ce9beee483220e2f6/e92e678341ca79fef669ec9bdbc7553845966222/liquidFillGauge.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="style.jsp"/>
<jsp:include page="head.jsp"/>
<style type="text/css">
   body {
      padding: 25px;
   }
   
   #title{
      text-align: center;
      
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
   /* 파란 게이지 막대 */
   .progress-fixed div[class*=progress-fixed__bar] {
      background: black;
   }

   /* 퍼센트 글씨 */
   figure div:nth-child(2) {
      position: absolute;  
        top: 2px;  
        right: 10px;  
      font-size: 15px;
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
      margin: auto; 
      width: 240px;
      height: 240px;
   }

   /*    전체 박스 */
   #container{
   width: 400px;
   margin: 0 auto;
   margin-top: 120px;
   }
   #ifnull{
   	font-weight: bold;
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


<div id="container">

   <input id="totalper" type="hidden"  onclick="loadLiquidGauge('liquidGaugeWater', ${sum}, 'black', 1000)">
   
   <div class="liquidGauge"><h3>Total Progress</h3></div>
   <div class="liquidGauge"><svg class="liquidGauge" id="liquidGaugeWater"></svg></div>
   <div class="liquidGauge">
<br/>

   <c:choose>
    <c:when test="${fn:length(list1) eq 0}">
          <div id="ifnull">
		There are no listings in progress.</div>
    </c:when>
    <c:otherwise>
       <c:forEach var="dto" items="${list1}" varStatus="status">
            <c:set var="per" value="0.0"/>
            <c:choose>
               <c:when test="${dto.chkCount eq 0}">
                  
               </c:when>
               <c:otherwise>
                  <c:set var="per" value="${(dto.chkCount/dto.term)*100}"/>   
               </c:otherwise>
            </c:choose>
            <div class="progress-fixed">
                 <figure>
                   <div class="progress-fixed__bar${status.index}"></div>
                   <div class="progress-fixed__percent${status.index}"></div>
                   <div class="pertitle"><a href="habitCalDetail.do?calString=a&pKey=${dto.pKey}&id=${dto.id}&paramview=0">&nbsp;${dto.title}</a></div>   
                 </figure>
            </div>
            <input class="bar" type="hidden"  onclick="BG.init(${per},${status.index})"/>
            <br/>
            <br/>

      </c:forEach>
    </c:otherwise>
   </c:choose>


   <br/>
   <br/>

   <div class="liquidGauge"></div>
   <br/>
</div>
</body>
</html>