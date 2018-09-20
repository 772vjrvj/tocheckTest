package com.hk.toCheckFinal;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hk.toCheckFinal.dtos.HcChkDto;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;
import com.hk.toCheckFinal.service.IHcService;
import com.hk.toCheckFinal.utils.Util;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import jdk.nashorn.internal.runtime.Undefined;


/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"loginId", "loginRole"})

@Controller
public class HomeController implements ServletContextAware {
   
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	private static final Object Undefined = null;

   
	@Autowired
	private IHcService hcService;

	private ServletContext servletContext;
	
	SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
	Date currentTime = new Date ();
	String today = SimpleDateFormat.format(currentTime);
	int today1 = Integer.parseInt(today);
	Calendar cal = Calendar.getInstance();
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext=servletContext;
	}            

	//회원가입
	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public String regist(Locale locale) {
		logger.info("회원가입 {}.", locale);

		return "regist";
	}   
   
	//회원가입 후
	@RequestMapping(value = "/regist_after.do", method = RequestMethod.POST)
	public String getAllBoard(HcLoginDto dto, Locale locale, Model model) {
		logger.info("회원가입 후{}.", locale);
      
		boolean isS=hcService.insertUser(dto);
      
		if(isS) {
			model.addAttribute("id", dto.getId());               
			return "welcome";
		}else {
			model.addAttribute("msg","회원가입에 실패 했습니다.!");
			return "error";
		}
	}
   
	//중복체크
	@RequestMapping(value = "/idchk.do", method = RequestMethod.GET)
	public String idchk(String id, Locale locale, Model model) {
		logger.info("중복체크 {}.", locale);

		String isS="n";
		String nycontent ="사용할 수 없는 아이디 입니다.";
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
   
	//팝업창 띄우기
	@RequestMapping(value = "/popup.do", method = RequestMethod.GET)
	public String popup(Locale locale,SessionStatus session) {
	   logger.info("팝업창 띄우기 {}", locale);
	   
	   return "popup";
	}      
	   
	//로그인
	@RequestMapping(value = "/login_after.do", method = RequestMethod.POST)
	public String login_after(HcLoginDto dto, Locale locale, Model model, SessionStatus session) {
		logger.info("로그인 진행중 {}.", locale);
		System.out.println(dto);

		HcLoginDto HcLoginDto= hcService.getLogin(dto.getId(), dto.getPassword());
      
		if(HcLoginDto!=null){

			if(HcLoginDto.getEnabled().equals("Y")){
				model.addAttribute("loginId", HcLoginDto.getId());
				model.addAttribute("loginRole", HcLoginDto.getRole());
            
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
   
	//혼자 함께 선택selectform
	@RequestMapping(value = "/selectform.do", method = RequestMethod.GET)
	public String selectform(Model model,Locale locale,SessionStatus session) {
	   logger.info("selectform{}", locale);
	   System.out.println();
	   return "selectform"; 
	}     	
	
	
   
	//유저 메인페이지
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(String id, String role, Locale locale,SessionStatus session) {
		logger.info("main.do {}.", locale);   

		ModelAndView view = new ModelAndView();

		HcLoginDto HcLoginDto= hcService.getUser(id);
        
		
		//운영자 페이지로
		if(role.toUpperCase().equals("ADMIN")) {
			view.setViewName("home");
            view.addObject("id",id);
            return view;
            
        //유저페이지
		}else {
            
			List<HcDto> list=hcService.getAllListEvery();
			System.out.println("1");
			System.out.println("list.size():"+list.size());
			for (int k = 0; k < list.size(); k++) {
				System.out.println("11");
				//종료 일이 오늘날짜보다 작다는 건 지난 것이라는 이야기// 모든 유저들의 리스트 중에 기간이 지난것을 종료 시켜줌
				if(Integer.parseInt(list.get(k).getEdDate()) < today1) {
					list.get(k).setEndList("Y");
					System.out.println("2");
					boolean isS=hcService.updateEndList(list.get(k));
            		if(isS==true) {
            			System.out.println("endList변경 성공");
            		}else {
            			System.out.println("endList변경 실패");
            		}
            	}else {
            		
            	}
				
				if(list.get(k).getWithh()=="Y") {
					if((double)hcService.habitCalIntoPerCount(list.get(k).getpKey())/list.get(k).getRecruit()<0.6) {
						boolean isS  = hcService.habitCalDeleteAll(list.get(k).getpKey());
						boolean isS1  = hcService.deleteHcInChkAll(list.get(k).getpKey()); 
					}
				}else {
					
				}
            	
            }
            
			
			//로그인 아이디의 리스트 가저오기
			List<HcDto> list1=hcService.getAllList(id);

            view.setViewName("usermain");
            view.addObject("list1",list1);
            view.addObject("HcLoginDto",HcLoginDto);
            return view;
            
         }

	}   

	//현재 진행중인 리스트 평균 각각 퍼센트 구하기
	@RequestMapping(value = "/totalPer.do", method = RequestMethod.GET)
	public ModelAndView totalPer(String id, Locale locale, Model model) {
		logger.info("전체 진행 퍼센트 {}.", locale);
		HcLoginDto HcLoginDto= hcService.getUser(id);

		ModelAndView view = new ModelAndView();
		
		List<HcDto> list1=hcService.getAllList(id);

		double count=0;
		double sum=0;            
      
		for (int m = 0; m < list1.size(); m++) {
			int term = Integer.parseInt(list1.get(m).getTerm());
			
			int chkCount = hcService.habitCalChkCount(list1.get(m).getpKey());
			
			count +=(chkCount/(double)term)*100;
		}            

		//현재 진행중인 리스트의 평균sum 구하기
		if(list1.size()==0||count==0) {
			sum=0.0;
		}else {
			sum=count/list1.size();               
		}
		
		view.addObject("sum",sum);		
        view.addObject("list1",list1);
        view.addObject("HcLoginDto",HcLoginDto);
        view.setViewName("progress");
        return view;		
		
	   }    
	
	//유저정보
	@RequestMapping(value = "/userinfo.do", method = RequestMethod.GET)
	public String userinfo(String id, Locale locale, Model model) {
		logger.info("유저정보 {}.", locale);
		HcLoginDto HcLoginDto= hcService.getUser(id);

		model.addAttribute("HcLoginDto", HcLoginDto);
		return "userinfo";
	}         
   
	//유저 업데이트
	@RequestMapping(value = "/updateform.do", method = RequestMethod.GET)
	public String updateform(String id, Locale locale, Model model) {
      logger.info("유저 업데이트 {}.", locale);

      HcLoginDto HcLoginDto= hcService.getUser(id);

      model.addAttribute("HcLoginDto", HcLoginDto);
      return "updateform";
	}            

	//유저업데이트 후
	@RequestMapping(value = "/updateform_after.do", method = RequestMethod.POST)
	public String updateform_after(HcLoginDto HcLoginDto, Locale locale) {
		logger.info("유저업데이트 후 {}.", locale);

		String id=HcLoginDto.getId();
      
		boolean isS= hcService.updateUser(HcLoginDto);
      
		if(isS){
			return "redirect:userinfo.do?id="+id;
		}else{
			return "redirect:updateform.do?id="+id;
		}
	}               
	
	//탈퇴하기
	@RequestMapping(value = "/deluser.do", method = RequestMethod.GET)
	public String deluser(String id, Locale locale) {
		logger.info("탈퇴하기 {}.", locale);
      
		boolean isS1= hcService.deleUser(id);
		boolean isS2= hcService.deleList(id);
		
		if(isS1==true&&isS2==true){
			System.out.println("탈퇴성공");
			return "redirect:index.jsp";
		}else{
			System.out.println("탈퇴실패");
			return "redirect:userinfo.do?id="+id;
		}
	}         
   
	//습관 만들기
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
      
	//포인트 - 아직 완성 안됨
	@RequestMapping(value = "/point.do", method = RequestMethod.GET)
	public String point(String id, Locale locale, Model model) {
		logger.info("포인트 {}.", locale);

		HcLoginDto HcLoginDto= hcService.getUser(id);

		model.addAttribute("HcLoginDto", HcLoginDto);
		return "point";
	}   
   
	//로그아웃   
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String point(Locale locale, Model model, SessionStatus session) {
		logger.info("로그아웃 {}.", locale);
		model.addAttribute("loginId", "0");
		model.addAttribute("loginRole", "0");

		return "logout";
	}      
   

	//Start(만들기) habitCalrForm.jsp 에서 입력한 값들이 넘어 온다.       
	@RequestMapping(value = "/habitCalInsert.do", method = RequestMethod.POST)
	public String habitCalInsert(String year, String month, String date, HcDto HcDto, Locale locale, Model model) {
    	  
		logger.info("habitCalInsert {}.", locale);
      
		//시작일(stDate) yymmdd만들고 setter에 넣기
		String stDate = year+Util.isTwo(month)+Util.isTwo(date);
		HcDto.setStDate(stDate);
    	  
		//종료일(edDate) yymmdd설정  setter에 넣기
		String edDate = Util.edDate(year,month,date,HcDto.getTerm());
		HcDto.setEdDate(edDate);
    	  
		//pKey만들고  setter에 넣기
		String pKey = Util.getPKey(HcDto.getId());
		HcDto.setpKey(pKey);
    	  
		//함께하기(withh) & 공개하기(calWith) 세팅
		if(HcDto.getRecruit()==1) {
			HcDto.setWithh("N");
			HcDto.setCalWith("N");
		}else {
			HcDto.setWithh("Y");
			HcDto.setCalWith("Y");
		}
          
			HcDto.setHost(HcDto.getId());
		
          
		//진행중progress 세팅 오늘날짜와 시작일이 같은지 여부 확인
		if(today.equals(stDate)) {
			HcDto.setProgress("Y");
		}else {
			HcDto.setProgress("N");  
		}          

		//habitCalInsert에 모든 값 입력
		boolean isS = hcService.habitCalInsert(HcDto);
         
		if(isS) {
        	  
			if(HcDto.getWithh().equals("N")) {
	        	  
			}else {
				//함께 하기일 경우 그 기간만큼 인증페이지insertHcInChk가 필요 하다 
				int term = Integer.parseInt(HcDto.getTerm());
				for (int i = 0; i < term; i++) {
					int year1 = Integer.parseInt(year);
					int month1 = Integer.parseInt(month);
					int day1 = Integer.parseInt(date);
        			 
					Calendar cal = Calendar.getInstance();
					cal.set(year1, month1-1, day1);
					cal.add(Calendar.DATE, i);
        			 
					String inChkDate =SimpleDateFormat.format(cal.getTime());
        			 
					boolean isS1 = hcService.insertHcInChk(new HcInChkDto(pKey, HcDto.getId(),HcDto.getTitle(), inChkDate));
        			 
					if(isS1) {
        				 
					}else {
	        			  
						model.addAttribute("msg"," insertHcInChk 실패 했습니다.!");
						return "error";
					}
	        		  
				}
	        	  
			}

			return "redirect:habitCalDetail.do?id="+HcDto.getId()+"&pKey="+HcDto.getpKey();
	          
		}else {
			model.addAttribute("msg"," habitCalInsert 실패 했습니다.!");
			return "error";
		}
         
	}               

	
	//모든 회원들의 '혼자' 하기 리스트 보기
	@RequestMapping(value = "/boardListAlone.do", method = RequestMethod.GET)
	public ModelAndView boardlist(Locale locale, Model model) {
		logger.info("혼자하기 목록 {}.", locale);
		ModelAndView view = new ModelAndView();
       
      	 List<HcDto> list1=hcService.getAllHcListAlone(); 
      	 for (int i = 0; i < list1.size(); i++) {
      		System.out.println(list1.get(i));
      	 }
      	 
      	 view.addObject("list1",list1);
      	 view.setViewName("boardListAlone");

       return view;
    }   	
	
	//모든 회원들의 '함께' 하기 리스트 보기
    @RequestMapping(value = "/boardListWith.do", method = RequestMethod.GET)
    public ModelAndView boardlistWith(Locale locale, Model model) {
       logger.info("함께하기 목록 {}.", locale);
       ModelAndView view = new ModelAndView();
       
      	 List<HcDto> list=hcService.getAllHcListWith();
      	 view.addObject("list",list);
      	 view.setViewName("boardListWith");

       return view;
    } 	


    //모든 회원들의 '혼자' 하기 리스트 상세 보기만 하기 다른 사용자용
	@RequestMapping(value = "/habitCalAloneDetailView.do", method = RequestMethod.GET)
	public ModelAndView habitCalAloneDetailView(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalAloneDetailView {}.", locale);
		ModelAndView view = new ModelAndView();
		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        
		Map<String, Integer> map =Util.DetailYYMMDD(dto);
        
		List<String> chkList=hcService.habitCalTakeChk(pKey);
		
        long diffdays=Util.doDiffOfDate(dto.getStDate())+1;

        view.addObject("diffdays",diffdays);     
        view.addObject("chkList",chkList);
        view.addObject("dto",dto);   
        view.addObject("map",map);
        view.addObject("id",id); 
        view.setViewName("habitCalAloneDetailView");
        	 
        return view;         
        	 
	}   
    

	//함께하기 달력 보기만 하기
	@RequestMapping(value = "/habitCalWithDetailView.do", method = RequestMethod.GET)
	public ModelAndView habitCalWithDetailView(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalWithDetailView {}.", locale);
		ModelAndView view = new ModelAndView();
		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        
		long diffdays=Util.doDiffOfDate(dto.getStDate())+1;
		//시작일 =< 오늘날짜  =< 종료일 && 함께하기 상태인 경우
        
		if(diffdays>=1 && diffdays<=Integer.parseInt(dto.getTerm())) {
        	  
			Map<String, Integer> map= Util.TodayYYMMDD();
			//인증하기 해당 날짜에 해당 목록
			List<HcInChkDto> list = hcService.getHcInChk(new HcInChkDto(pKey, today1+""));
			view.addObject("list",list);
			view.addObject("diffdays",diffdays);
			view.addObject("map",map);
			view.addObject("dto",dto);
			view.setViewName("photoInChkView");
        	 
			return view;
			
		}else{

    		Map<String, Integer> map =Util.DetailYYMMDD(dto);
    		List<HcDto> list = hcService.getHabitCalList(pKey);
    		int intoPer=hcService.habitCalIntoPerCount(pKey);
    		List<String> chkList=hcService.habitCalTakeChk(pKey);
    		view.addObject("diffdays",-(diffdays-1));
            view.addObject("dto",dto);   
            view.addObject("map",map);
            view.addObject("intoPer",intoPer);
            view.addObject("chkList",chkList);
            view.addObject("list",list);//참가자들
            
            view.setViewName("habitCalWithDetailView");
            	 
            return view;        
		}        

	}
         

	
	
	
	//Alone or With Detail페이지로 가기위해 들리는 곳
	@RequestMapping(value = "/habitCalDetail.do", method = RequestMethod.GET)
	public String habitCalDetail(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalDetail {}.", locale);
		
		List<HcDto> list1=hcService.getAllList(id);
		
		for (int i = 0; i < list1.size(); i++) {
			if(list1.get(i).getpKey().equals(pKey)) {
				boolean isS1=hcService.updateSort("1", list1.get(i).getpKey());
				if(isS1==true) {
					System.out.println("updateSort변경 성공");
				}else {
					System.out.println("updateSort변경 실패");
				}
			}else {
				boolean isS2=hcService.updateSort("0", list1.get(i).getpKey());
				if(isS2==true) {
					System.out.println("updateSort변경 성공");
				}else {
					System.out.println("updateSort변경 실패");
				}
			}
		}
		
		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
		if(dto.getWithh().equals("N")) {
			return "redirect:habitCalAloneDetail.do?id="+id+"&pKey="+pKey;
		}else {
			return "redirect:habitCalWithDetail.do?id="+id+"&pKey="+pKey;
		}

	}  


	//Alone or With Detail페이지로 가기위해 들리는 곳
	@RequestMapping(value = "/habitCalDetailView.do", method = RequestMethod.GET)
	public String habitCalDetailView(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalDetailView {}.", locale);

		HcDto dto = hcService.getHabitCalListOne(pKey,id);
		if(dto.getWithh().equals("N")) {
			return "redirect:habitCalAloneDetailView.do?id="+id+"&pKey="+pKey;
		}else {
			return "redirect:habitCalWithDetailView2.do?id="+id+"&pKey="+pKey;
		}

	}  	
	
	
    //상세보기
    //모든 회원들의 '혼자' 하기 리스트 상세보기 로그인 사용자 보기 수정가능
	@RequestMapping(value = "/habitCalAloneDetail.do", method = RequestMethod.GET)
	public ModelAndView habitCalAloneDetail(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalAloneDetail {}.", locale);
		ModelAndView view = new ModelAndView();
		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        
		Map<String, Integer> map =Util.DetailYYMMDD(dto);
        
		List<String> chkList=hcService.habitCalTakeChk(pKey);
		

        long diffdays=Util.doDiffOfDate(dto.getStDate())+1;

        view.addObject("diffdays",diffdays);     
        view.addObject("chkList",chkList);
        view.addObject("dto",dto);   
        view.addObject("map",map);
        view.addObject("id",id); 
        view.setViewName("habitCalAloneDetail");
        	 
        return view;         
        	 
	}    	
	

	
	//모든 회원들의 '함께' 하기 리스트 상세보기 로그인 사용자 보기 수정불가
	@RequestMapping(value = "/habitCalWithDetail.do", method = RequestMethod.GET)
	public ModelAndView habitCalWithDetail(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalWithDetail {}.", locale);
		ModelAndView view = new ModelAndView();
		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        
		long diffdays=Util.doDiffOfDate(dto.getStDate())+1;
		//시작일 =< 오늘날짜  =< 종료일 && 함께하기 상태인 경우
        
		if(diffdays>=1 && diffdays<=Integer.parseInt(dto.getTerm())) {
        	  
			

				Map<String, Integer> map= Util.TodayYYMMDD();
				//인증하기 해당 날짜에 해당 목록
				List<HcInChkDto> list = hcService.getHcInChk(new HcInChkDto(pKey, today1+""));
				view.addObject("list",list);
				view.addObject("diffdays",diffdays);
				view.addObject("map",map);
				view.addObject("dto",dto);
				view.setViewName("photoInChk");

			
        	 
			return view;
			
		}else{

    		Map<String, Integer> map =Util.DetailYYMMDD(dto);
    		List<HcDto> list = hcService.getHabitCalList(pKey);
    		int intoPer=hcService.habitCalIntoPerCount(pKey);
    		List<String> chkList=hcService.habitCalTakeChk(pKey);
    		view.addObject("diffdays",-(diffdays-1));
            view.addObject("dto",dto);   
            view.addObject("map",map);
            view.addObject("intoPer",intoPer);
            view.addObject("chkList",chkList);
            view.addObject("list",list);//참가자들
            
            view.setViewName("habitCalWithDetail");
            	 
            return view;        
		}        

	}

	
	//모든 회원들의 '함께' 하기 리스트 상세보기 로그인 사용자 보기 수정불가
	@RequestMapping(value = "/photoInChkView.do", method = RequestMethod.GET)
	public ModelAndView photoInChkView(String thisDate,String id, String pKey, Locale locale) throws ParseException {
		logger.info("photoInChkView {}.", locale);
		ModelAndView view = new ModelAndView();
		System.out.println("thisDate:"+thisDate);
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        System.out.println("dto.getStDate():"+dto.getStDate());
		long diffdays=Util.doDiffOfDate2(dto.getStDate(),thisDate)+1;
        	System.out.println("diffdays:"+diffdays);
        	  
			Map<String, Integer> map= Util.TodayYYMMDD2(thisDate);
			//인증하기 해당 날짜에 해당 목록
			List<HcInChkDto> list = hcService.getHcInChk(new HcInChkDto(pKey, thisDate));
			view.addObject("list",list);
			view.addObject("diffdays",diffdays);
			view.addObject("map",map);
			view.addObject("dto",dto);
			view.setViewName("photoInChkView");
        	 
			return view;
			 
	}	
	
	
	//함께하기 진행중 전체 달력보기
	@RequestMapping(value = "/habitCalWithDetailView2.do", method = RequestMethod.GET)
	public ModelAndView habitCalWithDetailView2(String id, String pKey, Locale locale) throws ParseException {
		logger.info("habitCalWithDetailView2 {}.", locale);
		ModelAndView view = new ModelAndView();
		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        
		long diffdays=Util.doDiffOfDate(dto.getStDate())+1;
		//시작일 =< 오늘날짜  =< 종료일 && 함께하기 상태인 경우

    		Map<String, Integer> map =Util.DetailYYMMDD(dto);
    		List<HcDto> list = hcService.getHabitCalList(pKey);
    		int intoPer=hcService.habitCalIntoPerCount(pKey);
    		List<String> chkList=hcService.habitCalTakeChk(pKey);
    		view.addObject("diffdays",diffdays);
            view.addObject("dto",dto);   
            view.addObject("map",map);
            view.addObject("intoPer",intoPer);
            view.addObject("chkList",chkList);
            view.addObject("list",list);//참가자들
            
            view.setViewName("habitCalWithDetailView2");
            	 
            return view;
	}	
	
	
	//서약페이지로 이동
    @RequestMapping(value = "/promise.do", method = RequestMethod.GET)
    public String promise(String id, String hostId, String pKey, Locale locale, Model model) {
    	logger.info("promise {}.", locale);
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("id", id);
    	map.put("pKey", pKey);
    	map.put("hostId", hostId);
    	model.addAttribute("map", map);

    	return "promise";
    }	
	
    //서약하면 해당 습관달력의 날짜 만큼 인증페이지 만들어짐
    @RequestMapping(value = "/promiseCheck.do", method = RequestMethod.POST)
    public String promiseCheck(String id, String pKey, String hostId, String promise, Locale locale, Model model) {
		logger.info("promiseCheck {}.", locale);
       
    	if(promise.equals("on")) {
      	 
       	HcDto HcDto = hcService.getHabitCalListOne(pKey,hostId);
       	System.out.println("HcDto promiseCheck:"+HcDto);
       	int intoper=hcService.habitCalIntoPerCount(pKey);

	       	if(intoper>=HcDto.getRecruit()) {
	       		model.addAttribute("msg","인원이 꽉찼습니다.");
	       		return "error";
	       	}else {
	          	HcDto.setId(id);
	          	HcDto.setHost("N");
	          	//참가자 아이디  hcboard 만들기
	           	System.out.println("HcDto promiseCheck2:"+HcDto);
	          	boolean isS=hcService.habitCalInsert(HcDto);
	
	          	Map<String, Integer> map=Util.DetailYYMMDD(HcDto);
	          	
	          	cal.set(map.get("stYear"), map.get("stMonth")-1, map.get("stDate"));
	
	          	//참가자 인증 만들기
	          	for (int i = 0; i < map.get("term"); i++) {
	
	          		cal.add(Calendar.DATE, i);
	              	String inChkDate =SimpleDateFormat.format(cal.getTime());
	              	boolean isS1 = hcService.insertHcInChk(new HcInChkDto(pKey, id, HcDto.getTitle(), inChkDate));
	                 
	              	if(isS1) {
	              		System.out.println("insertHcInChk term"+i+"에입 력성공");
	              	}else {
	              		model.addAttribute("msg","실패 했습니다.!");
	              		return "error";
	              	}
	          	}               

		             
	          	if(isS==true) {
	          		System.out.println("값 입력 성공");
	                return "redirect:habitCalDetail.do?id="+id+"&pKey="+pKey;
	
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
    
    

	//달력 삭제 및 취소
	@RequestMapping(value = "/habitCalDeleteWith.do", method = RequestMethod.GET)
	public String habitCalDeleteWith(String pKey, String id,String which, Locale locale, Model model) {
		logger.info("habitCalDeleteWith {}.", locale);
		System.out.println("habitCalDeleteWith:pKey"+pKey+"habitCalDeleteWith:id"+id);
		boolean isS  = hcService.habitCalDelete(pKey,id);
		System.out.println("habitCalDeleteWith:isS"+isS);
		
		HcLoginDto HcLoginDto=hcService.getUser(id);
		//인증페이지 다 삭제
		boolean isS1  = hcService.deleteHcInChk(pKey,id);   
		System.out.println("habitCalDeleteWith:isS1"+isS1);
			if(isS==true&&isS1==true){
				
				if(which.equals("main")) {
					return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();		
				}else if(which.equals("boardListWith")) {
					return "redirect:boardListWith.do";
				}else if(which.equals("completeList")) {
					return "redirect:habitCalCompleteList.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();				
				}else {
					model.addAttribute("msg","이동에 실패했습니다.");
					return "error";    
				}
				
			}else{
				model.addAttribute("msg","삭제에 실패 했습니다.");
				return "error";            
			}

	}         
      
	//달력 삭제 및 취소
	@RequestMapping(value = "/habitCalDeleteWithAll.do", method = RequestMethod.GET)
	public String habitCalDeleteWithAll(String pKey, String id,String which, Locale locale, Model model) {
		logger.info("habitCalDeleteWithAll {}.", locale);
      
		boolean isS  = hcService.habitCalDeleteAll(pKey);
		HcLoginDto HcLoginDto=hcService.getUser(id);
		//인증페이지 다 삭제
		boolean isS1  = hcService.deleteHcInChkAll(pKey);   
		System.out.println("habitCalDeleteAll:"+isS+"deleteHcInChkAll:"+isS1);
			if(isS==true&&isS1==true){
				
				if(which.equals("main")) {
					return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();		
				}else if(which.equals("boardListWith")) {
					return "redirect:boardListWith.do";
				}else if(which.equals("completeList")) {
					return "redirect:habitCalCompleteList.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();				
				}else {
					model.addAttribute("msg","이동에 실패했습니다.");
					return "error";    
				}
				
			}else{
				model.addAttribute("msg","삭제에 실패 했습니다.");
				return "error";            
			}

	} 
	
	@RequestMapping(value = "/habitCalDeleteAlone.do", method = RequestMethod.GET)
	public String habitCalDeleteAlone(String pKey, String id,String which, Locale locale, Model model) {
		logger.info("habitCalDelete {}.", locale);
      
		boolean isS  = hcService.habitCalDelete(pKey,id);
		HcLoginDto HcLoginDto=hcService.getUser(id);
		//인증페이지 다 삭제
		
			if(isS==true){
				
				if(which.equals("main")) {
					return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();		
				}else if(which.equals("boardListWith")) {
					return "redirect:boardListWith.do";
				}else if(which.equals("completeList")) {
					return "redirect:habitCalCompleteList.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();				
				}else {
					model.addAttribute("msg","이동에 실패했습니다.");
					return "error";    
				}
				
			}else{
				model.addAttribute("msg","삭제에 실패 했습니다.");
				return "error";            
			}

	}   	
	
	
      
	//혼자 하기 공개 비공개 & 체크값 입력
	@RequestMapping(value = "/insertCheck.do", method = RequestMethod.POST)
	public String insertCheck(String pKey, String id, String[] chk, String switchCheck, Locale locale, Model model) {
		logger.info("insertCheck {}.", locale);
      
		HcLoginDto HcLoginDto= hcService.getUser(id);
		if(chk==null){
			boolean isS1=hcService.habitCalChkDelete(pKey,today);
			if(isS1==true) {
				System.out.println("habitCalChkDelete값삭제 성공");
				int chkCount =hcService.habitCalChkCount(pKey);
				
				boolean isS2=hcService.updateChkCount(new HcDto(pKey,chkCount));
				
				if(isS2==true) {
					System.out.println("updateChkCount값삭제 성공");
				}else {
					System.out.println("updateChkCount값삭제 성공");
				}
				
			}else {
				System.out.println("habitCalChkDelete값삭제  실패");
			}
		}else {

			if(chk[chk.length-1].equals(today)) {
				boolean isS=hcService.habitCalInsertChk(pKey,today);
				if(isS==true) {
					System.out.println("habitCalInsertChk값입력 성공");
					int chkCount =hcService.habitCalChkCount(pKey);
					
					boolean isS1=hcService.updateChkCount(new HcDto(pKey,chkCount));
					
					if(isS1==true) {
						System.out.println("updateChkCount값입력 성공");
					}else {
						System.out.println("updateChkCount값입력 성공");
					}
					
				}else {
					System.out.println("habitCalInsertChk값입력 실패");
				}
			}else {
				boolean isS1=hcService.habitCalChkDelete(pKey,today);
				if(isS1==true) {
					System.out.println("habitCalChkDelete값삭제 성공");
					int chkCount =hcService.habitCalChkCount(pKey);
					
					boolean isS2=hcService.updateChkCount(new HcDto(pKey,chkCount));
					
					if(isS2==true) {
						System.out.println("updateChkCount값삭제 성공");
					}else {
						System.out.println("updateChkCount값삭제 성공");
					}
					
				}else {
					System.out.println("habitCalChkDelete값삭제  실패");
				}
			}
		}
		
		
         
		if(switchCheck==null) {
			switchCheck="N";
		}else {
			switchCheck="Y";
		}
         
		boolean isS=hcService.updateCalWith(new HcDto(pKey,switchCheck));

		if(isS){

			return "redirect:main.do?id="+HcLoginDto.getId()+"&role="+HcLoginDto.getRole();

		}else{
			model.addAttribute("msg","삭제에 실패 했습니다.");
            return "error";
		}
         
	}      
      

	//종료일이 지난 모든 리스트들 가저오기
	@RequestMapping(value = "/habitCalCompleteList.do", method = RequestMethod.GET)
	public ModelAndView habitCalCompleteList(String id, Locale locale) {
		logger.info("완료 리스트 목록 {}.", locale);
		ModelAndView view = new ModelAndView();
          
		List<HcDto> list1=hcService.getAllListEndY(id);
          
		view.addObject("list1",list1);
		view.setViewName("habitCalCompleteList");

		return view;
	}   

    //해당일 내용 상세 보기 수정하기 입력하기
	@RequestMapping(value = "/photoInChkCrud.do", method = RequestMethod.GET)
		public ModelAndView photoInChkCrud(String inChkDate,String crud, String id, String pKey, Locale locale, Model model) throws ParseException {
		logger.info("photoInChkCrud {}.", locale);
		ModelAndView view = new ModelAndView();		
		HcDto dto = hcService.getHabitCalListOne(pKey,id);
        System.out.println("dto:"+dto);
		long diffdays=Util.doDiffOfDate(dto.getStDate())+1;

		Map<String, Integer> map =Util.TodayYYMMDD();
		HcInChkDto HcInChkDto = hcService.getHcUserInChk(new HcInChkDto(pKey,inChkDate ,id));
    		
		view.addObject("diffdays",diffdays);
		view.addObject("dto",dto);   
		view.addObject("map",map);
		view.addObject("HcInChkDto",HcInChkDto);    
		
		if(crud.equals("content")) {
			view.setViewName("photoInChkContent");
		}else if(crud.equals("update")) {
			view.setViewName("photoInChkUpdate");
		}else if(crud.equals("contentView")) {	
			view.setViewName("photoInChkContentView");
		}else {
			view.setViewName("photoInChkInsert");
		}

		return view;		
	}


	//값 입력
	@RequestMapping(value = "/photoInChkInsert.do", method = RequestMethod.POST)
	public String photoInChkInsert(HcInChkDto HcInChkDto, Locale locale, Model model) throws Exception{
		logger.info("photoInChkInsert {}.", locale);
		SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		Date currentTime = new Date ();
		String today = SimpleDateFormat.format(currentTime);
		String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());

        String HH=inTime.substring(0,2)+"시";
        String mm=inTime.substring(2,4)+"분";
        String tt=inTime.substring(4,6)+"초";
        HcInChkDto.setInChkTime(HH+mm+tt);
        HcInChkDto.setInChkDate(today+"");
        
        MultipartFile f = HcInChkDto.getFile();
        if(!f.isEmpty()) {//파일 업로드가 됐다면
      	  String orgname=f.getOriginalFilename();
      	  String newname=HcInChkDto.getId()+today+orgname;
      	  String path=servletContext.getRealPath("/resources");
      	  File file=new File(path+File.separator+newname);
      	  HcInChkDto.setInChkPhoto(orgname);
      	  HcInChkDto.setInChkPhoto2(newname);
      	  f.transferTo(file);
        }
        
        System.out.println("HcInChkDto:"+HcInChkDto);
        boolean isS=hcService.updateHcInChk(HcInChkDto);

        if(isS==true) {
      	  
        	int beforeCount = 0;
        	List<HcInChkDto> beforeList =hcService.getHcInChk(new HcInChkDto(HcInChkDto.getpKey(), today));
        	for (int i = 0; i < beforeList.size(); i++) {
        		if (beforeList.get(i).getInChkPhoto().equals("/")) {
        			
        		}else {
        			beforeCount++;					
        		}
        	}                
        	
        	if((beforeCount/(double)beforeList.size()) >= 0.6) {
        		hcService.habitCalInsertChk(HcInChkDto.getpKey(), today);
        		
        		int chkCount=hcService.habitCalChkCount(HcInChkDto.getpKey());

        		hcService.updateChkCount(new HcDto(HcInChkDto.getpKey(), chkCount));
        	}else {

        	}
      	  
            System.out.println("입력 성공");
            return "redirect:photoInChkCrud.do?id="+HcInChkDto.getId()+"&pKey="+HcInChkDto.getpKey()+"&crud=content"+"&inChkDate="+HcInChkDto.getInChkDate();

         }else {
            System.out.println("입력 실패");
            model.addAttribute("msg","값 입력에 실패했습니다.");
            return "error";      
         }          
        
     }
	
	
	
	
    @RequestMapping(value = "/photoInChkDelete.do", method = RequestMethod.GET)
    public String photoInChkDelete(String id, String pKey, Locale locale, String paramview,  Model model){
		logger.info("photoInChkDelete {}.", locale);
  	  
        boolean isS=hcService.deleteHcUserInChk(new HcInChkDto(pKey,today ,id));


        if(isS==true) {
      	  
        	int beforeCount = 0;
        	List<HcInChkDto> beforeList =hcService.getHcInChk(new HcInChkDto(pKey, today));
        	for (int i = 0; i < beforeList.size(); i++) {
        		if (beforeList.get(i).getInChkPhoto().equals("/")) {
        			
        		}else {
        			beforeCount++;					
        		}
        	}                
        	
        	if((beforeCount/(double)beforeList.size()) < 0.6) {
        		boolean isS2=hcService.habitCalChkDelete(pKey, today);
        		int chkCount=hcService.habitCalChkCount(pKey);
        		hcService.updateChkCount(new HcDto(pKey, chkCount));
        		if(isS2==false) {
        			System.out.println("삭제 실패");
                    model.addAttribute("msg","값 삭제에 실패했습니다.");
                    return "error";      
        		}else {
        			System.out.println("삭제 성공");
        		}
        		
        	}else {

        	}
      	  
            System.out.println("삭제 성공");
            return "redirect:habitCalDetail.do?id="+id+"&pKey="+pKey;

         }else {
            System.out.println("입력 실패");
            model.addAttribute("msg","값 입력에 실패했습니다.");
            return "error";      
         }          
        
     }    

      
      @RequestMapping(value = "/photoInChkUpdate.do", method = RequestMethod.POST)
      public String photoInChkUpdate(HcInChkDto HcInChkDto, Locale locale, Model model) throws Exception{
    	  

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
        	  System.out.println("업데이트 성공");
              return "redirect:photoInChkCrud.do?id="+HcInChkDto.getId()+"&pKey="+HcInChkDto.getpKey()+"&crud=content"+"&inChkDate="+HcInChkDto.getInChkDate();
          }else {
        	  System.out.println("업데이트 실패");
        	  model.addAttribute("msg","업데이트에 실패했습니다.");
        	  return "error";           
          }          
      }
      
      

      @ResponseBody
      @RequestMapping(value = "/ajaxCheck.do", method = RequestMethod.GET)
      public Map<String, Integer> ajaxCheck(String id, Locale locale, Model model){   
    	  List<HcDto> list1=hcService.getAllList(id);
    	  Map<String, Integer> map = new HashMap<String, Integer>();
    	  map.put("count", list1.size());   

          return map;    	  
      }
      
//    아이디 찾기
    @RequestMapping(value = "/findId.do", method = RequestMethod.GET)
    public String findId(Locale locale) {
          logger.info("아이디찾기 {}.", locale);

          return "findId";
       }
    
    @RequestMapping(value = "/findId_after.do", method = RequestMethod.POST)
    public String findId(String name, String phone,Locale locale,Model model) {
       logger.info("아이디 찾기 {}.", locale);
       System.out.println("아이디 찾기");
       System.out.println(hcService.findId(name, phone));
       if(hcService.findId(name, phone)==null) {
          System.out.println("아이디 찾기 실패");
           model.addAttribute("msg","이름과 번호가 일치하지 않습니다.");
           return "error";   
       }else {
          HcLoginDto dto = hcService.findId(name, phone);
          model.addAttribute("dto",dto);
       return "findIdAfter";
       }
    }
    
//    비밀번호찾기
    //본인확인 화면 이동
    @RequestMapping(value = "/findPw_identi.do", method = RequestMethod.GET)
    public String findPw(Locale locale) {
          logger.info("본인확인 {}.", locale);
          return "findPwIdenti";
       }
    //비밀번호 찾기 전 본인확인 및 아이디가 일치하는 질문 출력 답변 입력
    @RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
    public String findPw(String id, String phone,Locale locale,Model model) {
       logger.info("비밀번호 찾기 질문 {}.", locale);
       
       //아이디, 번호 일치 검사
       if(hcService.findPw(id, phone)==null) {
          System.out.println("비밀번호찾기 본인인증 실패");
          model.addAttribute("msg","아이디와 번호를 다시 확인해주세요.");
          return "error";
       }else {
          HcLoginDto dto = hcService.findPw(id, phone);
          //아이디에 맞는 질문 출력
          System.out.println("dto.getId():"+dto.getId());
          HcLoginDto dto_find=hcService.findPw_find(dto.getId());
          System.out.println("dto_find"+dto_find);
          model.addAttribute("dto_find",dto_find.getQuestion());
          return "findPw";
       }
    }
    
    //입력한 답변이 질문과 일치 하는지 검사하고 일치하면 비밀번호 출력
    @RequestMapping(value = "/findPw_After.do", method = RequestMethod.POST)
    public String findPw_After(HttpServletRequest httpServletRequest,Locale locale,Model model) {
       logger.info("비밀번호 찾기 {}.", locale);
       String question = httpServletRequest.getParameter("question");
       String answer = httpServletRequest.getParameter("answer");
       System.out.println("question:"+question);
       System.out.println("answer:"+answer);
       //답변 일치 검사
       if(hcService.findPw_After(question,answer)==null) {
          System.out.println("답변 불일치");
          model.addAttribute("msg","답변을 확인해주세요");
          return "error";
       }else {
          HcLoginDto dto = hcService.findPw_After(question,answer);
          model.addAttribute("dto",dto);
          return "findPwAfter";
       }
    }
    
		//검색하기
		@RequestMapping(value = "/search1.do", method = RequestMethod.GET)
		public ModelAndView search1(String select1,String input2, String withh, Locale locale) {
			logger.info("search1 {}.", locale);
			ModelAndView view = new ModelAndView();
			System.out.println("select1:"+select1);
			System.out.println("input2:"+input2);

			
			if(select1.equals("ID")) {
		    	List<HcDto> list1=hcService.getSearchID(input2,withh);
				view.addObject("list1",list1);
				if (withh=="Y") {
					view.setViewName("boardListWith");						
				} else {
					view.setViewName("boardListAlone");
				}

			}else if(select1.equals("Title")) {
				List<HcDto> list1=hcService.getSearchTitle(input2,withh);
				view.addObject("list1",list1);
				if (withh=="Y") {
					view.setViewName("boardListWith");						
				} else {
					view.setViewName("boardListAlone");
				}
			}else if(select1.equals("Term")) {
				List<HcDto> list1=hcService.getSearchTerm(input2,withh);
				view.addObject("list1",list1);
				if (withh=="Y") {
					view.setViewName("boardListWith");						
				} else {
					view.setViewName("boardListAlone");
				}
			}else if(select1.equals("Start")) {
				List<HcDto> list1=hcService.getSearchStartDate(input2,withh);
				view.addObject("list1",list1);
				if (withh=="Y") {
					view.setViewName("boardListWith");						
				} else {
					view.setViewName("boardListAlone");
				}
			}
			
			return view;
		}
		
		//랭킹보기
	    @RequestMapping(value = "/boardlistWithRanking.do", method = RequestMethod.GET)
	    public ModelAndView boardlistWithRanking(Locale locale, Model model) {
	       logger.info("boardlistWithRanking {}.", locale);
	       ModelAndView view = new ModelAndView();
	       
	      	 List<HcDto> list=hcService.boardlistWithRanking();
	      	 System.out.println("list:"+list);
	      	System.out.println("listsize:"+list.size());
	      	System.out.println("today.substring(0, 6):"+today.substring(0, 6));
	      	
	      	 for (int i = 0; i < list.size(); i++) {
	      		 System.out.println(i+"번쨰"+list.get(i).getEdDate().substring(0, 6));
	      		if(list.get(i).getEdDate().substring(0, 6).equals(today.substring(0, 6))){
	      			
	      		}else {
	      			list.remove(i);
	      		}
			}
	      	 
	      	 view.addObject("list",list);
	      	 view.setViewName("boardlistWithRanking");

	       return view;
	    } 			
		
    
	}