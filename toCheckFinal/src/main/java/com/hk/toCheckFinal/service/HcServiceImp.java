package com.hk.toCheckFinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.toCheckFinal.daos.IHcDao;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;
import com.hk.toCheckFinal.dtos.HcWithDto;

@Service
public class HcServiceImp implements IHcService {

   @Autowired
   private IHcDao hcDao;   
   
   @Override
   public boolean habitCalInsert(HcDto dto) {
      return hcDao.habitCalInsert(dto);
   }

   @Override
   public HcDto getHabitCalList(String pKey) {
      return hcDao.getHabitCalList(pKey);
   }

   @Override
   public boolean updateCheck(HcDto dto) {
      return hcDao.updateCheck(dto);
   }

<<<<<<< HEAD
   @Override
   public boolean updateIntoper(HcDto dto) {
      return hcDao.updateIntoper(dto);
   }   
   
=======
	@Override
	public boolean updateIntoper(HcDto dto) {
		return hcDao.updateIntoper(dto);
	}	
	
	@Override
>>>>>>> branch 'master' of https://github.com/772vjrvj/tochecktest.git

   public boolean updateCalWith(HcWithDto HcWithDto) {
      return hcDao.updateCalWith(HcWithDto);

<<<<<<< HEAD
   }
   
   
   
   public boolean insertCalWith(HcWithDto HcWithDto) {
      return hcDao.insertCalWith(HcWithDto);
   }
   
   public HcWithDto getCalWith(String id){
      return hcDao.getCalWith(id);
   }
   
   
   
   @Override
   public List<HcDto> getAllList(String id) {
      return hcDao.getAllList(id);
   }
=======
	}
	
	
	@Override
	
	public boolean insertCalWith(HcWithDto HcWithDto) {
		return hcDao.insertCalWith(HcWithDto);
	}
	@Override
	
	public HcWithDto getCalWith(String id){
		return hcDao.getCalWith(id);
	}
	
	
	
	@Override
	public List<HcDto> getAllList(String id) {
		return hcDao.getAllList(id);
	}
>>>>>>> branch 'master' of https://github.com/772vjrvj/tochecktest.git

   @Override
   public boolean habitCalDelete(String pKey) {
      return hcDao.habitCalDelete(pKey);
   }

   @Override
   public boolean updateEndList(HcDto dto) {
      return hcDao.updateEndList(dto);
   }

   @Override
   public List<HcDto> getAllHcList() {
      return hcDao.getAllHcList();
   }

   @Override
   public List<HcDto> getAllHcListY() {
      return hcDao.getAllHcListY();
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

<<<<<<< HEAD
//insertUser   
   @Override
   public boolean insertUser(HcLoginDto dto) {
      return hcDao.insertUser(dto);
   }
=======
	@Override
	
	public boolean insertHcInChk(HcInChkDto HcInChkDto) {
		
		return hcDao.insertHcInChk(HcInChkDto);
	}
	@Override
	
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto){
		
		return hcDao.getHcInChk(HcInChkDto);
	}
	@Override
	
	public boolean updateHcInChk(HcInChkDto HcInChkDto) {
		
		return hcDao.updateHcInChk(HcInChkDto);
	}
	
	
	public boolean deleteHcInChk(String pKey) {
		return hcDao.deleteHcInChk(pKey);

	}

	
	
//insertUser	
	@Override
	public boolean insertUser(HcLoginDto dto) {
		return hcDao.insertUser(dto);
	}
>>>>>>> branch 'master' of https://github.com/772vjrvj/tochecktest.git

   
   @Override
   public HcLoginDto getLogin(String id, String password) {
      return hcDao.getLogin(id, password);
   }

   @Override
   public HcLoginDto getUser(String id) {
      return hcDao.getUser(id);
   }

   @Override
   public boolean updateUser(HcLoginDto dto) {
      return hcDao.updateUser(dto);
   }

   @Override
   public boolean deleUser(String id) {
      return hcDao.deleUser(id);
   }

   @Override
   public List<HcLoginDto> getAllUser() {
      return hcDao.getAllUser();
   }

   @Override
   public boolean updateRoleUser(String id, String role, String enabled) {
      return hcDao.updateRoleUser(id, role, enabled);
   }

}