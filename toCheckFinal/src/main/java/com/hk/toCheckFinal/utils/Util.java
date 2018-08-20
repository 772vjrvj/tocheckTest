package com.hk.toCheckFinal.utils;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Util {
	
	
	public static String isTwo(String msg) {
		
		return msg.length()<2?"0"+msg:msg;
	}
	
	
	
	public static String substring(int i) {
		
		return (i+"").substring(0,4);
	}	
	
	
	
	
	
	public static String getPKey(String id) {
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
		String strDT = dayTime.format(new Date(time)); 
		return strDT+id;
	}

	
	
	public static String edDate(String year,String month,String day, String term) {

	    int year1 = Integer.parseInt(year);
	    int month1 = Integer.parseInt(month);
	    int day1 = Integer.parseInt(day);
	    int term1 = Integer.parseInt(term);


	    Calendar cal = Calendar.getInstance();

		cal.set(year1, month1-1, day1);

		cal.add(Calendar.DATE, term1-1);

		SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String edDate =SimpleDateFormat.format(cal.getTime());
		System.out.println(edDate);

		return edDate;
	}
	

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
	
	
	public static String checked(String[] chkss, String i, String j, String n) {
		String m=i+j+n;
		System.out.println(m);
		String chechked="";
	
		for(int p=0;p<chkss.length;p++){
			if(m.equals(chkss[p])){
				chechked="checked";
			}
		}
		System.out.println(chechked);
		
		return chechked;
	}
	
	public static String today(String i, String j, String n) {
		String m=i+j+n;

		
		String disabled;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());


		
		if(m.equals(strToday)) {
			disabled="";
			return disabled+" "+"style=\"background-color: pink\"" ;
		}else {
//		    int m1 = Integer.parseInt(m);
//		    int strToday1 = Integer.parseInt(strToday);
//		    if(strToday1<m1) {
//		    
//			disabled="disabled";
//			return disabled;
//		    }
			disabled="onclick='return(false)'";
			return disabled;			
			
		}
		
	}	
	
	
	
	public static boolean trtd(int i,int n) {
		
		if((i-1+n)%7==0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public static int blank(int i,int n) {
		

		int blank=(7-((i-1+n)%7))%7-1;
		return blank;
		
	}	
	
	
	
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
