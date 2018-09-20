package com.hk.toCheckFinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.toCheckFinal.daos.IHcDao;
import com.hk.toCheckFinal.dtos.HcChkDto;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;

@Service
public class HcServiceImp implements IHcService {

   @Autowired
   private IHcDao hcDao;   
   

	//습관달력 만들기 값 입력 habitCalInsert
	@Override
	public boolean habitCalInsert(HcDto dto) {
		return hcDao.habitCalInsert(dto);
	}

	//sort업데이트 방금 본걸 main에서 맨 앞화면으로 보려고
	@Override
	public boolean updateSort(String sort, String pKey) {
		return hcDao.updateSort(sort,pKey);
	}
	
	
	//참가자 인원 받기
	@Override
	public int habitCalIntoPerCount(String intoper) {
		return hcDao.habitCalIntoPerCount(intoper);
	}
	
	
	//체크 값 입력
	@Override	
	public boolean habitCalInsertChk(String pKey,String chk) {
		return hcDao.habitCalInsertChk(pKey,chk);
	}	
	
	//혼자하기 공개 비공개 여부
	@Override
	public boolean updateCalWith(HcDto HcDto) {
		return hcDao.updateCalWith(HcDto);
	
	}
	
	//회원가입
    @Override
    public boolean insertUser(HcLoginDto dto) {
       return hcDao.insertUser(dto);
    }
	
    
    //로그인
    @Override
    public HcLoginDto getLogin(String id, String password) {
       return hcDao.getLogin(id, password);
    }

    //유저정보얻기
    @Override
    public HcLoginDto getUser(String id) {
       return hcDao.getUser(id);
    }
    
    //기간이 종료되지 않은 모든 유저들의 리스트
    @Override
    public List<HcDto> getAllListEvery(){
    	System.out.println("HcServicegetAllListEvery");
 	   return hcDao.getAllListEvery();
    }
    
    //리스트 종료(삭제아님)
    @Override
    public boolean updateEndList(HcDto dto) {
       return hcDao.updateEndList(dto);
    }
    
    //로그인한 유저 한명의 종료되지 않은 리스트
    @Override
    public List<HcDto> getAllList(String id) {
       return hcDao.getAllList(id);
    }
    
	//참자가 인원세기
    @Override
	public int habitCalChkCount(String pKey) {
    	return hcDao.habitCalChkCount(pKey);
    }
    
    //유저 정보 변경
    @Override
    public boolean updateUser(HcLoginDto dto) {
       return hcDao.updateUser(dto);
    }
    
    //탈퇴하기
    @Override
    public boolean deleUser(String id) {
       return hcDao.deleUser(id);
    }

	//탈퇴한 아이디 리스트 지우기
	@Override
	public boolean deleList(String id) {
		return hcDao.deleList(id);
	}	    
    
	//모든 회원들의 '혼자' 하기 리스트 보기
	@Override
		public List<HcDto> getAllHcListAlone() {
		return hcDao.getAllHcListAlone();
	}
	
	//모든 회원들의 '함께' 하기 리스트 보기
	@Override
		public List<HcDto> getAllHcListWith() {
		return hcDao.getAllHcListWith();
	}
	
    
	//습관달력 한개 구하기
	@Override
	public HcDto getHabitCalListOne(String pKey,String id) {
		System.out.println("pKey"+ pKey+"id"+id);
		return hcDao.getHabitCalListOne(pKey,id);
	}

	//체크 값들 가저오기
	@Override
	public List<String> habitCalTakeChk(String pKey){
		return hcDao.habitCalTakeChk(pKey);
	}

	//참가한 사람 그 습관달력의 모든 기간에 대한 상세인증페이지 만들기
	@Override
	public boolean insertHcInChk(HcInChkDto HcInChkDto) {
      
		return hcDao.insertHcInChk(HcInChkDto);
	}	

	//해당 아이디 인증 페이지들 모두 삭제
	@Override   
	public boolean deleteHcInChk(String pKey,String id) {
		return hcDao.deleteHcInChk(pKey,id);
	}
	
	//인증 페이지들 모두 삭제
	@Override   
	public boolean deleteHcInChkAll(String pKey) {
		return hcDao.deleteHcInChkAll(pKey);		
		
		}
	
	//해당 아이디 습관달력 삭제
	@Override
	public boolean habitCalDelete(String pKey,String id) {
		return hcDao.habitCalDelete(pKey,id);
	}	

	//습관달력 전부 삭제
	@Override
	public boolean habitCalDeleteAll(String pKey) {
		return hcDao.habitCalDeleteAll(pKey);
	}	
		
	
	//종료일이 지난 모든 리스트들 가저오기
	@Override
	public List<HcDto> getAllListEndY(String id) {
		return hcDao.getAllListEndY(id);
	}	
	
	//인증값 가저오기
	@Override
	public HcInChkDto getHcUserInChk(HcInChkDto HcInChkDto){
	      
		return hcDao.getHcUserInChk(HcInChkDto);
	}   	
	
	//pKey가 같은 습관달력들 구하기
	public List<HcDto> getHabitCalList(String pKey){
		return hcDao.getHabitCalList(pKey);
	}
	
	//인증삭제하기
	@Override
	public boolean deleteHcUserInChk(HcInChkDto HcInChkDto){
	      
		return hcDao.deleteHcUserInChk(HcInChkDto);
	}      	
   
	//해당일 인증해야 하는 것들 다 가지고 오기	
	@Override
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto){
		      
		return hcDao.getHcInChk(HcInChkDto);
	}

	//체크 삭제하기
	@Override
	public boolean habitCalChkDelete(String pKey,String chk) {
	      return hcDao.habitCalChkDelete(pKey,chk);
		
	}
	
	//체크 갯수 업데이트
	public boolean updateChkCount(HcDto HcDto) {
		return hcDao.updateChkCount(HcDto);
	}
	
	
	@Override
	public boolean updateHcInChk(HcInChkDto HcInChkDto) {
	      
		return hcDao.updateHcInChk(HcInChkDto);
	}
	
	
	
   @Override
   public List<HcDto> searchContentId(String searchContent) {
      return hcDao.searchContentId(searchContent);
   }

   @Override
   public List<HcDto> searchContentTitle(String searchContent) {
      return hcDao.searchContentTitle(searchContent);
   }

   @Override
   public HcLoginDto idChk(String id) {
      return hcDao.idChk(id);
   }


   



   
   
   


   

   
   

   
//insertUser   



   @Override
   public List<HcLoginDto> getAllUser() {
      return hcDao.getAllUser();
   }

   @Override
   public boolean updateRoleUser(String id, String role, String enabled) {
      return hcDao.updateRoleUser(id, role, enabled);
   }
   
   //아이디 찾기 
   @Override
   public HcLoginDto findId(String name, String phone) {
      return hcDao.findId(name, phone);
   }
   
   //비밀번호찾기 본인인증
   @Override
   public HcLoginDto findPw(String id, String phone) {
      return hcDao.findPw(id, phone);
   }
   
   //비밀번호 찾기 아이디에 맞는 질문 가저오기
   @Override
   public HcLoginDto findPw_find(String id) {
      return hcDao.findPw_find(id);
   }
   //비밀번호찾기 질문에 일치하는 답변이지 검사해서 비밀번호 출력하기
   @Override
   public HcLoginDto findPw_After(String question,String answer) {
      return hcDao.findPw_After(question, answer);
   }
   
   
   //아이디 검색
   public List<HcDto> getSearchID(String searchId, String withh){
	   return hcDao.getSearchID(searchId,withh);
   }
   
   //제목 검색
   public List<HcDto> getSearchTitle(String searchTitle, String withh){
	   return hcDao.getSearchTitle(searchTitle,withh);
   }
   
   //기간 검색
   public List<HcDto> getSearchTerm(String searchTerm, String withh){
	   return hcDao.getSearchTerm(searchTerm,withh);
   }

   //시작일 검색
   public List<HcDto> getSearchStartDate(String searchStartDate, String withh){
	   return hcDao.getSearchStartDate(searchStartDate,withh);
   }
   
	//랭킹
	public List<HcDto> boardlistWithRanking(){
		   return hcDao.boardlistWithRanking();

	}

}