package com.hk.toCheckFinal.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hk.toCheckFinal.dtos.HcDto;

public class Util {

	static SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
	static Date currentTime = new Date ();
	static String today1 = SimpleDateFormat.format(currentTime);
	static int today=Integer.parseInt(today1);	
	
	
	
	
	//넘어온 문자열의 길이가 2개 보다 작으면 0을 붙이고 그렇지 않으면 그대로 ex) 2->02가 되고 12->12그대로  
	public static String isTwo(String msg) {
		return msg.length()<2?"0"+msg:msg;
	}
	
	//종료일 구하기 연,월,일,기간을 받음
	public static String edDate(String year,String month,String day, String term) {
		
		int year1 = Integer.parseInt(year);
		int month1 = Integer.parseInt(month);
		int day1 = Integer.parseInt(day);
		int term1 = Integer.parseInt(term);
		
		Calendar cal = Calendar.getInstance();
		cal.set(year1, month1-1, day1);
		cal.add(Calendar.DATE, term1-1);
		
		String edDate =SimpleDateFormat.format(cal.getTime());
		
		return edDate;
	}

	//pKey만들기 = 연월일분초+아이디
	public static String getPKey(String id) {
		
		long time = System.currentTimeMillis(); 
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
		String yyyyMMddHHmmss = dayTime.format(new Date(time)); 
		
		return yyyyMMddHHmmss+id;
	}
	

	//시작일과 오늘날짜 차이 구하기
	public static long doDiffOfDate(String start) throws ParseException{
	    String start1 = start;
	    System.out.println("diffDays:1");
	    
		SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		Date currentTime = new Date ();
		String today1 = SimpleDateFormat.format(currentTime);
	    System.out.println("diffDays:2");
	     
	    Date start2 = SimpleDateFormat.parse(start1);
	    Date today2 = SimpleDateFormat.parse(today1);
	         
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	    long diff = today2.getTime() - start2.getTime();
	    long diffDays = diff / (24 * 60 * 60 * 1000);
	    
	    System.out.println("diffDays:"+diffDays);
	    return diffDays;

	}	
	

	//시작일과 오늘날짜 차이 구하기
	public static long doDiffOfDate2(String start,String thisDate) throws ParseException{
		int start1=Integer.parseInt(start);	
		int thisDate1=Integer.parseInt(thisDate);	

	    
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	    long diff = thisDate1 - start1;
	    
	    System.out.println("doDiffOfDate2diffDays:"+diff);
	    return diff;

	}		
	
	
	
	
	public static int substring6 (String substring6){
	            
		String substring61=substring6.substring(6);
		int substring62=Integer.parseInt(substring61);      

	
		return substring62;
	}		
	
	
	//시작일 종료일 YYYY,MM,DD 식으로 각각구하기 그리고 기간도 구하기
	public static Map<String, Integer> DetailYYMMDD (HcDto dto){
	Map<String, Integer> map = new HashMap<String, Integer>();
	
		//시작년,월,일
		String sYear=dto.getStDate().substring(0,4);
		int stYear=Integer.parseInt(sYear);       
		String sMonth=dto.getStDate().substring(4,6);
		int stMonth=Integer.parseInt(sMonth);               
		String sDate=dto.getStDate().substring(6);
		int stDate=Integer.parseInt(sDate);      
	          
		map.put("stYear", stYear);   
		map.put("stMonth", stMonth);   
		map.put("stDate", stDate); 

		//종료년,월,일
		String eYear=dto.getEdDate().substring(0,4);
		int edYear=Integer.parseInt(eYear);        
		String eMonth=dto.getEdDate().substring(4,6);
		int edMonth=Integer.parseInt(eMonth);        
		String eDate=dto.getEdDate().substring(6);
		int edDate=Integer.parseInt(eDate);
	          
		map.put("edYear", edYear);   
		map.put("edMonth", edMonth);   
		map.put("edDate", edDate);   
		map.put("today", today); 
		//기간
		int term=Integer.parseInt(dto.getTerm());
		map.put("term", term);   
	
		return map;
	}		
	
	
	//오늘날짜 YYYY,MM,DD 식으로 각각구하기 그리고 기간도 구하기
	public static Map<String, Integer> TodayYYMMDD (){
	Map<String, Integer> map = new HashMap<String, Integer>();
	

		String ToYear=today1.substring(0,4);
		int ToYear1=Integer.parseInt(ToYear);       
		String ToMonth=today1.substring(4,6);
		int ToMonth1=Integer.parseInt(ToMonth);               
		String ToDate=today1.substring(6);
		int ToDate1=Integer.parseInt(ToDate);      
	          
		map.put("ToYear1", ToYear1);   
		map.put("ToMonth1", ToMonth1);   
		map.put("ToDate1", ToDate1); 
		map.put("today", today); 
		System.out.println("today:"+today);
		
		return map;
	}		
	
	
	//YYYY,MM,DD 식으로 각각구하기 
	public static Map<String, Integer> TodayYYMMDD2 (String thisDate){
	Map<String, Integer> map = new HashMap<String, Integer>();
	

		String ToYear=thisDate.substring(0,4);
		int ToYear1=Integer.parseInt(ToYear);       
		String ToMonth=thisDate.substring(4,6);
		int ToMonth1=Integer.parseInt(ToMonth);               
		String ToDate=thisDate.substring(6);
		int ToDate1=Integer.parseInt(ToDate);      
	          
		map.put("ToYear1", ToYear1);   
		map.put("ToMonth1", ToMonth1);   
		map.put("ToDate1", ToDate1); 
		
		return map;
	}			
	
	
	
	//tr을 줄기td를 줄자를 결정
	public static boolean trtd(int i,int n) {
		
		if((i-1+n)%7==0) {
			return true;
		}else {
			return false;
		}
		
	}	

	//토요일 파랑 일요일 빨강 그외에 검은색 달력날짜 색깔
	public static String fontColor(int dayOfWeek, int i) {
		String color="";
		
		if((dayOfWeek-1+i)%7==0) {
			color="blue";
		}else if((dayOfWeek-1+i)%7==1) {
			color="red";
		}else{
			color="black";
		}
		return color;
	}	

	//연도 4글로 ex 1995 yyyy식으로 문자열 자르기
	public static String substring(int i) {
		
		return (i+"").substring(0,4);
	}	
	
	//달력 마지막 뒤에 빈칸들 
	public static int blank(int i,int n) {
		
		int blank=(7-((i-1+n)%7))%7;
		return blank;
	}	
	
	
	//체크박스에 체크하기
	public static String checked(List<String> chkList, String i, String j, String n) {
		String m=i+j+n;
		String chechked="";
	
		for(int p=0;p<chkList.size();p++){
			if(m.equals(chkList.get(p))){
				chechked="checked";
			}
		}
		
		return chechked;
	}
		

	//체크박스 활성화 비활성화 여부
	public static String today(String i, String j, String n) {
		String m=i+j+n;

		String disabled;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());

		if(m.equals(strToday)) {
			return "style=\"background-color: #e0e0e0\"" ;
		}else {
			disabled="onclick='return(false)'";
			return disabled;			
		}
		
	}	

	//공개 비공개
	public static String together(String together) {
		System.out.println(together);
		String toge="";
		
		if(together.toUpperCase().equals("Y")) {
			
			toge="onclick='return(false)'";
			return toge;
		}else {
			return toge;
		}
		
	}
	

	
	
}
