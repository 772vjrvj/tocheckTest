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
	  body{
	  
     		padding: 25px 300px 25px 300px ;
	  		position: absolute; 
  	  		background: url("img/head_back.jpg") fixed center center;  
  	  		background-size: cover; 
    		width: 100%; 
    		height: 100%; 
    		z-index: -1;
    		top:0;
    		left:0;
	  }
   	   *{
	   	   font-family: 'Do Hyeon', serif;
   	   }
	
			/* 폰트,버튼 위치 */
		@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css); 
		
		/* 배경색, 폰트색 */
			
		/* thar 폰트변경 */
		h2 {
			color: #BDC3C7;
		  text-transform: uppercase;
		  letter-spacing: 1px;
		}
		
		/* 버튼 테두리 */
		#g.animated-button {
			color: black;
			cursor: pointer;
			display: block;
			position: relative;
			border: 2px solid #fd6c8b;
			transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
		}
		
		/* 마우스 올렸을때 글자 색 바뀌기..? */
		 #g.animated-button:hover { 
		 	color: #000 !important; 
		 	background-color: transparent; 
		 	text-shadow: ntwo; 
		 } 
		/* 무슨 설정인지는 잘 모르겠는데 이걸 설정 해줘야 밑에 효과가 적용이 되요!*/
		 #g.animated-button.thar-one:hover:before {
			bottom: 0%;
			top: auto;
			height: 100%;
		}
		 #g.animated-button:hover.thar-two:before { 
		 	top: 0%; 
			bottom: auto; 
		 	height: 100%; 
		 } 
		 #g.animated-button.thar-three:hover:before {
			left: 0%;
			right: auto;
			width: 100%;
		}
		
		#g.animated-button.thar-four:hover:before {
			right: 0%;
			left: auto;
			width: 100%;
		}
		 /*  마우스 올렸을때 버튼 색 효과 (하->상) */
		 #g.animated-button.thar-one:before {
			display: block;
			position: absolute;
			left: 0px;
			top: 0px;
			height: 0px;
			width: 100%;
			z-index: -1;
			content: '';
			color: #000 !important;
			background: #fd6c8b;
			transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
		}
		/*  마우스 올렸을때 버튼 색 효과 (상->하) */
		 #g.animated-button.thar-two:before { 
		 	display: block; 
		 	position: absolute; 
		 	left: 0px; 
		 	bottom: 0px; 
			height: 0px; 
			width: 100%; 
		 	z-index: -1; 
		 	content: ''; 
		 	color: #000 !important; 
		 	background: #fd6c8b; 
		 	transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s; 
		 } 
		 /*  마우스 올렸을때 버튼 색 효과 (좌->우) */
		 #g.animated-button.thar-three:before {
			display: block;
			position: absolute;
			top: 0px;
			right: 0px;
			height: 100%;
			width: 0px;
			z-index: -1;
			content: '';
			color: #000 !important;
			background: #fd6c8b;
			transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
		0s;
		}
		 /*  마우스 올렸을때 버튼 색 효과 (우->좌) */
		#g.animated-button.thar-four:before {
			display: block;
			position: absolute;
			top: 0px;
			left: 0px;
			height: 100%;
			width: 0px;
			z-index: -1;
			content: '';
			color: #000 !important;
			background: #fd6c8b;
			transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
		0s;
		}
</style>
</head>
<body>
<div class="navi">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-6"> <a id="g" href="main.do?id=${loginId}&role=${loginRole}" class="btn btn-sm animated-button thar-one">나의 목표</a> </div>
    <div class="col-md-3 col-sm-3 col-xs-6"> <a id="g" href="habitCalForm.do?id=${loginId}" class="btn btn-sm animated-button thar-two">시작하기</a> </div>
    <div class="col-md-3 col-sm-3 col-xs-6"> <a id="g" href="selectform.do?id=${loginId}&role=${HcLoginDto.role}" class="btn btn-sm animated-button thar-three">목록보기</a></div>
    <div class="col-md-3 col-sm-3 col-xs-6"> <a id="g" href="point.do?id=${loginId}" class="btn btn-sm animated-button thar-four">포인트사용</a> </div>
  </div>
</div>
</body>
</html>