package com.hk.toCheckFinal.service;

import java.util.List;

import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;
import com.hk.toCheckFinal.dtos.HcWithDto;

public interface IHcService {

<<<<<<< HEAD
   public boolean habitCalInsert(HcDto dto);
   
   public HcDto getHabitCalList(String pKey);
   
   public boolean updateCheck(HcDto dto);
   
   public boolean updateIntoper(HcDto dto);
   
   
   public List<HcDto> getAllList(String id);
   public boolean habitCalDelete(String pKey);
   public boolean updateEndList(HcDto dto);
   public List<HcDto> getAllHcList();
   public List<HcDto> getAllHcListY();
   public List<HcDto> searchContentId(String searchContent);
   public List<HcDto> searchContentTitle(String searchContent);
   
   
   public boolean insertCalWith(HcWithDto HcWithDto);
   public HcWithDto getCalWith(String id);
   public boolean updateCalWith(HcWithDto HcWithDto);
   
   
   
   public HcLoginDto idChk(String id);
   public boolean insertUser(HcLoginDto dto);
   public HcLoginDto getLogin(String id, String password);
   public HcLoginDto getUser(String id);
   public boolean updateUser(HcLoginDto dto);
   public boolean deleUser(String id);
   public List<HcLoginDto> getAllUser();
   public boolean updateRoleUser(String id, String role,String enabled);
   
}
=======
	public boolean habitCalInsert(HcDto dto);
	
	public HcDto getHabitCalList(String pKey);
	
	public boolean updateCheck(HcDto dto);
	
	public boolean updateIntoper(HcDto dto);
	
	
	public List<HcDto> getAllList(String id);
	public boolean habitCalDelete(String pKey);
	public boolean updateEndList(HcDto dto);
	public List<HcDto> getAllHcList();
	public List<HcDto> getAllHcListY();
	public List<HcDto> searchContentId(String searchContent);
	public List<HcDto> searchContentTitle(String searchContent);
	
	
	public boolean insertCalWith(HcWithDto HcWithDto);
	public HcWithDto getCalWith(String id);
	public boolean updateCalWith(HcWithDto HcWithDto);
	
	
	
	public boolean insertHcInChk(HcInChkDto HcInChkDto);
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto);
	public boolean updateHcInChk(HcInChkDto HcInChkDto);	
	public boolean deleteHcInChk(String pKey);	
	
	
	
	
	public HcLoginDto idChk(String id);
	public boolean insertUser(HcLoginDto dto);
	public HcLoginDto getLogin(String id, String password);
	public HcLoginDto getUser(String id);
	public boolean updateUser(HcLoginDto dto);
	public boolean deleUser(String id);
	public List<HcLoginDto> getAllUser();
	public boolean updateRoleUser(String id, String role,String enabled);
	
}
>>>>>>> branch 'master' of https://github.com/772vjrvj/tochecktest.git
