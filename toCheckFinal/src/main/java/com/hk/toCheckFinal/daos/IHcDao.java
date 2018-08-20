package com.hk.toCheckFinal.daos;


import java.util.List;

import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;

public interface IHcDao {

	
	public boolean habitCalInsert(HcDto dto);
	
	public HcDto getHabitCalList(String pKey);
	public boolean updateCheck(HcDto dto);
	public List<HcDto> getAllList(String id);
	public boolean habitCalDelete(String pKey);
	public boolean updateEndList(HcDto dto);
	public List<HcDto> getAllHcList();
	public List<HcDto> getAllHcListY();
	public List<HcDto> searchContentId(String searchContent);
	public List<HcDto> searchContentTitle(String searchContent);
	
	
	public HcLoginDto idChk(String id);
	public boolean insertUser(HcLoginDto dto);
	public HcLoginDto getLogin(String id, String password);
	public HcLoginDto getUser(String id);
	public boolean updateUser(HcLoginDto dto);
	public boolean deleUser(String id);
	public List<HcLoginDto> getAllUser();
	public boolean updateRoleUser(String id, String role,String enabled);
	
}
