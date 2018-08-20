package com.hk.toCheckFinal;


import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;
import com.hk.toCheckFinal.service.IHcService;
import com.hk.toCheckFinal.utils.Util;


/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginId")
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@Autowired
	private IHcService hcService;



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
	
	
	@RequestMapping(value = "/login_after.do", method = RequestMethod.POST)
	public String login_after(HcLoginDto dto, Locale locale, Model model,SessionStatus session) {
		logger.info("로그인 진행중 {}.", locale);
		System.out.println(dto);
		

		model.addAttribute("loginId", dto.getId());
		
		HcLoginDto HcLoginDto= hcService.getLogin(dto.getId(), dto.getPassword());
		
		
		if(HcLoginDto!=null){

			if(HcLoginDto.getEnabled().toLowerCase().equals("y")){
				
				return "redirect:main.do?id="+dto.getId()+"&role="+HcLoginDto.getRole();

			}else{
				model.addAttribute("msg","아이디와 패스워드를 확인하세요!탈퇴한 계정");
				return "error";
			}
					
		}else{
			model.addAttribute("msg","아이디와 패스워드를 확인하세요!아이디가 없거나 패스워드가 틀림");
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
				System.out.println("ddd12");
				List<HcDto> list=hcService.getAllList(id);
				System.out.println(list);
				
				
				int xsize=0;
				for (int i = 0; i < list.size(); i++) {
					HcDto dto=list.get(i);
					if(dto.getEndList().toUpperCase().equals("N")){
						++xsize;
					}
				}
				
				view.setViewName("usermain");
				view.addObject("xsize",xsize);
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
		public String selectform(String id, Locale locale, Model model) {
			logger.info("함께 혼자 목록 {}.", locale);
		
			model.addAttribute("id", id);
			
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
				return "redirect:habitCalDetail.do?id="+HcDto.getId()+"&pKey="+HcDto.getpKey();
			}else {
				model.addAttribute("msg","실패 했습니다.!");
				return "error";
			}
			
		}					
		
		@RequestMapping(value = "/habitCalDetail.do", method = RequestMethod.GET)
		public ModelAndView habitCalInsert(String id, String pKey,Locale locale) {
			logger.info("상세보기 {}.", locale);
			
			ModelAndView view = new ModelAndView();
			Map<String, Integer> map = new HashMap<String, Integer>();
			
			HcDto dto = hcService.getHabitCalList(pKey);
			HcLoginDto HcLoginDto= hcService.getUser(id);
			System.out.println(dto);

			String sYear=dto.getStDate().substring(0,4);
			int stYear=Integer.parseInt(sYear);
			
			String sMonth=dto.getStDate().substring(4,6);
			int stMonth=Integer.parseInt(sMonth);		
			
			String sDate=dto.getStDate().substring(6);
			int stDate=Integer.parseInt(sDate);		

			
			
			String eYear=dto.getEdDate().substring(0,4);
			int edYear=Integer.parseInt(eYear);
			
			String eMonth=dto.getEdDate().substring(4,6);
			int edMonth=Integer.parseInt(eMonth);
			
			String eDate=dto.getEdDate().substring(6);
			int edDate=Integer.parseInt(eDate);				
			
			
			int term=Integer.parseInt(dto.getTerm());

					
			
			String []chkss=dto.getChks().split("/");
			
			map.put("stYear", stYear);	
			map.put("stMonth", stMonth);	
			map.put("stDate", stDate);	
			map.put("edYear", edYear);	
			map.put("edMonth", edMonth);	
			map.put("edDate", edDate);	
			map.put("term", term);			
			
			view.setViewName("habitCalDetail");
			view.addObject("id",id);
			view.addObject("pKey",pKey);
			
			view.addObject("chkss",chkss);			
			view.addObject("dto",dto);	
			view.addObject("HcLoginDto",HcLoginDto);	
			view.addObject("map",map);
			
			return view;			

		}
			
		
		@RequestMapping(value = "/habitCalDelete.do", method = RequestMethod.GET)
		public String selectform(String pKey, String id, Locale locale, Model model) {
			logger.info("삭제 하기 {}.", locale);
		
			HcDto dto = hcService.getHabitCalList(pKey);
			HcLoginDto HcLoginDto= hcService.getUser(id);
			String nory=dto.getEndList();
			boolean isS  = hcService.habitCalDelete(pKey);
				
			
			
			if(isS){

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
		public String selectform(String pKey, String id, String[] chk, String switchCheck, Locale locale, Model model) {
			logger.info("체크 하기 {}.", locale);
		
			HcLoginDto HcLoginDto= hcService.getUser(id);
			String chks="";
			int chkss=0;
			if(switchCheck==null) {
				switchCheck="N";
				System.out.println(switchCheck);
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
					
					
					int xsize=0;
					for (int i = 0; i < list.size(); i++) {
						HcDto dto=list.get(i);
						if(dto.getEndList().toUpperCase().equals("Y")){
							++xsize;
						}
					}
					
					view.setViewName("habitCalCompleteList");
					view.addObject("xsize",xsize);
					view.addObject("list",list);
					view.addObject("HcLoginDto",HcLoginDto);
					return view;
					

		}	

		
		@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
		public ModelAndView boardlist(String id, Locale locale, Model model) {
			logger.info("함께 혼자 목록 {}.", locale);
			ModelAndView view = new ModelAndView();
			
			
			List<HcDto> list=hcService.getAllHcList();
			
			
			view.setViewName("boardlist");
			view.addObject("list",list);
			view.addObject("id",id);

			return view;
		}			
		
			
	
}
