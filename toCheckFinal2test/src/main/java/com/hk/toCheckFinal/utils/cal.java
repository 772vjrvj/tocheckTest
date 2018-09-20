package com.hk.toCheckFinal.utils;

import java.util.Calendar;

public class cal {

	//요일 월-0 화-1 이런식으로 숫자 구해서 보냄
    public static int dayOfWeek(int yyyy,int mm,int dd){
    	 	
		Calendar cal=Calendar.getInstance();
	
		cal.set(yyyy, mm-1, dd);
		int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
		
		return dayOfWeek;
    	
    }
    
    //해당일의 마지막날 구하기
    public static int lastDay(int yyyy,int mm,int dd){
    	
		Calendar cal=Calendar.getInstance();
	
		cal.set(yyyy, mm-1, dd);
		int lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		return lastDay;
    }
    
    
    
	
	
}
