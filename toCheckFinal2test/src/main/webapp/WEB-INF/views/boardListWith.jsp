<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>With</title>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<script type="text/javascript"
	src="//bl.ocks.org/brattonc/raw/5e5ce9beee483220e2f6/e92e678341ca79fef669ec9bdbc7553845966222/liquidFillGauge.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
$(function(){
    $("select[name=select1]").change(function(){
    	$("input[name=input2]").val("");

		if($("select[name=select1]").val()=='Start'){
			
		    $('#datepicker').datepicker({
		        //달력 나오게하는 방법 설정  -> button, text, both

		        
// 		        showOn:"both",
		        //버튼에 나올 텍스트 설정
		        buttonText:"Cal",
		        //년도랑 월 설정하는 select 박스 표시 여부 설정
		        changeYear:true,
		        changeMonth:true,
		        //날짜 표시 형식설정
		        dateFormat:"yymmdd",
		        //달력에 요일 표시
		        dayNamesMin: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'], 
		        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		     });
		    $("input[name=input2]").attr("readonly",true);

		    
		 }else{
			    $('#datepicker').datepicker("destroy"); 
			    $("input[name=input2]").attr("readonly",false);
		 }
			
    	$("input[name=input2]").focus();
    	
    	
    });    	
    	
});

</script>
<script type="text/javascript">
function search1(){
	
	if($("input[name=input2]").val()==null||$("input[name=input2]").val()==""){
		
        alert("값을 입력하세요");
        $("input[name=input2]").focus();
        return false;

	}
		if($("select[name=select1]").val()=="Term"){
			if(isNaN($("input[name=input2]").val()) == true) {
				alert("문자는 입력할 수 없습니다. 숫자를 입력하세요");
				$("input[name=input2]").val("");
		        $("input[name=input2]").focus();
		        return false;
			} else {

			}
		}	
	
	location.href = "search1.do?select1="+$("select[name=select1]").val()
			+"&input2="+$("input[name=input2]").val()+"&withh=Y";
}

</script>
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

#container {
	width: 1200px;
	margin:0 auto;
	margin-top: 100px;
}

table {
	width: 1200px;
	
	text-align: center;
	/* 	바뀜 */
}

img{
	width: 130px;
	height: 130px;
	
}

</style>



<style type="text/css">
a {
	text-decoration: none;
}

/* 게이지 막대 컨테이너 */
figure {
	position: relative;
	width: 250px;
	margin: auto;
	height: 25px;
	border-radius: 8px;
	background: #cecece;
	background: -moz-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #cecece),
		color-stop(100%, #ffffff));
	background: -webkit-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: -o-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: -ms-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: linear-gradient(to bottom, #cecece 0%, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cecece',
		endColorstr='#ffffff', GradientType=0);
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
/* 	바뀜 */
	
}
a:hover, a:visited, a:link{
      color:black;
      text-decoration:none;
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
figure div:nth-child(3) {
	position: relative;
	font-size: 15px;
	color: black;
	font-weight: bold;


}

#ifnull{
	text-align: center;
	font-size: large;
	font-weight: bold;
}
.redcol{
	color: red;
}

/* 바뀜 */

</style>

</head>
<body>
<jsp:useBean id="Cal" class="com.hk.toCheckFinal.utils.cal"/>
	 <jsp:useBean id="Util" class="com.hk.toCheckFinal.utils.Util"/>
	 
	<div id="container">
		<div style="text-align: center;">
			<select id="select1" name="select1">
              <option value="ID" >ID</option>
              <option value="Title">Title</option>
              <option value="Term" >Term</option>
              <option value="Start">StartDate</option>
        	</select>	
        	<input type="text" id="datepicker" name="input2" style="width: 200px;" autocomplete="off" />
        	<input type="button" value="search" class="btn btn-default btn-xs" onclick="search1()"/>
        	</div>
        	<br/><br/><br/>
		<table style=" align-content: center;">
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<col width="180px">

        	<br/>		

		
			<c:choose>
			<c:when test="${fn:length(list) eq 0 }">
       			<div id="ifnull">There are no completed listings.</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:set var="per" value="0.0"/>
					
					<c:choose>
					<c:when test="${dto.chkCount eq 0}">
						
					</c:when>
					<c:otherwise>
						<c:set var="per" value="${(dto.chkCount/dto.term)*100}"/>
						
					</c:otherwise>
					</c:choose>	
					<c:choose>
					<c:when test="${(status.count)%4 eq 1}">
						<tr><td>
							<div class="progress-fixed">
							<img alt="이미지" src="${dto.photo}" >
							<div>${dto.id}</div>
							<div>${Util.TodayYYMMDD2(dto.stDate).ToYear1}.${Util.TodayYYMMDD2(dto.stDate).ToMonth1}.${Util.TodayYYMMDD2(dto.stDate).ToDate1}(<span class="redcol">${dto.chkCount}</span>/${dto.term})</div>
					  		<figure>
					    		<div class="progress-fixed__bar${status.count}"></div>
					    		<div class="progress-fixed__percent${status.count}"></div>
						    		<div class="pertitle"><a href="habitCalWithDetailView.do?pKey=${dto.pKey}&id=${dto.id}">${dto.title}</a></div>	
					  		</figure>
							</div>
							<input class="bar" type="hidden"  onclick="BG.init(${per},${status.count})"/>
							<br/>
							<br/>
							</td>
					</c:when>
					<c:when test="${(status.count)%4 eq 2||(status.count)%4 eq 3}">
							<td>
							<div class="progress-fixed">
							<img alt="이미지" src="${dto.photo}" >
							<div>${dto.id}</div>
							<div>${Util.TodayYYMMDD2(dto.stDate).ToYear1}.${Util.TodayYYMMDD2(dto.stDate).ToMonth1}.${Util.TodayYYMMDD2(dto.stDate).ToDate1}(<span class="redcol">${dto.chkCount}</span>/${dto.term})</div>
					  		<figure>
					    		<div class="progress-fixed__bar${status.count}"></div>
					    		<div class="progress-fixed__percent${status.count}"></div>
						    		<div class="pertitle"><a href="habitCalWithDetailView.do?pKey=${dto.pKey}&id=${dto.id}">${dto.title}</a></div>	
					  		</figure>
							</div>
							<input class="bar" type="hidden"  onclick="BG.init(${per},${status.count})"/>	
							<br/>
							<br/>				
							</td>						
					</c:when>
					<c:when test="${(status.count)%4 eq 0}">
							<td>
							<div class="progress-fixed">
							<img alt="이미지" src="${dto.photo}" >
							<div>${dto.id}</div>
							<div>${Util.TodayYYMMDD2(dto.stDate).ToYear1}.${Util.TodayYYMMDD2(dto.stDate).ToMonth1}.${Util.TodayYYMMDD2(dto.stDate).ToDate1}(<span class="redcol">${dto.chkCount}</span>/${dto.term})</div>
						  		<figure>
						    		<div class="progress-fixed__bar${status.count}"></div>
						    		<div class="progress-fixed__percent${status.count}"></div>
						    		<div class="pertitle"><a href="habitCalWithDetailView.do?pKey=${dto.pKey}&id=${dto.id}">${dto.title}</a></div>	
						  		</figure>
							</div>
							<input class="bar" type="hidden"  onclick="BG.init(${per},${status.count})"/>	
							<br/>
							<br/>
							</td><tr>						
					</c:when>
					</c:choose>	
				</c:forEach>						
			</c:otherwise>
			</c:choose>

			<c:forEach var = "m" begin = "1" end = "${(4-(fn:length(list1))%4)%4}">
				<c:choose>
				<c:when test="${m eq  (4-(fn:length(list1))%4)%4}">
					<td>&nbsp;</td></tr>
				</c:when>
				<c:otherwise>
					<td>&nbsp;</td>
				</c:otherwise>				
				</c:choose>
			</c:forEach>	
		</table>
	</div>
</body>
<jsp:include page="foot.jsp"/>
</html>