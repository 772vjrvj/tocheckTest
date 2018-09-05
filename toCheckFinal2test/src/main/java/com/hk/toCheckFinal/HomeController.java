package com.hk.toCheckFinal;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;
import com.hk.toCheckFinal.dtos.HcWithDto;
import com.hk.toCheckFinal.service.IHcService;
import com.hk.toCheckFinal.utils.Util;


/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"loginId", "loginRole"})

@Controller
public class HomeController implements ServletContextAware {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   
   @Autowired
   private IHcService hcService;


	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext=servletContext;
	}            


   @RequestMapping(value = "/regist.do", method = RequestMethod.GET)
   public String regist(Locale locale) {
      logger.info("회원가입 {}.", locale);

      return "regist";
   }   
   
   
   @RequestMapping(value = "/regist_after.do", method = RequestMethod.POST)
   public String getAllBoard(HcLoginDto dto, Locale locale, Model model) {
      logger.info("회원가입 후{}.", locale);
      System.out.println(dto);
      
      boolean isS=hcService.insertUser(dto);
      
      if(isS) {
         model.addAttribute("id", dto.getId());               
         return "welcome";
      }else {
         model.addAttribute("msg","회원가입에 실패 했습니다.!");
         return "error";
      }
   }
   
   
   @RequestMapping(value = "/idchk.do", method = RequestMethod.GET)
   public String idchk(String id, Locale locale, Model model) {
      logger.info("중복체크 {}.", locale);


      String isS="n";
      String nycontent ="사용할 수 없는 아이디 입니다.";
      System.out.println(hcService.idChk(id));
      if(hcService.idChk(id)==null){
         isS="y";
         nycontent="사용할 수 있는 아이디 입니다.";
      }
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("isS", isS);   
      map.put("id", id);
      map.put("nycontent", nycontent);
      model.addAttribute("map", map);
      return "idchk";
   }      
   
   @RequestMapping(value = "/popup.do", method = RequestMethod.GET)
   public String popup(Locale locale,SessionStatus session) {
	   logger.info("팝업창 띄우기 {}", locale);
	   
	   return "popup";
   }      
   
   
   @RequestMapping(value = "/login_after.do", method = RequestMethod.POST)
   public String login_after(HcLoginDto dto, Locale locale, Model model,SessionStatus session) {
      logger.info("로그인 진행중 {}.", locale);
      System.out.println(dto);
      

      
      
      HcLoginDto HcLoginDto= hcService.getLogin(dto.getId(), dto.getPassword());
      
      
      
      
      if(HcLoginDto!=null){
    	  model.addAttribute("loginId", HcLoginDto.getId());
    	  model.addAttribute("loginRole", HcLoginDto.getRole());

         if(HcLoginDto.getEnabled().toLowerCase().equals("y")){
            
            return "redirect:main.do?id="+dto.getId()+"&role="+HcLoginDto.getRole();

         }else{
            model.addAttribute("msg","아이디와 패스워드를 확인하세요!탈퇴한 계정");
            return "error";
         }
               
      }else{
         model.addAttribute("msg","입력한 사용자 이름을 사용하는 계정을 찾을 수 없습니다. 사용자 이름을 확인하고 다시 시도하세요.");
         return "error";
      }
   }         
   
   
   
   
   @RequestMapping(value = "/main.do", method = RequestMethod.GET)
   public ModelAndView main(String id, String role, Locale locale,SessionStatus session) {
      logger.info("메인페이지 확인 {}.", locale);   
      System.out.println(id);
      System.out.println(role);
      ModelAndView view = new ModelAndView();
      System.out.println(session.isComplete());

         
         HcLoginDto HcLoginDto= hcService.getUser(id);
         
         if(role.toUpperCase().equals("ADMIN")) {
            view.setViewName("home");
            view.addObject("id",id);
            return view;
         }else {
            
            List<HcDto> list=hcService.getAllList(id);

            double count=0;
            int xsize=0;
            double sum=0;
         
            HcWithDto HcWithDto=hcService.getCalWith(id);
            String []withGoalList=null;
            
            if(HcWithDto==null) {
            	
            }else {
            	
            	withGoalList=HcWithDto.getWithGoalList().split("/");
            	
            	for (int i = 0; i < withGoalList.length; i++) {
            		list.add(hcService.getHabitCalList(withGoalList[i]));
            	}
            }
            
            
            
            for (int k = 0; k < list.size(); k++) {
               if(list.get(k).getEndList().toUpperCase().equals("N")) {
               int term = Integer.parseInt(list.get(k).getTerm());
               System.out.println("term:"+term);
               System.out.println("list.get(k).getChkss():"+list.get(k).getChkss());
               System.out.println("(list.get(k).getChkss()/term)*100:"+(list.get(k).getChkss()/term)*100);
               count +=(list.get(k).getChkss()/(double)term)*100;
               System.out.println("count:"+count);
               ++xsize;
               }
               
            }
            

            
            if(xsize==0) {
               sum=0.0;
            }else {
               
               sum=count/xsize;               
            }

            view.setViewName("usermain");
            view.addObject("sum",sum);
            view.addObject("list",list);

            view.addObject("HcLoginDto",HcLoginDto);
            return view;
            
         }

   }   


   @RequestMapping(value = "/userinfo.do", method = RequestMethod.GET)
   public String userinfo(String id, Locale locale, Model model) {
      logger.info("유저정보 {}.", locale);
      System.out.println(id);
      HcLoginDto HcLoginDto= hcService.getUser(id);

      model.addAttribute("HcLoginDto", HcLoginDto);
      return "userinfo";
   }         
   
   
   @RequestMapping(value = "/updateform.do", method = RequestMethod.GET)
   public String updateform(String id, Locale locale, Model model) {
      logger.info("유저정보 {}.", locale);

      HcLoginDto HcLoginDto= hcService.getUser(id);

      model.addAttribute("HcLoginDto", HcLoginDto);
      return "updateform";
   }            

   @RequestMapping(value = "/updateform_after.do", method = RequestMethod.POST)
   public String updateform_after(HcLoginDto HcLoginDto, Locale locale) {
      logger.info("유저정보 {}.", locale);

      String id=HcLoginDto.getId();
      
      boolean isS= hcService.updateUser(HcLoginDto);
      System.out.println(isS);
      
      if(isS){
      System.out.println(id);
         return "redirect:userinfo.do?id="+id;
      }else{
         
         return "redirect:updateform.do?id="+id;
      }
   }               
   
   @RequestMapping(value = "/deluser.do", method = RequestMethod.GET)
   public String deluser(String id, Locale locale) {
      logger.info("유저정보 {}.", locale);
      System.out.println(id);
      
      boolean isS= hcService.deleUser(id);
      System.out.println(isS);
      
      if(isS){
      System.out.println(id);
         return "redirect:index.jsp";
      }else{
         
         return "redirect:userinfo.do?id="+id;
      }
   }         
   

   @RequestMapping(value = "/habitCalForm.do", method = RequestMethod.GET)
   public ModelAndView habitCalForm(String id, Locale locale) {
      logger.info("습관 만들기 {}.", locale);
      
      HcLoginDto HcLoginDto= hcService.getUser(id);
      
      
      ModelAndView view = new ModelAndView();
      
      
      Map<String, Integer> map = new HashMap<String, Integer>();

      Calendar cal=Calendar.getInstance();
      int year=cal.get(Calendar.YEAR);
      int month=cal.get(Calendar.MONTH)+1;
      int date=cal.get(Calendar.DATE);
      int lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);

      map.put("year", year);   
      map.put("month", month);
      map.put("date", date);
      map.put("lastDay", lastDay);
      
      view.setViewName("habitCalForm");
      view.addObject("map",map);
      view.addObject("HcLoginDto",HcLoginDto);
      return view;
      
   }         
      
   @RequestMapping(value = "/point.do", method = RequestMethod.GET)
   public String point(String id, Locale locale, Model model) {
      logger.info("포인트 {}.", locale);

      HcLoginDto HcLoginDto= hcService.getUser(id);

      model.addAttribute("HcLoginDto", HcLoginDto);
      return "point";
   }   
   
   
   @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
   public String point(Locale locale, Model model, SessionStatus session) {
      logger.info("로그아웃 {}.", locale);
      session.setComplete();
      
      return "logout";
   }      
   
   
   
      @RequestMapping(value = "/selectform.do", method = RequestMethod.GET)
      public String selectform(String id, String role, Locale locale, Model model) {
         logger.info("함께 혼자 목록 {}.", locale);
      
         model.addAttribute("id", id);
         model.addAttribute("role", role);
         
         return "selectform";
      }         
   
      @RequestMapping(value = "/habitCalInsert.do", method = RequestMethod.POST)
      public String habitCalInsert(String year, String month, String date, HcDto HcDto, Locale locale, Model model) {
         logger.info("유저정보 {}.", locale);

         String stDate = year+Util.isTwo(month)
                      +Util.isTwo(date);
         String edDate = Util.edDate(year,month,date,HcDto.getTerm());
         
         
         String pKey = Util.getPKey(HcDto.getId());
         System.out.println(pKey);
         
         
         HcDto.setStDate(stDate);
         HcDto.setEdDate(edDate);
         HcDto.setIdlist(HcDto.getId());
         HcDto.setpKey(pKey);
         
         int term = Integer.parseInt(HcDto.getTerm());

         
         if(HcDto.getRecruit()==1) {
            HcDto.setWithh("N");
            HcDto.setCalWith("N");
         }else {
            HcDto.setWithh("Y");
            HcDto.setCalWith("Y");
         }
         
         System.out.println(HcDto);
         System.out.println("wwwwww");
         
         boolean isS = hcService.habitCalInsert(HcDto);
         
         
         
         if(isS) {
            
        	 
        	 if(HcDto.getWithh().equals("N")) {
        		 
        	 }else {
        		 
        		 for (int i = 0; i < term; i++) {
        			 
        			 
        			 int year1 = Integer.parseInt(year);
        			 int month1 = Integer.parseInt(month);
        			 int day1 = Integer.parseInt(date);
        			 
        			 
        			 Calendar cal = Calendar.getInstance();
        			 
        			 cal.set(year1, month1-1, day1);
        			 
        			 cal.add(Calendar.DATE, i);
        			 
        			 SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        			 String inChkDate =SimpleDateFormat.format(cal.getTime());
        			 
        			 System.out.println("inChkDate:"+inChkDate);
        			 boolean isS1 = hcService.insertHcInChk(new HcInChkDto(pKey, HcDto.getId(),HcDto.getTitle(), inChkDate));
        			 
        			 
        			 if(isS1) {
        				 
        			 }else {
        				 model.addAttribute("msg","실패 했습니다.!");
        				 return "error";
        			 }
        		 }
        		 
        	 }
        	 
            
            
            String paramview="0";
            return "redirect:habitCalDetail.do?id="+HcDto.getId()+"&pKey="+HcDto.getpKey()+"&paramview="+paramview+"&calString=b";
         }else {
            model.addAttribute("msg","실패 했습니다.!");
            return "error";
         }
         
      }               
      
      @RequestMapping(value = "/habitCalDetail.do", method = RequestMethod.GET)
      public ModelAndView habitCalDetail(String calString,String id, String pKey, String paramview, Locale locale) throws ParseException {
         logger.info("상세보기 {}.", locale);
         System.err.println(calString);
         ModelAndView view = new ModelAndView();
         Map<String, Integer> map = new HashMap<String, Integer>();
         System.out.println("pKey:"+pKey);
         System.out.println("pKey:"+pKey);

         HcDto dto = hcService.getHabitCalList(pKey);
         
         HcLoginDto HcLoginDto= hcService.getUser(id);
         System.out.println(dto);
         
         
         
         
         SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
         Date currentTime = new Date ();
         String today = SimpleDateFormat.format(currentTime);
         int today1 = Integer.parseInt(today);
         int StDate1 = Integer.parseInt(dto.getStDate());
         
         //시작일
         String sYear=dto.getStDate().substring(0,4);
         int stYear=Integer.parseInt(sYear);       
         String sMonth=dto.getStDate().substring(4,6);
         int stMonth=Integer.parseInt(sMonth);               
         String sDate=dto.getStDate().substring(6);
         int stDate=Integer.parseInt(sDate);      

         //종료일
         String eYear=dto.getEdDate().substring(0,4);
         int edYear=Integer.parseInt(eYear);        
         String eMonth=dto.getEdDate().substring(4,6);
         int edMonth=Integer.parseInt(eMonth);        
         String eDate=dto.getEdDate().substring(6);
         int edDate=Integer.parseInt(eDate);                    
         int term=Integer.parseInt(dto.getTerm());

               
         
         String []chks=dto.getChks().split("/");
         String []idlist=dto.getIdlist().split("/");
         
         map.put("stYear", stYear);   
         map.put("stMonth", stMonth);   
         map.put("stDate", stDate);   
         map.put("edYear", edYear);   
         map.put("edMonth", edMonth);   
         map.put("edDate", edDate);   
         map.put("term", term);   
         System.out.println(dto.getWithh());
         
         String thisDate = today;
         
         if(today1 >= StDate1 && dto.getWithh().equals("Y") && calString.equals("a")) {
        	 
        	 long diffdays=Util.doDiffOfDate(StDate1+"",today1+"")+1;
        	 
             String Year1=today.substring(0,4);
             String Month1=today.substring(4,6);
             String Date1=today.substring(6);

        	 view.setViewName("photoInChk");
        	 List<HcInChkDto> list = hcService.getHcInChk(new HcInChkDto(pKey, today1+""));
        	 view.addObject("list",list);
        	 view.addObject("dto",dto);
        	 view.addObject("HcLoginDto",HcLoginDto);   
        	 view.addObject("paramview",paramview);
        	 System.out.println(paramview);
        	 
        	 view.addObject("Year1",Year1);
        	 view.addObject("diffdays",diffdays);
        	 view.addObject("today",today);
        	 view.addObject("thisDate",thisDate);
        	 view.addObject("Month1",Month1);
        	 view.addObject("Date1",Date1);
	      	 
        	 
        	 return view;
         }else{
        	 
        	 view.addObject("today1",today1);        	 
        	 view.addObject("StDate1",StDate1);
        	 view.setViewName("habitCalDetail");
        	 view.addObject("id",id);
        	 view.addObject("pKey",pKey);
        	 view.addObject("paramview",paramview);
        	 
        	 view.addObject("chks",chks);      
        	 view.addObject("idlist",idlist);               
        	 view.addObject("dto",dto);   
        	 view.addObject("HcLoginDto",HcLoginDto);   
        	 view.addObject("map",map);
        	 
        	 return view;         
         }        

      }
         

      

      
      
      
      @RequestMapping(value = "/habitCalDelete.do", method = RequestMethod.GET)
      public String habitCalDelete(String pKey, String id, Locale locale, Model model) {
         logger.info("삭제 하기 {}.", locale);
      
         HcDto dto = hcService.getHabitCalList(pKey);
         HcLoginDto HcLoginDto= hcService.getUser(id);
         String nory=dto.getEndList();
         boolean isS  = hcService.habitCalDelete(pKey);
         
         
         
         if(dto.getWithh().equals("Y")){
        	 boolean isS1  = hcService.deleteHcInChk(pKey);   
        	 if(isS1==true) {
        		 System.out.println("deleteHcInChk삭제 성공");
        	 }else {
        		 model.addAttribute("msg","삭제에 실패 했습니다.");
                 return "error";
        	 }
        	 
         }
         
         if(isS == true){

            if(nory.equals("N")){
               return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();
            }else{
               return "redirect:habitCalCompleteList.do?id="+HcLoginDto.getId();
            }
         }else{
            model.addAttribute("msg","삭제에 실패 했습니다.");
            return "error";
         }
         
      }         
      
            
      
      
      @RequestMapping(value = "/insertCheck.do", method = RequestMethod.POST)
      public String insertCheck(String pKey, String id, String[] chk, String switchCheck, Locale locale, Model model) {
         logger.info("체크 하기 {}.", locale);
      
         System.out.println("switchCheck:"+switchCheck);
         HcLoginDto HcLoginDto= hcService.getUser(id);
         String chks="";
         int chkss=0;
         if(switchCheck==null) {
            switchCheck="N";
            System.out.println(switchCheck);
         }else {
            switchCheck="Y";
         }
         

         if(chk==null) {
            chks="0";
            
         }else {

            for (int i = 0; i < chk.length; i++) {
               
               chks += chk[i]+"/";
            }
            chkss=chk.length;
         }
            
         System.out.println(chkss+"이거");
         System.out.println(switchCheck);

         boolean isS=hcService.updateCheck(new HcDto(pKey,chks,switchCheck,chkss));
         
         
         
         if(isS){

            return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();

         }else{
            model.addAttribute("msg","삭제에 실패 했습니다.");
            return "error";
         }
         
      }      
      

      @RequestMapping(value = "/updateEndList.do", method = RequestMethod.GET)
      public String selectform(HcDto dto, Locale locale, Model model) {
         logger.info("체크 하기 {}.", locale);      
      
      
         boolean isS=hcService.updateEndList(dto);
         
         HcDto HcDto = hcService.getHabitCalList(dto.getpKey());
         HcLoginDto HcLoginDto= hcService.getUser(dto.getId());

         
         if(isS){
            if(HcDto.getEndList().equals("Y")){
            
               return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();
               
            }else {
               
               return "redirect:habitCalCompleteList.do?id="+HcLoginDto.getId();

            }

         }else{
            model.addAttribute("msg","삭제에 실패 했습니다.");
            return "error";
         }
      }
      
      
      @RequestMapping(value = "/habitCalCompleteList.do", method = RequestMethod.GET)
      public ModelAndView main(String id, Locale locale) {

         ModelAndView view = new ModelAndView();

            
            HcLoginDto HcLoginDto= hcService.getUser(id);
            

               List<HcDto> list=hcService.getAllList(id);
               System.out.println(list);
               
               
               double count=0;
               int xsize=0;
               double sum=0;
            
               for (int k = 0; k < list.size(); k++) {
                  if(list.get(k).getEndList().toUpperCase().equals("Y")) {
                  int term = Integer.parseInt(list.get(k).getTerm());
                  System.out.println("term:"+term);
                  System.out.println("list.get(k).getChkss():"+list.get(k).getChkss());
                  System.out.println("(list.get(k).getChkss()/term)*100:"+(list.get(k).getChkss()/term)*100);
                  count +=(list.get(k).getChkss()/(double)term)*100;
                  System.out.println("count:"+count);
                  ++xsize;
                  }
                  
               }

               if(xsize==0) {
                  sum=0.0;
               }else {
                  
                  sum=count/xsize;               
               }
                        
               view.setViewName("habitCalCompleteList");
               view.addObject("sum",sum);
               view.addObject("list",list);
               view.addObject("HcLoginDto",HcLoginDto);
               return view;
               
      }   

      
      @RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
      public ModelAndView boardlist(String id, String with, Locale locale, Model model) {
         logger.info("함께 혼자 목록 {}.", locale);
         ModelAndView view = new ModelAndView();
         
         System.out.println("with:"+with);
         if(with.equals("Y")) {
        	 List<HcDto> list=hcService.getAllHcListY();
        	 view.addObject("list",list);
        	 view.setViewName("boardlistWith");
         }else {
        	 List<HcDto> list=hcService.getAllHcList();            
        	 view.addObject("list",list);
        	 view.setViewName("boardlist");
         }
         
         HcLoginDto HcLoginDto= hcService.getUser(id);
         
         view.addObject("id",id);
         view.addObject("role",HcLoginDto.getRole());

         return view;
      }         
      
      
      @RequestMapping(value = "/promise.do", method = RequestMethod.GET)
      public String promise(String id, String pKey, Locale locale, Model model) {
         System.out.println(id);
         System.out.println(pKey);
         Map<String, String> map = new HashMap<String, String>();
         map.put("id", id);
         map.put("pKey", pKey);
         model.addAttribute("map", map);

         return "promise";
      }
      
      
      @RequestMapping(value = "/promiseCheck.do", method = RequestMethod.POST)
      public String promiseCheck(String id, String pKey, String promise, Locale locale, Model model) {
         System.out.println(id);
         System.out.println(pKey);
         System.out.println(promise);
         
         if(promise.equals("on")) {
            HcDto HcDto = hcService.getHabitCalList(pKey);
            HcWithDto HcWithDto=hcService.getCalWith(id);
            
            System.out.println("HcWithDto:"+HcWithDto);
            int intoper=HcDto.getIntoper();
            String idlist=HcDto.getIdlist();
            String withGoalList;
            
            if(intoper>=HcDto.getRecruit()) {
               model.addAttribute("msg","인원이 꽉찼습니다.");
               return "error";
            }else {
               boolean isS;
               boolean isS2;
               ++intoper;
               idlist += "/"+id;
               
               if(HcWithDto==null) {
                  withGoalList=pKey;
                  isS=hcService.insertCalWith(new HcWithDto(id, withGoalList));
               }else {
                  withGoalList=HcWithDto.getWithGoalList()+"/"+pKey;
                  isS=hcService.updateCalWith(new HcWithDto(id, withGoalList));
                  System.out.println("withGoalList:"+withGoalList);
               }
               
               
               isS2=hcService.updateIntoper(new HcDto(pKey,intoper,idlist));
              
               
               
               int term = Integer.parseInt(HcDto.getTerm());
               
               
               for (int i = 0; i < term; i++) {
                   boolean isS1;
                  
                   int year1= Integer.parseInt(HcDto.getStDate().substring(0, 4)); 
                   System.out.println("year1:"+year1);
                   int month1= Integer.parseInt(HcDto.getStDate().substring(4, 6));
                   System.out.println("month1:"+month1);
                   int day1= Integer.parseInt(HcDto.getStDate().substring(6)); 
                   System.out.println("day1:"+day1);
                   
                   Calendar cal = Calendar.getInstance();
                   
                   cal.set(year1, month1-1, day1);
                   
                   cal.add(Calendar.DATE, i);
                   
                   SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
                   String inChkDate =SimpleDateFormat.format(cal.getTime());
                   
                   System.out.println("inChkDate:"+inChkDate);
                   isS1 = hcService.insertHcInChk(new HcInChkDto(pKey, id, HcDto.getTitle(), inChkDate));
                   
                   
                   if(isS1) {
                      System.out.println("insertHcInChk에입 력성공");
                   }else {
                      model.addAttribute("msg","실패 했습니다.!");
                      return "error";
                   }
                }               

               
               
               if(isS==true && isS2==true) {
                  System.out.println("값 입력 성공");
                  return "redirect:habitCalDetail.do?id="+id+"&pKey="+pKey+"&paramview=1";

               }else {
                  System.out.println("값 입력 실패");
                  model.addAttribute("msg","값 입력에 실패했습니다.2");
                  return "error";      
               }
               
            }
                        
         }else {
            model.addAttribute("msg","서약에 실패 했습니다.");
            return "error";
         }
         

      }
      
         
      @RequestMapping(value = "/photoInChkContent.do", method = RequestMethod.GET)
      public ModelAndView photoInChkContent(String inChkDate,String crud, String id, String pKey, Locale locale, String paramview,  Model model) throws ParseException {
          ModelAndView view = new ModelAndView();
          
          HcDto dto = hcService.getHabitCalList(pKey);
          HcLoginDto HcLoginDto= hcService.getUser(id);
          System.out.println(dto);
          
          SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
          Date currentTime = new Date ();
          String today = SimpleDateFormat.format(currentTime);
          
          int inChkDate1 = Integer.parseInt(inChkDate);
          
          int StDate1 = Integer.parseInt(dto.getStDate());
          long diffdays;                  

          
      	  diffdays=Util.doDiffOfDate(StDate1+"",inChkDate1+"")+1;
        	  
	      String Year1=inChkDate.substring(0,4);
	      String Month1=inChkDate.substring(4,6);
	      String Date1=inChkDate.substring(6);                   
          
          view.addObject("dto",dto);
          view.addObject("HcLoginDto",HcLoginDto);   
          view.addObject("paramview",paramview);
          
          view.addObject("diffdays",diffdays);
          view.addObject("inChkDate",inChkDate);  
          view.addObject("today",today);  
          view.addObject("Year1",Year1);          
          view.addObject("Month1",Month1);
          view.addObject("Date1",Date1);
          HcInChkDto HcInChkDto = hcService.getHcUserInChk(new HcInChkDto(pKey,inChkDate ,id));
          view.addObject("HcInChkDto",HcInChkDto);                  	  
          
          if(crud.equals("content")) {
        	  
        	  view.setViewName("photoInChkContent");
        	  
          }else if(crud.equals("update")) {
        	  view.setViewName("photoInChkUpdate");
          }
          

     	 return view;
         

      }
      
     
      @RequestMapping(value = "/photoInChk.do", method = RequestMethod.GET)
      public ModelAndView photoInChk(String id, String pKey, String paramview, String thisDate, Locale locale) throws ParseException {
         logger.info("상세보기 {}.", locale);
         ModelAndView view = new ModelAndView();

         HcDto dto = hcService.getHabitCalList(pKey);
         
         HcLoginDto HcLoginDto= hcService.getUser(id);
         System.out.println(dto);
         
         
         SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
         Date currentTime = new Date ();
         String today = SimpleDateFormat.format(currentTime);
         
         

         int StDate1 = Integer.parseInt(dto.getStDate());
         

        	 long diffdays=Util.doDiffOfDate(StDate1+"",thisDate+"")+1;
        	 
             String Year1=thisDate.substring(0,4);
             String Month1=thisDate.substring(4,6);
             String Date1=thisDate.substring(6);

        	 view.setViewName("photoInChk");
        	 List<HcInChkDto> list = hcService.getHcInChk(new HcInChkDto(pKey, thisDate+""));
        	 view.addObject("list",list);
        	 view.addObject("dto",dto);
        	 view.addObject("HcLoginDto",HcLoginDto);   
        	 view.addObject("paramview",paramview);
        	 System.out.println(paramview);
        	 
        	 view.addObject("thisDate",thisDate);
        	 view.addObject("today",today);
        	 view.addObject("Year1",Year1);
        	 view.addObject("diffdays",diffdays);
       	 
        	 view.addObject("Month1",Month1);
        	 view.addObject("Date1",Date1);
      	 

        	 return view;
     

      }
           
      
      
      
      @RequestMapping(value = "/photoInChkDelete.do", method = RequestMethod.GET)
      public String photoInChkDelete(String id, String pKey, Locale locale, String paramview,  Model model){
    	  

          SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
          Date currentTime = new Date ();
          String today = SimpleDateFormat.format(currentTime);
          
          
          boolean isS=hcService.deleteHcUserInChk(new HcInChkDto(pKey,today ,id));
          HcDto HcDto =hcService.getHabitCalList(pKey);
          
          if(isS==true) {
        	  

        	  
        	  
        	  int count = 0;
        	  List<HcInChkDto> list =hcService.getHcInChk(new HcInChkDto(pKey, today));
        	  for (int i = 0; i < list.size(); i++) {
  				if (list.get(i).getInChkPhoto().equals("/")) {
  					
  				}else {
  					count++;					
  				}
        	  }
        	  System.out.println("count:"+count);
        	  System.out.println("(double)(count/list.size():딜리트"+(count/(double)list.size()));
        	  
        	  if( (count/(double)list.size()) >= 0.7) {


        	  }else {
        		  

        		  String chks=HcDto.getChks().substring(0, HcDto.getChks().length()-8); 	  
        		  int chkss=HcDto.getChkss()-1;
        		  HcDto.setChks(chks);
        		  HcDto.setChkss(chkss);
        		  System.out.println("HcDto:딜리트"+HcDto);
        		  boolean isS1=hcService.updateCheck(HcDto);

        		  if(isS1==true) {
        			  System.out.println("chks,chkss삭제성공");
        		  }else {
        			  System.out.println("chks,chkss삭제실패");
        		  }
        	  }
        	  
        	  
        	  
        	  
              System.out.println("삭제 성공");
              return "redirect:habitCalDetail.do?id="+id+"&pKey="+pKey+"&paramview="+paramview+"&calString=a";

           }else {
              System.out.println("삭제 실패");
              model.addAttribute("msg","값 삭제에 실패했습니다.");
              return "error";      
           }          
          
       }         
      
      @RequestMapping(value = "/photoInChkUpdate.do", method = RequestMethod.POST)
      public String photoInChkUpdate(HcInChkDto HcInChkDto, Locale locale, String paramview,  Model model) throws Exception{
    	  

          SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
          Date currentTime = new Date ();
          String today = SimpleDateFormat.format(currentTime);
          String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());

          String HH=inTime.substring(0,2)+"시";
          String mm=inTime.substring(2,4)+"분";
          String tt=inTime.substring(4,6)+"초";
    	  HcInChkDto.setInChkTime(HH+mm+tt);
    	  HcInChkDto.setInChkDate(today);

          MultipartFile f = HcInChkDto.getFile();
          if(!f.isEmpty()) {//파일 업로드가 됐다면
        	  String orgname=f.getOriginalFilename();
        	  String newname=HcInChkDto.getId()+today+orgname;
        	  String path=servletContext.getRealPath("/resources");
        	  System.out.println("path:"+path);          
        	  File file=new File(path+File.separator+newname);
        	  HcInChkDto.setInChkPhoto(orgname);
        	  HcInChkDto.setInChkPhoto2(newname);
        	  f.transferTo(file);
          }

          
          boolean isS=hcService.updateHcInChk(HcInChkDto);
          if(isS==true) {
              System.out.println("수정 성공");
              return "redirect:habitCalDetail.do?id="+HcInChkDto.getId()+"&pKey="+HcInChkDto.getpKey()+"&paramview="+paramview+"&calString=a";

           }else {
              System.out.println("수정 실패");
              model.addAttribute("msg","값 삭제에 실패했습니다.");
              return "error";      
           }          
          
       }         
      
      @RequestMapping(value = "/photoInChkInsert.do", method = RequestMethod.POST)
      public String photoInChkInsert(HcInChkDto HcInChkDto, Locale locale, String paramview,  Model model) throws Exception{
    	  
    	  SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
    	  Date currentTime = new Date ();
    	  String today = SimpleDateFormat.format(currentTime);
    	  String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
    	  System.out.println("inTime:"+inTime);
    	  
    	  
    	  
          int beforeCount = 0;
    	  List<HcInChkDto> beforeList =hcService.getHcInChk(new HcInChkDto(HcInChkDto.getpKey(), today));
    	  for (int i = 0; i < beforeList.size(); i++) {
			if (beforeList.get(i).getInChkPhoto().equals("/")) {
			}else {
				beforeCount++;					
			}
    	  }         
             	  
    	 
    	  
    	  
          
          String HH=inTime.substring(0,2)+"시";
          String mm=inTime.substring(2,4)+"분";
          String tt=inTime.substring(4,6)+"초";
    	  HcInChkDto.setInChkTime(HH+mm+tt);
    	  HcInChkDto.setInChkDate(today);
          
          MultipartFile f = HcInChkDto.getFile();
          if(!f.isEmpty()) {//파일 업로드가 됐다면
        	  String orgname=f.getOriginalFilename();
        	  String newname=HcInChkDto.getId()+today+orgname;
        	  String path=servletContext.getRealPath("/resources");
        	  System.out.println("path:"+path);          
        	  File file=new File(path+File.separator+newname);
        	  HcInChkDto.setInChkPhoto(orgname);
        	  HcInChkDto.setInChkPhoto2(newname);
        	  f.transferTo(file);
          }
          
          System.out.println(HcInChkDto);

          
          boolean isS=hcService.updateHcInChk(HcInChkDto);
          
          
          if(isS==true) {
        	  
        	  if((beforeCount/(double)beforeList.size()) >= 0.7) {
        		  
        	  }else {
        		  
	        		  int count = 0;
	        		  List<HcInChkDto> list =hcService.getHcInChk(new HcInChkDto(HcInChkDto.getpKey(), HcInChkDto.getInChkDate()));
	        		  for (int i = 0; i < list.size(); i++) {
	        			  if (list.get(i).getInChkPhoto().equals("/")) {
	        			  }else {
	        				  count++;					
	        			  }
	        		  }
	        		  System.out.println("count:"+count);
	        		  System.out.println("list.size():"+list.size());
	        		  System.out.println("(double)(count/list.size()):"+(count/(double)list.size()));
	        		  HcDto HcDto=hcService.getHabitCalList(HcInChkDto.getpKey());
	        		  
	        		  if( (count/(double)list.size()) >= 0.7) {
	        			  
	        			  String chks=(HcDto.getChks()+"/"+HcInChkDto.getInChkDate());
	        			  int chkss=HcDto.getChkss()+1;
	        			  HcDto.setChks(chks);
	        			  HcDto.setChkss(chkss);
	        			  boolean isS1=hcService.updateCheck(HcDto);
	        			  
	        			  if(isS1==true) {
	        				  System.out.println("chks,chkss입력성공");
	        			  }else {
	        				  System.out.println("chks,chkss입력실패");
	        			  }
	        			  
	        		  }else {
	        			  
	        		  }
        		  
        	  }
        	  
        	  
        	  
        	  
              System.out.println("수정 성공");
              return "redirect:habitCalDetail.do?id="+HcInChkDto.getId()+"&pKey="+HcInChkDto.getpKey()+"&paramview="+paramview+"&calString=a";

           }else {
              System.out.println("수정 실패");
              model.addAttribute("msg","값 삭제에 실패했습니다.");
              return "error";      
           }          
          
       }

      
}