<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardlist</title>
<jsp:include page="head.jsp"/>
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
	color: white;
	text-align: center;
	background-color: #5cb85c;
	height: 35px;
}

td {
	text-align: center;
	height: 35px;
}

tr:nth-child(2n) {
	background-color: #cdffcc;
}

h4 {
	text-align: center;
	color: #5cb85c;
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
	width: 800px;
	margin: auto;
}

table {
	margin: auto;
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
	background: #5cb85c;
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
</style>


<script type="text/javascript">





</script>
</head>
<body>


	<div id="container">
		<h4>회원 습관 공유 게시판</h4>
		<h5>▷.응원의 댓글을 남겨주세요</h5>
		<table id="calendartitle" border="1" style="border: 3px solid white;">
			<col width="100px">
			<col width="350px">
			<col width="280px">
			<col width="150px">
			<col width="80px">
			<tr>
				<th>아이디</th>
				<th>제목</th>
				<th>기간</th>
				<th>달성률</th>
				<th>등록일</th>
			</tr>
			<tbody id='searchbody'>
			<c:choose>
				<c:when test="${list eq null}">
				<tr>
					<td colspan="5">------회원들의 진행중인 습관리스트가 없습니다.-----</td>
				</tr>					
				</c:when>
			</c:choose>
			
				<%
		if(list==null||list.size()==0){
			%>
				<tr>
					<td colspan="5">------회원들의 진행중인 습관리스트가 없습니다.-----</td>
				</tr>
				<%
		}else{
				int count=0;
			for (int i = 0; i < list.size(); i++) {
				HcDto dto=list.get(i);
					if(dto.getCalWith().equals("N")){
						count++;
					}else{
							String []chkss=dto.getChks().split("/");
							int term = Integer.parseInt(dto.getTerm());
							double cl=(double)chkss.length;
							double per=0.0;
							if(dto.getChks().equals("0")){
								per=0;
							}else{
								per=(cl/term)*100;
							}
				%>
				<tr>
					<td><%=dto.getId()%></td>
					<td><a href="hccontroller.do?command=habitCalDetail&calString=c&myId=<%=hldto.getId()%>&pKey=<%=dto.getPKey()%>&id=<%=dto.getId()%>"><div
								style="text-align: left; font-weight: bolder; vertical-align: sub;"><%="  ▷. "%><%=dto.getTitle()%></div></a></td>
					<td>
						<div class="progress-fixed">
							<figure>
								<div class="progress-fixed__bar<%=i%>"></div>
								<div class="progress-fixed__percent<%=i%>"></div>
							</figure>
						</div> <input class="bar" type="hidden"
						onclick='BG.init(<%=per%>,<%=i%>)'>
					</td>
					<td><div style="color: red; display: inline;"><%=(int)cl%></div>/<%=dto.getTerm()%></td>
					<td><%=dto.getRegdate()%></td>
				</tr>
				<%	

					}
					if(count==list.size()){
						%>
				<tr>
					<td colspan="5">------회원들의 진행중인 습관리스트가 없습니다.-----</td>
				</tr>
				<%
 					}	 
		}
	}
	%>
			</tbody>
			<tr>
				<td colspan="5" style="text-align: right;"><button
						class="btn btn-success btn-xs"
						onclick="location.href='hccontroller.do?command=main&id=<%=hldto.getId()%>'">메인</button>&nbsp;&nbsp;</td>
			</tr>
		</table>





		<table id="calendartitle" border="1" style="border: 3px solid white;">
			<tr>
				<td><select id="choice" name="choice"
					style="text-align: center; height: 26px; font-size: 12px;">
						<option id="id">ID</option>
						<option id="title">제목</option>
				</select></td>
				<td><input type="text" id="searchContent" style="width: 200px;" />
					<input type="button" class="btn btn-success btn-xs" name="search"
					value="검색" onclick="search()" /> <input type="button"
					class="btn btn-success btn-xs" name="allSearch" value="전체글보기"
					onclick="allSearch()" /></td>
			</tr>
		</table>



	</div>
</body>


</html>