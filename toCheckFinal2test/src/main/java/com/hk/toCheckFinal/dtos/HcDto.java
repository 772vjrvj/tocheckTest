package com.hk.toCheckFinal.dtos;

public class HcDto {
	
	private String pKey; //식별키
	private String id; //작성자 아이디
	private String title; //목표 제목
	private String content; //목표 상세내용
	private String stDate; //시작일
	private String edDate; //종료일
	private String term; //진행기간
	private String regdate; // 작성일
	private String endList; //완료 여부
	private String calWith; // 목표 공유하기
	private String withh; //함께하기 여부
	private String progress; //진행 여부
	private int recruit; //모집 인원
	private String photo; //사진이름
	private String host; //방장이름
	private String hcDelete; //삭제여부
	private int chkCount; //체크 갯수 세기
	private String sort; //좀전에 봤던게 main에 나오게 하도록 하기 위한 순서
	
	public HcDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	
	
	public HcDto(String pKey, String id, String title, String content, String stDate, String edDate, String term,
			String regdate, String endList, String calWith, String withh, String progress, int recruit, String photo,
			String host, String hcDelete, int chkCount, String sort) {
		super();
		this.pKey = pKey;
		this.id = id;
		this.title = title;
		this.content = content;
		this.stDate = stDate;
		this.edDate = edDate;
		this.term = term;
		this.regdate = regdate;
		this.endList = endList;
		this.calWith = calWith;
		this.withh = withh;
		this.progress = progress;
		this.recruit = recruit;
		this.photo = photo;
		this.host = host;
		this.hcDelete = hcDelete;
		this.chkCount = chkCount;
		this.sort = sort;
	}


	public HcDto(String pKey, String calWith) {
		super();
		this.pKey = pKey;
		this.calWith = calWith;
	}


	public HcDto(String pKey, int chkCount) {
		super();
		this.pKey = pKey;
		this.chkCount = chkCount;
	}





	public String getpKey() {
		return pKey;
	}





	public void setpKey(String pKey) {
		this.pKey = pKey;
	}





	public String getId() {
		return id;
	}





	public void setId(String id) {
		this.id = id;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public String getContent() {
		return content;
	}





	public void setContent(String content) {
		this.content = content;
	}





	public String getStDate() {
		return stDate;
	}





	public void setStDate(String stDate) {
		this.stDate = stDate;
	}





	public String getEdDate() {
		return edDate;
	}





	public void setEdDate(String edDate) {
		this.edDate = edDate;
	}





	public String getTerm() {
		return term;
	}





	public void setTerm(String term) {
		this.term = term;
	}





	public String getRegdate() {
		return regdate;
	}





	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}





	public String getEndList() {
		return endList;
	}





	public void setEndList(String endList) {
		this.endList = endList;
	}





	public String getCalWith() {
		return calWith;
	}





	public void setCalWith(String calWith) {
		this.calWith = calWith;
	}





	public String getWithh() {
		return withh;
	}





	public void setWithh(String withh) {
		this.withh = withh;
	}





	public String getProgress() {
		return progress;
	}





	public void setProgress(String progress) {
		this.progress = progress;
	}





	public int getRecruit() {
		return recruit;
	}





	public void setRecruit(int recruit) {
		this.recruit = recruit;
	}





	public String getPhoto() {
		return photo;
	}





	public void setPhoto(String photo) {
		this.photo = photo;
	}





	public String getHost() {
		return host;
	}





	public void setHost(String host) {
		this.host = host;
	}





	public String getHcDelete() {
		return hcDelete;
	}





	public void setHcDelete(String hcDelete) {
		this.hcDelete = hcDelete;
	}





	public int getChkCount() {
		return chkCount;
	}





	public void setChkCount(int chkCount) {
		this.chkCount = chkCount;
	}





	public String getSort() {
		return sort;
	}





	public void setSort(String sort) {
		this.sort = sort;
	}





	@Override
	public String toString() {
		return "HcDto [pKey=" + pKey + ", id=" + id + ", title=" + title + ", content=" + content + ", stDate=" + stDate
				+ ", edDate=" + edDate + ", term=" + term + ", regdate=" + regdate + ", endList=" + endList
				+ ", calWith=" + calWith + ", withh=" + withh + ", progress=" + progress + ", recruit=" + recruit
				+ ", photo=" + photo + ", host=" + host + ", hcDelete=" + hcDelete + ", chkCount=" + chkCount
				+ ", sort=" + sort + "]";
	}


	
	
	

}
