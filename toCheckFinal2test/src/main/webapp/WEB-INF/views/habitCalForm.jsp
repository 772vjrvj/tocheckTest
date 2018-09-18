<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>목표 시작하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>
<style type="text/css">
   table{
   	  border-top: 1px solid #c0c0c0;
      margin: auto;
   }
   th{
      border-bottom: 1px solid #c0c0c0;
      width:80px;
      height:35px;
      text-align: center;
      padding-top:5px;
      padding-bottom:5px;
   }
   td{
      border-bottom: 1px solid #c0c0c0;
      height: 32px;
      text-align: left;
      padding-top: 5px;
      padding-bottom: 5px;
   }
   h4{   
      text-align: center;
      font-weight: bold;
   }
   #container{
      width: 800px;
      margin: 0 auto 0 auto;
      margin-top: 60px;
   }
   h2{   
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
   }
   img{
     border: solid 1px #a9a9a9;
   }
</style>



<script type="text/javascript">

   $(document).ready(function() {

		$.ajax({
			url:"ajaxCheck.do",   //url:"employee_servlet.do?fname=", 원래는 이런식인데 date로 
			method:"get",
			data:"id=${loginId}",
			async:false,
			dataType:"json",
			success:function(obj){//obj{"lists":[EmpDto,EmpDto,EmpDto,EmpDto,...]}

				var count=obj["count"]//[EmpDto,EmpDto,EmpDto,EmpDto,...]
				if(count>=6){
					alert("습관갯수가 현재 꽉 찼습니다. 종료후 만들어주세요");
				    location.href = "main.do?id=${loginId}&role=${loginRole}"
				}

			},
			error:function(){
				alert("서버통신실패~~");
			}
		});		
	   
	   
      $("form").submit(function(){
         if($("select[name=month]").val()==0){
            alert("월을 입력하세요");
            $("select[name=month]").focus();
            return false;
            
         }else if($("select[name=date]").val()==0){
            alert("일을 입력하세요");
            $("select[name=date]").focus();
            return false;
            
         }else if($("select[name=term]").val()==0){
            $("select[name=term]").focus();
            alert("기간을 입력하세요");
            return false;
         }else if($("select[name=recruit]").val()==0){
            $("select[name=recruit]").focus();
            alert("인원을 입력하세요");
            return false;
         }else if($("img").attr("src")==""){
             alert("사진을 넣으세요");
             return false;
         }else if($("select[name=recruit]").val()==1){
        	 
  			if ($("select[name=date]").val() < ${map.date}) {
				alert("오늘 이전의 날은 입력할 수 없습니다.");
	            $("select[name=date]").focus();
	            return false;
			}else{
				
			}
			
        	 
         }else if($("select[name=recruit]").val()>=2){
			if ($("select[name=date]").val()<=${map.date}) {
				alert("2인 이상의 함께 하기는 현재날짜 다음날 부터 가능합니다.");
	            $("select[name=date]").focus();
	            return false;
			}else{
				
			}
         }
         
         

      });

      $("select[name=year]").change(function(){
         $("select[name=month]").val("0");
         $("select[name=date]").empty();
         $("select[name=date]").append('<option value="0">선택</option>');
         
         $("select[name=term]").empty();
         $("select[name=term]").append('<option value="0">선택</option>');

         $("select[name=month]").focus();
      });
      
      $("select[name=month]").change(function(){
         $("select[name=date]").focus();
         $("select[name=date]").empty();   
         
         $("select[name=term]").empty();
         $("select[name=term]").append('<option value="0">선택</option>');         
         
         if(($("select[name=month]").val())==0){
            $("select[name=date]").empty();
            $("select[name=date]").append('<option value="0">선택</option>');
            $("select[name=month]").focus();
         }else if(($("select[name=month]").val())==2){

            if(($("select[name=year]").val())%4==0&&($("select[name=year]").val())%100!=0||($("select[name=year]").val())%400==0){
               var op="";
               for(var i=0;i<=29;i++){
                  op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
               }
               $('select[name=date]').append(op);
               
            }else{
               
               var op="";         
               for(var i=0;i<=28;i++){
                  op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
               }
               $('select[name=date]').append(op);            
            }
         }else if(($("select[name=month]").val())==4||($("select[name=month]").val())==6||($("select[name=month]").val())==9||($("select[name=month]").val())==11){

            var op="";         
            for(var i=0;i<=30;i++){
               op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
            }
            
            $('select[name=date]').append(op);      
            
         }else{

            var op="";         
            for(var i=0;i<=31;i++){
               op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
            }
            
            $('select[name=date]').append(op);      
         }
      });
      
      
      $("select[name=date]").change(function(){
         $("select[name=term]").empty();
         $('#endDate').empty();                  
         if($("select[name=date]").val()==0){
            $("select[name=term]").append('<option value="0">선택</option>');
            $("select[name=date]").focus();         
         }else{
            $("select[name=term]").focus();
            var op="";         
            for(var i=0;i<=365;i++){
               op+="<option value="+i+">"+(i==0?'선택':i)+"</option>";
            }
            $('select[name=term]').append(op);      
         }
      });

      $(".contents").focus(function(){
            if($("select[name=month]").val()==0||$("select[name=date]").val()==0||$("select[name=term]").val()==0){
               if($("select[name=month]").val()==0){
                  alert("월을 입력하세요");
                  $("select[name=month]").focus();
               }else if($("select[name=date]").val()==0){
                  alert("일을 입력하세요");
                  $("select[name=date]").focus();
               }
            }
      });
      
      $("select[name=term]").change(function(){
         if($("select[name=term]").val()==0){
             $('#endDate').empty();
             $('#usePoint').empty();
         }else{            
            endInput($(this).val());
            pointInput($(this).val());
         }
      });
      
      
   });

//    function pointInput(termVal){
      
//       var usepoint=termVal*100;
      
//       $('#usePoint').text("※ "+usepoint+"포인트가 차감됩니다.");      
//    }

   function endInput(termVal){
      
      var year=$('select[name=year]').val();
      var month=$('select[name=month]').val();
      var date=$('select[name=date]').val();

                  
         var date1 = new Date(parseInt(year),parseInt(month)-1,parseInt(date)+parseInt(termVal)-1);
         var edDate2=date1.getFullYear()+"년 "+(date1.getMonth()+1)+"월 "+ date1.getDate()+"일 ";
             $('#endDate').text(edDate2);
      
   }
   
// icon 팝업창
   function icon()
      {
         var popUrl = "popup.do";   //팝업창에 출력될 페이지 URL
         var popOption = "width=600, height=600, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
         window.open(popUrl,"",popOption);
      }
      
      
      
      
      
</script>
<body>
<div id="container">
<h2 style="text-align: center;">나의 목표</h2>
<form action="habitCalInsert.do" method="post">
   <input type="hidden" name="id" value="${HcLoginDto.id}"/>
   <input type="hidden" name="photo" value=""/>
   <table>
      <col width="100px">
      <col width="400px">
      <col width="100px">
      <tr>
         <th>목표제목</th>
         <td><input class="contents" type="text" name="title" style="width: 400px;" required="required" autocomplete="off"/></td> 
         <th>인원
         <select name="recruit">
               <c:forEach var = "i" begin = "0" end = "100">
                  <option value="${i}" >${i eq 0 ? "선택":i}</option>
         </c:forEach>
         </select></th>
      </tr>
      
      <tr>
         <th>모션선택</th>
         <td colspan="2">
            <button type="button" id ="button" onclick="icon()">선택</button>
            <img id="image" src="img/white.png" width="200px" height="200px "/>
         </td>
      </tr> 
                 
      <tr>
         <th>시작일</th>
         <td colspan="2">
            <select name="year">
               <c:forEach var = "i" begin = "${map.year}" end = "${map.year+5}">
                  <option value="${i}" ${map.year eq i ? "selected":""} >${i}</option>
               </c:forEach>
            </select>년
            <select name="month">
               <c:forEach var = "i" begin = "0" end = "12">
                  <option value="${i}" ${map.month eq i ? "selected":""} >${i eq 0 ? "선택":i}</option>
               </c:forEach>
            </select>월
            <select name="date">
               <c:forEach var = "i" begin = "0" end = "${map.lastDay}">
                  <option value="${i}" ${map.date eq i ? "selected":""} >${i eq 0 ? "선택":i}</option>
               </c:forEach>
            </select>일  
         </td>
      </tr>
      
      <tr>
         <th>기간</th>
         <td colspan="2">
            <select name="term">
               <c:forEach var = "i" begin = "0" end = "365">
                  <option value="${i}" >${i eq 0 ? "선택":i}</option>
               </c:forEach>
            </select>일 &nbsp;&nbsp;
            <span style="text-align: right; color: red;" id="usePoint"></span>
         </td>
      </tr>
      
      <tr>
         <th>종료일</th>
         <td colspan="2" id="endDate"></td>
      </tr>
<!--       <tr> -->
<!--          <th>사용포인트</th> -->
<!--          <td colspan="2" id="usePoint"></td> -->
<!--       </tr> -->
      <tr>
         <th>계획</th>
         <td colspan="2"><textarea class="contents"  rows="5" cols="60" name="content" required="required" autocomplete="off" ></textarea></td>
      </tr>
      
      <tr>
         <td colspan="3" style="text-align: right;">
            <input class="btn btn-default btn-xs" type="submit"  value="체크리스트 만들기"/>
            <input class="btn btn-default btn-xs" type="button"  value="취소"
            onclick="location.href='main.do?id=${HcLoginDto.id}&role=${HcLoginDto.role}'"/>
            <input class="btn btn-default btn-xs" id="endInput1" type="hidden" onclick="endInput()">
         </td>
      </tr>
   </table>
</form>
</div>
</body>
<jsp:include page="foot.jsp"/>
</html>