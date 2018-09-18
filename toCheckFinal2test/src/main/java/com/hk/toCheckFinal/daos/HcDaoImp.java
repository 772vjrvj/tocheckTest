package com.hk.toCheckFinal.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.toCheckFinal.dtos.HcChkDto;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;

@Repository
public class HcDaoImp implements IHcDao {
   
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="com.hk.toCheckFinal.";   
   
	//습관달력 만들기 값 입력 habitCalInsert
	@Override
	public boolean habitCalInsert(HcDto HcDto) {
		int count=0;
		count=sqlSession.insert(namespace+"habitCalInsert", HcDto);
		return count>0?true:false;
	}

	//sort업데이트 방금 본걸 main에서 맨 앞화면으로 보려고
	public boolean updateSort(String sort, String pKey) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "sort", sort );
		map.put( "pKey", pKey );
		int count=0;
		count =sqlSession.update(namespace+"updateSort", map);
		return count>0?true:false;		
	}
	
	
	
	//참가하기 인원 받기
	@Override
	public int habitCalIntoPerCount(String intoper) {
		int intoper1=sqlSession.selectOne(namespace+"habitCalIntoPerCount", intoper);
		return intoper1;
	}

	//체크 값 입력
	@Override	
	public boolean habitCalInsertChk(String pKey,String chk) {
		System.out.println("pKey:"+pKey);
		System.out.println("chk:"+chk);

		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "chk", chk );
		int count=0;
		count =sqlSession.insert(namespace+"habitCalInsertChk", map);
		return count>0?true:false;
	}

	//혼자하기 공개 비공개 여부
	@Override
	public boolean updateCalWith(HcDto HcDto) {
		int count=0;
		count =sqlSession.update(namespace+"updateCalWith", HcDto);
		return count>0?true:false;		
	}
	
	//회원가입
	@Override
    public boolean insertUser(HcLoginDto dto) {
       int count = 0;
       count=sqlSession.insert(namespace+"insertUser", dto);
       return count>0?true:false;
    }
	
	//로그인
	@Override
	public HcLoginDto getLogin(String id, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "id", id );
		map.put( "password", password );
		return sqlSession.selectOne(namespace+"getLogin",map);
	}
	
	//유저 정보 얻기
	@Override
	public HcLoginDto getUser(String id) {
		return sqlSession.selectOne(namespace+"getUser", id);
	}
	
	//기간이 종료되지 않은 모든 유저들의 리스트
	@Override
	public List<HcDto> getAllListEvery() {
		List<HcDto>list=new ArrayList<HcDto>();
		System.out.println("DaogetAllListEvery");
		list=sqlSession.selectList(namespace+"getAllListEvery");
		System.out.println("list:"+list);
      
		return list;
	}   
	
    //리스트 종료(삭제아님)
	@Override
	public boolean updateEndList(HcDto dto) {
		int count=0;
		count=sqlSession.update(namespace+"updateEndList", dto);
		return count>0?true:false;
	}
	
	//로그인한 유저 한명의 종료되지 않은 리스트
	@Override
	public List<HcDto> getAllList(String id) {
		List<HcDto>list=new ArrayList<HcDto>();
		list=sqlSession.selectList(namespace+"getAllList",id);
	      
		return list;
	}
	
	//체크 갯수 세기
	@Override
	public int habitCalChkCount(String pKey) {
		int count=sqlSession.selectOne(namespace+"habitCalChkCount", pKey);
		return count;
	}
	
	//체크 값들 가저오기
	@Override
	public List<String> habitCalTakeChk(String pKey) {
		List<String>list=new ArrayList<String>();
		list=sqlSession.selectList(namespace+"habitCalTakeChk", pKey);
		System.out.println("list:"+ list);

		return list;
	}
	
	
	
	//유저 정보 변경
	@Override
	public boolean updateUser(HcLoginDto dto) {
		int count = 0;
		count=sqlSession.update(namespace+"updateUser", dto);
		return count > 0 ? true : false;
	}
	
	//탈퇴하기
	@Override
	public boolean deleUser(String id) {
		int count = 0;
		count=sqlSession.update(namespace+"deleUser", id);
		return count > 0 ? true : false;
	}
	
	//탈퇴한 아이디 리스트 지우기
	@Override
	public boolean deleList(String id) {
		int count = 0;
		count=sqlSession.update(namespace+"deleList", id);
		return count > 0 ? true : false;
	}	
	
	//모든 회원들의 '혼자' 하기 리스트 보기
	@Override
	public List<HcDto> getAllHcListAlone() {
		List<HcDto>list=new ArrayList<HcDto>();

		list=sqlSession.selectList(namespace+"getAllHcListAlone");
		return list;
	}
	
	//모든 회원들의 '함께' 하기 리스트 보기
	@Override
	public List<HcDto> getAllHcListWith() {
		List<HcDto>list=new ArrayList<HcDto>();

		list=sqlSession.selectList(namespace+"getAllHcListWith");
		return list;
	}   	
	

	//습관달력 한개 구하기
	@Override
	public HcDto getHabitCalListOne(String pKey,String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "id", id );	
		System.out.println("pKey"+ pKey+"id"+id);
	return sqlSession.selectOne(namespace+"getHabitCalListOne",map);

   }


	//습관달력 한개 구하기
	@Override
	public List<HcDto> getHabitCalList(String pKey) {
	   
	return sqlSession.selectList(namespace+"getHabitCalList",pKey);

   }   
   
	//참가한 사람 그 습관달력의 모든 기간에 대한 상세인증페이지 만들기
	@Override
	public boolean insertHcInChk(HcInChkDto HcInChkDto) {
		int count = 0;
		count=sqlSession.insert(namespace+"insertHcInChk", HcInChkDto);
		return count>0?true:false;      
	}   
   
	//해당 아이디 인증 페이지들 모두 삭제
	@Override
	public boolean deleteHcInChk(String pKey,String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "id", id );
		int count = 0;
		count=sqlSession.update(namespace+"deleteHcInChk", map);
		return count > 0 ? true : false;
	}
	
	//인증 페이지들 모두 삭제
	@Override
	public boolean deleteHcInChkAll(String pKey) {
		int count = 0;
		count=sqlSession.update(namespace+"deleteHcInChkAll", pKey);
		return count > 0 ? true : false;
	}	
	
	
   
	//해당 아이디 습관달력 삭제
	@Override
	public boolean habitCalDelete(String pKey,String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "id", id );
		int count=0;
		count=sqlSession.delete(namespace+"habitCalDelete",map);
		return count>0?true:false;
	}   

	//습관달력 삭제
	@Override
	public boolean habitCalDeleteAll(String pKey) {
		int count=0;
		count=sqlSession.delete(namespace+"habitCalDeleteAll",pKey);
		return count>0?true:false;
	}   	
	
	
	//종료일이 지난 모든 리스트들 가저오기
	@Override
	public List<HcDto> getAllListEndY(String id) {
		List<HcDto>list=new ArrayList<HcDto>();
		System.out.println("getAllListEndY");
		list=sqlSession.selectList(namespace+"getAllListEndY",id);
      
		return list;
	}   
   
	//인증값 가저오기
	@Override
	public HcInChkDto getHcUserInChk(HcInChkDto HcInChkDto){
		return sqlSession.selectOne(namespace+"getHcUserInChk",HcInChkDto);      
	}   


	//인증 삭제
	@Override
	public boolean deleteHcUserInChk(HcInChkDto HcInChkDto){
		int count = 0;
		count=sqlSession.update(namespace+"deleteHcUserInChk",HcInChkDto); 
		return count>0?true:false;        
	}      
	 

	//해당일 인증해야 하는 것들 다 가지고 오기
	@Override
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto){
		List<HcInChkDto>list=new ArrayList<HcInChkDto>();
		list=sqlSession.selectList(namespace+"getHcInChk",HcInChkDto);
		return list;      
	}

	//체크 삭제하기
	@Override
	public boolean habitCalChkDelete(String pKey,String chk) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "pKey", pKey );
		map.put( "chk", chk );
		int count = 0;
		count=sqlSession.delete(namespace+"habitCalChkDelete", map);
		return count > 0 ? true : false;		
	}
	
	
   

   
   @Override
   public boolean updateHcInChk(HcInChkDto HcInChkDto) {
      int count = 0;
      count=sqlSession.update(namespace+"updateHcInChk", HcInChkDto);
      return count > 0 ? true : false;
   }

   
   

   @Override
   public List<HcDto> searchContentId(String searchContent) {
      List<HcDto>list=new ArrayList<HcDto>();
      list=sqlSession.selectList(namespace+"searchContentId",searchContent);
      return list;
   }

   @Override
   public List<HcDto> searchContentTitle(String searchContent) {
      List<HcDto>list=new ArrayList<HcDto>();
      list=sqlSession.selectList(namespace+"searchContentTitle",searchContent);
      return list;
   }

   @Override
   public HcLoginDto idChk(String id) {
      Map<String, String>map= new HashMap<String, String>();
      map.put("id", id);
      return sqlSession.selectOne(namespace+"idChk", map);
   }


	//체크 갯수 업데이트
	public boolean updateChkCount(HcDto HcDto) {
	      int count = 0;
	      count=sqlSession.update(namespace+"updateChkCount", HcDto);
	      return count > 0 ? true : false;
	}   



   
   @Override   
   public List<HcLoginDto> getAllUser() {
      List<HcLoginDto> list = new ArrayList<HcLoginDto>();
      list=sqlSession.selectList(namespace+"getAllUser");   
      return list;
   }

   @Override
   public boolean updateRoleUser(String id, String role,String enabled) {
      Map<String, String> map = new HashMap<String, String>();
      int count = 0;
      map.put( "id", id );
      map.put( "role", role );
      map.put( "enabled", enabled );
      count=sqlSession.insert(namespace+"updateRoleUser", map);
      return count > 0 ? true : false;
   }

   
}