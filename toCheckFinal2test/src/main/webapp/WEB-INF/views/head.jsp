<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet"><title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

		a:hover, a:visited, a:link{
	      color: black;
	      text-decoration: none;
	   }
	   
		a.menu-link {
  	    float: right;
		    display: block;
		    padding: 1em;
		}
		nav[role=navigation] {
			clear: both;
			-webkit-transition: all 0.3s ease-out;  
			-moz-transition: all 0.3s ease-out;
			-ms-transition: all 0.3s ease-out;
			-o-transition: all 0.3s ease-out;
			transition: all 0.3s ease-out;
		}
		.js nav[role=navigation] {
			overflow: hidden;
			max-height: 0;
		}
		nav[role=navigation].active {
			max-height: 15em;
		}
		nav[role=navigation] ul {
			margin: 0;
			padding: 0;
			border-top: 1px solid #808080;
		}
		nav[role=navigation] li a {
			display: block;
			padding: 0.8em;
			border-bottom: 1px solid #808080;
		}
		
		@media screen and (min-width: 48.25em) {
			a.menu-link {
			   display: none;
			}
			.js nav[role=navigation] {
				max-height: none;
			}
			nav[role=navigation] ul {
				margin: 0 0 0 -0.25em;
				border: 0;
			}
			
			nav[role=navigation]  li {
				display: inline-block;
				margin: 0 0.25em;
			}
			nav[role=navigation] li a {
				border: 0;
			}
		}
		#navi{
			text-align: center;
		}
		li{
			font-size: 28px;
		}
		#navi{
			width:1000px;
			font-family: 'Playfair Display', serif;
			text-align: center;
			margin: 0 auto;
		}
		#mypage{
			position: absolute;
			right:430px;
			top:100px;
		}
		#logout{
			position: absolute;
			right:340px;
			top:100px;
		}
</style>
<script type="text/javascript">
$(document).ready(function() {
	  $('body').addClass('js');
	  var $menu = $('#menu'),
	    $menulink = $('.menu-link');
	  
	  $("#logout").trigger("click");
	  
	$menulink.click(function() {
	  $menulink.toggleClass('active');
	  $menu.toggleClass('active');
	  return false;
	});});


function search(){
	alert("서버통신실패~~");
}

</script>
</head>
<body>
	<c:choose>
		<c:when test="${loginId eq '0'}">
		   <%pageContext.forward("logout.jsp"); %>
		</c:when>
		<c:otherwise>		
			<div id="navi" class="pattern">
				<nav id="menu" role="navigation">
					<ul>
						<li><a href="main.do?id=${loginId}&role=${loginRole}">Home </a></li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li><a href="habitCalForm.do?id=${loginId}" onclick="search()"> Start </a></li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li><a href="selectform.do"> List </a></li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li><a href="totalPer.do?id=${loginId}"> Progress </a></li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li><a href="boardlistWithRanking.do?id=${loginId}"> Ranking </a></li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</ul>
						<div id="mypage">
						<a href="userinfo.do?id=${loginId}"> Mypage &nbsp;|</a>
						<a href="logout.do">&nbsp; Logout </a>
						</div>
				</nav>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>