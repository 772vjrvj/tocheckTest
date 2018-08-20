package com.hk.toCheckFinal.utils;

import java.util.Calendar;

public class cal {


    public static int calGet1(int yyyy,int mm,int dd){
    	 	
		Calendar cal=Calendar.getInstance();
	
		cal.set(yyyy, mm-1, dd);
		int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
		
		return dayOfWeek;
    	
    }

    public static int calGet2(int yyyy,int mm,int dd){
    	
		Calendar cal=Calendar.getInstance();
	
		cal.set(yyyy, mm-1, dd);
		int lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		return lastDay;
    }
    
    
    
	
	
}
