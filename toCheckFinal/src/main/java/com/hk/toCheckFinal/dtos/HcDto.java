package com.hk.toCheckFinal.dtos;

public class HcDto {

	private String pKey; //식별키1
	private String id; //작성자 아이디1
	private String title; //목표 제목1
	private String content; //목표 상세내용1
	private String stDate; //시작일1
	private String edDate; //종료일1
	private String term; //진행기간1
	private String regdate; // 작성일1
	private String chks; //인증 횟수를 /로 붙여서 모음1
	private String endList; //완료 여부1
	private String calWith; // 목표 공유하기1
	private String withh; //함께하기 여부1
	private String progress; //진행 여부1
	private int recruit; //모집 인원1
	private int intoper; //참여 인원1
	private int chkss; //chks의 갯수1
	private String photo; //사진이름1
	private String idlist; //참가자 리스트1
	
	
	public HcDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HcDto(String pKey, String id, String title, String content, String stDate, String edDate, String term,
			String regdate, String chks, String endList, String calWith, String withh, String progress, int recruit,
			int intoper, int chkss, String photo, String idlist) {
		super();
		this.pKey = pKey;
		this.id = id;
		this.title = title;
		this.content = content;
		this.stDate = stDate;
		this.edDate = edDate;
		this.term = term;
		this.regdate = regdate;
		this.chks = chks;
		this.endList = endList;
		this.calWith = calWith;
		this.withh = withh;
		this.progress = progress;
		this.recruit = recruit;
		this.intoper = intoper;
		this.chkss = chkss;
		this.photo = photo;
		this.idlist = idlist;
	}








	public HcDto(String pKey, String chks, String calWith, int chkss) {
		super();
		this.pKey = pKey;
		this.chks = chks;
		this.calWith = calWith;
		this.chkss = chkss;
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


	public String getChks() {
		return chks;
	}


	public void setChks(String chks) {
		this.chks = chks;
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


	public int getIntoper() {
		return intoper;
	}


	public void setIntoper(int intoper) {
		this.intoper = intoper;
	}


	public int getChkss() {
		return chkss;
	}


	public void setChkss(int chkss) {
		this.chkss = chkss;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public String getIdlist() {
		return idlist;
	}


	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}


	@Override
	public String toString() {
		return "HcDto [pKey=" + pKey + ", id=" + id + ", title=" + title + ", content=" + content + ", stDate=" + stDate
				+ ", edDate=" + edDate + ", term=" + term + ", regdate=" + regdate + ", chks=" + chks + ", endList="
				+ endList + ", calWith=" + calWith + ", withh=" + withh + ", progress=" + progress + ", recruit="
				+ recruit + ", intoper=" + intoper + ", chkss=" + chkss + ", photo=" + photo + ", idlist=" + idlist
				+ "]";
	}

	

	
	
	

}
