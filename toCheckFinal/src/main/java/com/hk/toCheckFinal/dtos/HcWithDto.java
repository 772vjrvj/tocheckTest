package com.hk.toCheckFinal.dtos;

public class HcWithDto {

	private String id; //작성자 아이디1
	private String withGoalList; //함께 참여중인 목록 리스트 
	
	
	public HcWithDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	public HcWithDto(String id, String withGoalList) {
		super();
		this.id = id;
		this.withGoalList = withGoalList;
	}



	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getWithGoalList() {
		return withGoalList;
	}


	public void setWithGoalList(String withGoalList) {
		this.withGoalList = withGoalList;
	}


	@Override
	public String toString() {
		return "HcWithDto [id=" + id + ", withGoalList=" + withGoalList + "]";
	}
	
	
	
	
}
