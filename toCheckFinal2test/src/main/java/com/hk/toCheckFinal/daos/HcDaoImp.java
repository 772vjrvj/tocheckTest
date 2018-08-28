package com.hk.toCheckFinal.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;
import com.hk.toCheckFinal.dtos.HcWithDto;

@Repository
public class HcDaoImp implements IHcDao {
   

   @Autowired
   private SqlSessionTemplate sqlSession;
   private String namespace="com.hk.toCheckFinal.";   
   

   @Override
   public boolean habitCalInsert(HcDto dto) {
      int count=0;
      count=sqlSession.insert(namespace+"habitCalInsert", dto);
      return count>0?true:false;
   }

   @Override
   public HcDto getHabitCalList(String pKey) {
      return sqlSession.selectOne(namespace+"getHabitCalList",pKey);

   }

   @Override
   public boolean updateCheck(HcDto dto) {
      int count=0;
      count=sqlSession.update(namespace+"updateCheck", dto);
      return count>0?true:false;      
   }

   @Override
   public boolean updateIntoper(HcDto dto) {
      int count=0;
      count=sqlSession.update(namespace+"updateIntoper", dto);
      return count>0?true:false;      
   }   

   
   @Override   
   public boolean insertCalWith(HcWithDto HcWithDto) {
      int count=0;
      System.out.println(HcWithDto+"ss");
      count=sqlSession.update(namespace+"insertCalWith", HcWithDto);
      return count>0?true:false;            
   }
   
   @Override   
   public HcWithDto getCalWith(String id){
      return sqlSession.selectOne(namespace+"getCalWith",id);
   }
   
   @Override   
   public boolean updateCalWith(HcWithDto HcWithDto) {
      int count=0;
      count=sqlSession.update(namespace+"updateCalWith", HcWithDto);
      return count>0?true:false;            
   }   
   
   
   
   @Override
   public List<HcDto> getAllList(String id) {
      List<HcDto>list=new ArrayList<HcDto>();
      System.out.println("ddd");
      list=sqlSession.selectList(namespace+"getAllList",id);
      
      System.out.println(list);
      return list;
   }

   @Override
   public boolean habitCalDelete(String pKey) {

      int count=0;
      count=sqlSession.delete(namespace+"habitCalDelete",pKey);
      return count>0?true:false;
   }

   @Override
   public boolean updateEndList(HcDto dto) {
      int count=0;
      Map<String, String> map = new HashMap<String, String>();

      if(dto.getEndList().equals("N")) {               
         dto.setEndList("Y");
      }else {
         dto.setEndList("N");
      }
         count=sqlSession.update(namespace+"updateEndList", dto);
      return count>0?true:false;
   }

   @Override
   public List<HcDto> getAllHcList() {
      List<HcDto>list=new ArrayList<HcDto>();

      list=sqlSession.selectList(namespace+"getAllHcList");
      return list;
   }
   @Override
   public List<HcDto> getAllHcListY() {
      List<HcDto>list=new ArrayList<HcDto>();

      list=sqlSession.selectList(namespace+"getAllHcListY");
      return list;
   }   
   
   

   @Override
   public boolean insertHcInChk(HcInChkDto HcInChkDto) {
      int count = 0;
      count=sqlSession.insert(namespace+"insertHcInChk", HcInChkDto);
      return count>0?true:false;      
   }
   @Override
   public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto){
      List<HcInChkDto>list=new ArrayList<HcInChkDto>();
      list=sqlSession.selectList(namespace+"getHcInChk",HcInChkDto);
      return list;      
   }
   @Override
   public HcInChkDto getHcUserInChk(HcInChkDto HcInChkDto){
      return sqlSession.selectOne(namespace+"getHcUserInChk",HcInChkDto);      
   }   
   
   @Override
   public boolean deleteHcUserInChk(HcInChkDto HcInChkDto){
	   int count = 0;
	   count=sqlSession.update(namespace+"deleteHcUserInChk",HcInChkDto); 
	   return count>0?true:false;        
   }      
 
   
   @Override
   public boolean updateHcInChk(HcInChkDto HcInChkDto) {
      int count = 0;
      count=sqlSession.update(namespace+"updateHcInChk", HcInChkDto);
      return count > 0 ? true : false;
   }
   @Override
   public boolean deleteHcInChk(String pKey) {
      int count = 0;
      count=sqlSession.update(namespace+"deleteHcInChk", pKey);
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

//insertUser
   @Override
   public boolean insertUser(HcLoginDto dto) {
      int count = 0;
      count=sqlSession.insert(namespace+"insertUser", dto);
      return count>0?true:false;
   }

   @Override
   public HcLoginDto getLogin(String id, String password) {
      System.out.println(id+password);
      Map<String, String> map = new HashMap<String, String>();
      map.put( "id", id );
      map.put( "password", password );
      return sqlSession.selectOne(namespace+"getLogin",map);
   }

   @Override
   public HcLoginDto getUser(String id) {
      return sqlSession.selectOne(namespace+"getUser", id);
   }

   @Override
   public boolean updateUser(HcLoginDto dto) {
      int count = 0;
      count=sqlSession.update(namespace+"updateUser", dto);
      return count > 0 ? true : false;
   }

   @Override
   public boolean deleUser(String id) {
      int count = 0;
      count=sqlSession.update(namespace+"deleUser", id);
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