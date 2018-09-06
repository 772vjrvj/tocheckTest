<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gothic+A1|Nanum+Gothic|Song+Myung" rel="stylesheet">
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
			font-size: 30px;
		}
		.myinfo{
			position: absolute;
			right:30px;
			top: 10px;
		}
</style>
<script type="text/javascript">
$(document).ready(function() {
	  $('body').addClass('js');
	  var $menu = $('#menu'),
	    $menulink = $('.menu-link');
	  
	$menulink.click(function() {
	  $menulink.toggleClass('active');
	  $menu.toggleClass('active');
	  return false;
	});});
</script>
</head>
<body>
  <div id="navi" class="pattern">
		<nav id="menu" role="navigation">
			<ul>
				<li><a href="main.do?id=${loginId}&role=${loginRole}">Home</a></li>
				<li><a href="habitCalForm.do?id=${loginId}">Start</a></li>
				<li><a href="selectform.do?id=${loginId}&role=${HcLoginDto.role}">List</a></li>
				<li><a href="point.do?id=${loginId}">Point</a></li>
			</ul>
		</nav>
		<div class="myinfo">
		<button type="button" class="btn btn-default btn-xs" onclick="location.href='userinfo.do?id=${loginId}'">나의 정보 보기</button>
   		<span>&nbsp;</span><button type="button" class="btn btn-default btn-xs" onclick="location.href='logout.do'">로그아웃</button>
   		</div>
	</div>
</body>
</html>