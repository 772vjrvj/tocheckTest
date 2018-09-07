<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세보기</title>
<jsp:include page="style.jsp"/>
<jsp:include page="head.jsp"/>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

$(function(){
   if($("#switchCheck").attr("checked")=="checked")   {
      $("#switchText").css('color','black').text("공개");         
   }else{
      $("#switchText").css('color','red').text("비공개");         
   }
   
    $("#switchCheck").change(function(){
       if($("#switchCheck").is(":checked"))   {
          $("#switchText").css('color','black').text("공개");         
       }else{
          $("#switchText").css('color','red').text("비공개");         
       }

    });
    

    $("#intoper").click(function(){
        if($("#list").css("display") == "none"){
            $("#list").slideDown();
        }else{
            $("#list").slideUp();
        }
       });   

   
});

   
   function myFunction2(){
      location.href="promise.do?id=${loginId}&pKey=${dto.pKey}";
   }
</script>
<style type="text/css">

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 8px;
  right: 0;
  bottom: 0;
  left: 37px;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #fd6c8b;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
/* ========================================================================================= */
	img{
	top: 28%;
	left:32%;
	text-align: center;
	width:700px;
	height: 700px;
	opacity: 0.4;
	z-index: -5;
	position: absolute;
	}

   #calendar{
      border: 1px solid #fd6c8b;
      border-collapse: collapse;
   }
   #calendar th{
      width:80px;
      background-color: #fd6c8b;
      text-align: center;
      
   }
   
   #calendar td{
      width:100px;
      height:100px;
      text-align: left;
      vertical-align: top;
   }

   #list{
   width: 564px;
   display: none;
   text-align:left;
   }

   #container{
   width: 800px;
   margin: 0 auto 0 auto;
   }
   
   
   #calendartitle {
      border: 1px solid #fd6c8b;
      border-collapse: collapse;
      height: 90px;
      margin: auto;
      
   }
   
   table{
      margin: auto;
      border-collapse: collapse;
      border-radius: 30px;
   }
   
.switch {
  position: relative;
  display: inline-block;
  width: 33px;
  height: 20px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 13px;
  width: 13px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #fd6c8b;
}

input:focus + .slider {
  box-shadow: 0 0 1px #fd6c8b;
}

input:checked + .slider:before {
  -webkit-transform: translateX(13px);
  -ms-transform: translateX(13px);
  transform: translateX(13px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

</head>
<body>

<div id="container">
<form action="insertCheck.do" method="post">
<jsp:useBean id="together" class="com.hk.toCheckFinal.utils.Util"/>
   <input type="hidden" name="pKey" value="${pKey}"/>
   <input type="hidden" name="id" value="${id}"/>
   
   
   <table style="border-collapse: collapse; border: white">
      <col width="188px">
      <col width="188px">
      <col width="188px">
   <tr><th colspan="3" style="color:#245682; text-align: center; font-size: 20px;">${dto.title}</th></tr>
   <tr><td style="color: white">&nbsp;</td></tr>
   </table>   
   <table id="calendartitle" border="1" style="border: 3px solid #fd6c8b;">
      <col width="188px">
      <col width="188px">
      <col width="188px">
         <tr>
            <th style="background-color:#fd6c8b; color:white; text-align: center;">시작일</th>
            <th style="background-color:#fd6c8b; color:white; text-align: center;">종료일</th>
            <th style="background-color:#fd6c8b; color:white; text-align: center;">기간</th>
         </tr>
         <tr>
            <td style="color:#245682; text-align: center;">${map.stYear}년 ${map.stMonth}월 ${map.stDate}일</td>
            <td style="color:#245682; text-align: center;">${map.edYear}년 ${map.edMonth}월 ${map.edDate}일</td>
            <td style="color:red; text-align: center;">${map.term}</td>
         </tr>
         <tr>
            <td colspan="3" style="color:#245682; text-align: center;">${dto.content}</td>            
         </tr>
   </table>
   <img alt="이미지" src="${dto.photo}" >
   <table id="calendartitle" style="border-collapse: collapse; border: white; height: 30px;">
      <col width="188px">
      <col width="188px">
      <col width="188px">
         <tr>
            <td colspan="3" style="text-align: right;">
               <c:choose>
	              <c:when test="${dto.withh eq 'Y'}">
                 	 <c:choose>
		             		<c:when test="${today1 >= StDate1}">

		             		</c:when>
		             		<c:otherwise>	

		             		</c:otherwise>
	             		</c:choose>	              
	              </c:when>	
	              <c:otherwise>
		               <c:choose>             
		                  <c:when test="${paramview eq '0'}">
		                     <c:choose>
		                     	<c:when test="${dto.endList eq 'N'}">
		                     		<input type="submit" class="btn btn-default btn-xs" value="체크완료"/>
		                     	
		                     	</c:when>
		                     	<c:otherwise>
		                     	
		                     	
		                     	</c:otherwise>
		                     
		                     
		                     </c:choose>
		                     
		                     <input type="button" class="btn btn-default btn-xs" value="삭제" onclick="location.href='habitCalDelete.do?pKey=${pKey}&id=${id}'"/>
		                        <div style="height: 5px;">
		                        </div>   
		                     <label class="switch">
		                          <input type="checkbox" ${dto.calWith eq 'Y' ? 'checked':''} id="switchCheck" name="switchCheck"   ${together.together(dto.withh)}>
		                          <span class="slider round"></span>
		                     </label>
		                     <div style="font-size: 12px; vertical-align:text-top; color: #245682; font-weight: bolder; " id="switchText"></div>
		                     <br/>
		                  </c:when>
		                  <c:otherwise>

		                  </c:otherwise>
		               </c:choose>
	              </c:otherwise>
               </c:choose>
             
               
              

               <c:choose>
                  <c:when test="${dto.withh eq 'N'}">
                  
                  </c:when>
                  <c:otherwise>
                     <div style="font-size: 12px; vertical-align:text-top; color: #245682; font-weight: bolder; " id="withNumber">
	                   
                     	모집현황:<span style=" color: red;">${dto.intoper}</span>/${dto.recruit}</div>
                     <input class="btn btn-default btn-xs" type="button" id="intoper"  value="참가자" />
                     <c:choose>
                        <c:when test="${paramview eq 0}">
                           
                        </c:when>
                        <c:otherwise>
                        
                              <c:choose>
                                 <c:when test="${loginId eq dto.id}">
                                    
                                 </c:when>
                                 <c:otherwise>   
                                    <c:set var="sameValue" value="0"/>
                                    <c:forEach var="idlist" items="${idlist}" varStatus="status">
                                       <c:choose>
                                          <c:when test="${idlist eq loginId}">
                                             <c:set var="sameValue" value="1"/>
                                          </c:when>
                                          <c:otherwise>
                                          
                                          </c:otherwise>   
                                       </c:choose>
                                    </c:forEach>
                                    <c:choose>
	                                       <c:when test="${sameValue eq 0 && today1 < StDate1}">
	                                          <input type="button"  value="${dto.intoper eq dto.recruit ? '마감':'참여하기'}" 
	                                          ${dto.intoper eq dto.recruit ? 'disabled':''}
	                                          onclick=${dto.intoper eq dto.recruit ? "" : "'myFunction2()'"} />                                       
	                                       </c:when>
                                       <c:otherwise>
                                       	  <c:choose>
	                                      	  	<c:when test="${today1 >= StDate1}">
	                                      	  	
	                                      	  	</c:when>
	                                      	  	<c:otherwise>
		                                          <input type="button"  value="${dto.intoper eq dto.recruit ? '마감':'참가중'}" 
		                                          disabled/>  	
	                                      	  	</c:otherwise>
                                       	  </c:choose>
                                       </c:otherwise>
                                    </c:choose>            
                                 </c:otherwise>
                              </c:choose>
                     
                        </c:otherwise>
                     </c:choose>
                       <p id="list" >
						   <c:forEach var="idlist" items="${idlist}" varStatus="status">
						      <c:choose>
						         <c:when test="${status.index eq 0}">
						            <span style="color: red">▶</span>${idlist} &nbsp;
						         </c:when>
						         <c:otherwise>
						            <span style="color: blue">▶</span>${idlist} &nbsp;
						         </c:otherwise>         
						      </c:choose>
						   </c:forEach>
						</p>
                     
                  </c:otherwise>
               </c:choose>               
            </td>
         </tr>
   </table>
   <c:set var="i" value="0"/><c:set var="st" value="0"/><c:set var="ed" value="0"/>
      <c:forEach var = "i" begin = "${map.stYear}" end = "${map.edYear}">   
      
         <table style="border-collapse: collapse; border: white">
         <tr><td style="color: white">&nbsp;</td></tr>
         </table>   
         <table id="calendar" border="1">
         <tr><th style="color: white; text-align: center;">${i}년</th></tr>
         </table>            
         
         <c:choose>
             <c:when test="${map.stYear eq map.edYear}">
               <c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="${map.edMonth}"/>
             </c:when>
               <c:otherwise>
            <c:choose>
                <c:when test="${i eq map.stYear}">
                  <c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="12"/>
                </c:when>               
                <c:when test="${i gt map.stYear and i lt map.edYear}">
                  <c:set var="st" value="1"/><c:set var="ed" value="12"/>
                </c:when>               
                <c:when test="${map.stYear eq map.edYear}">
                  <c:set var="st" value="1"/><c:set var="ed" value="${map.edMonth}"/>
                </c:when>               

            </c:choose>
            </c:otherwise>
         </c:choose>

      <c:forEach var = "j" begin = "${st}" end = "${ed}">
         <table id="calendar" border="1" style="text-align: center;">
                     <caption style="font-weight:bolder; text-align: center; color:#245682;">${j}월</caption>
         <tr style="color: white;">
            <th >일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
         </tr>
         <tr>
         
         <jsp:useBean id="dayOfWeek" class="com.hk.toCheckFinal.utils.cal"/>
         <jsp:useBean id="lastDay" class="com.hk.toCheckFinal.utils.cal"/>
         <jsp:useBean id="Util" class="com.hk.toCheckFinal.utils.Util"/>
         
      <c:forEach var = "k" begin = "1" end = "${dayOfWeek.calGet1(i,j,1)-1}">
         <td>&nbsp;</td>
      </c:forEach>

      <c:forEach var = "n" begin = "1" end = "${lastDay.calGet2(i,j,1)}">
         <td>
            <c:choose>
                <c:when test="${(i==map.stYear&&j==map.stMonth&&n<map.stDate)||(i==map.edYear&&j==map.edMonth&&n>map.edDate)}">
	            	<p class="countview" style="color:${Util.fontColor(dayOfWeek.calGet1(i,j,1), n)};">${n}</p>
                   
                </c:when>
               <c:otherwise>
               		<c:choose>
               			<c:when test="${dto.withh eq 'N'}">
               				<p class="countview" style="color:${Util.fontColor(dayOfWeek.calGet1(i,j,1), n)};">${n}</p>
               			</c:when>
               			<c:otherwise>
	                   		<p class="countview" style="color:${Util.fontColor(dayOfWeek.calGet1(i,j,1), n)};"><input type="button" value="${n}" onclick="location.href='photoInChk.do?thisDate=${Util.substring(i)}${Util.isTwo(j+"")}${Util.isTwo(n+"")}&pKey=${dto.pKey}&id=${dto.id}&paramview=0'"></p>
	               		</c:otherwise>
	               	</c:choose> 
            		<c:choose>   
            			<c:when test="${paramview eq 1}">		
			                  <input  class="option-input checkbox" type="checkbox" name="chk" value='${Util.substring(i)}${Util.isTwo(j+"")}${Util.isTwo(n+"")}'
			                  ${Util.checked(chks, Util.substring(i),Util.isTwo(j+""),Util.isTwo(n+""))} onclick='return(false)'
			                  />
			                  
			                  </td>
	                  	</c:when>
	                  	<c:otherwise>
			                  <input  class="option-input checkbox" type="checkbox" name="chk" value='${Util.substring(i)}${Util.isTwo(j+"")}${Util.isTwo(n+"")}'
			                  ${Util.checked(chks, Util.substring(i),Util.isTwo(j+""),Util.isTwo(n+""))} 
			                  ${dto.withh eq 'Y'?  "onclick='return(false)'": Util.today(Util.substring(i),Util.isTwo(j+""),Util.isTwo(n+""))}
			                  />
			                  
			                  </td>	                  	
	                  	</c:otherwise>
	                 </c:choose>
                </c:otherwise>
                
            </c:choose>
            <c:choose>
               <c:when test="${Util.trtd(dayOfWeek.calGet1(i,j,1),n)}">
                  </td><tr>
               </c:when>
               <c:otherwise>
                  </td>
               </c:otherwise>
            </c:choose>
      </c:forEach>
      <c:forEach var = "m" begin = "0" end = "${Util.blank(dayOfWeek.calGet1(i,j,1),lastDay.calGet2(i,j,1))}">
      
         <td>&nbsp;</td>
      </c:forEach>
         </table>
      <br>         
      </c:forEach>
      </c:forEach>
</form>
</div>
</body>
</html>