package com.hk.toCheckFinal.dtos;

import org.springframework.web.multipart.MultipartFile;

public class HcInChkDto {

	
	private String pKey;  //hcboard의 pkey를 가저옴
	private String id; 	//아이디
	private String title; 	//아이디
	private String inChkDate;	//인증날짜
	private String inChkTitle;	//인증제목
	private String inChkContent;	//인증내용
	private String inChkTime;	//인증시간
	
	private String inChkPhoto;  //인증사진
	private String inChkPhoto2;  //인증사진2
	
	private MultipartFile file;  //인증사진

	
	public HcInChkDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	public HcInChkDto(String pKey, String id, String title, String inChkDate) {
		super();
		this.pKey = pKey;
		this.id = id;
		this.title = title;
		this.inChkDate = inChkDate;
	}

	public HcInChkDto(String pKey, String inChkDate) {
		super();
		this.pKey = pKey;
		this.inChkDate = inChkDate;
	}
	

	public HcInChkDto(String pKey, String inChkDate, String id) {
		super();
		this.pKey = pKey;
		this.inChkDate = inChkDate;
		this.id = id;
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

	public String getInChkDate() {
		return inChkDate;
	}

	public void setInChkDate(String inChkDate) {
		this.inChkDate = inChkDate;
	}



	public String getInChkTitle() {
		return inChkTitle;
	}

	public void setInChkTitle(String inChkTitle) {
		this.inChkTitle = inChkTitle;
	}

	public String getInChkContent() {
		return inChkContent;
	}

	public void setInChkContent(String inChkContent) {
		this.inChkContent = inChkContent;
	}

	public String getInChkTime() {
		return inChkTime;
	}

	public void setInChkTime(String inChkTime) {
		this.inChkTime = inChkTime;
	}


	
	
	public String getInChkPhoto() {
		return inChkPhoto;
	}

	public void setInChkPhoto(String inChkPhoto) {
		this.inChkPhoto = inChkPhoto;
	}	
	
	public String getInChkPhoto2() {
		return inChkPhoto2;
	}

	public void setInChkPhoto2(String inChkPhoto2) {
		this.inChkPhoto2 = inChkPhoto2;
	}

	

	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public HcInChkDto(String pKey, String id, String title, String inChkDate, String inChkTitle, String inChkContent,
			String inChkTime, String inChkPhoto, String inChkPhoto2, MultipartFile file) {
		super();
		this.pKey = pKey;
		this.id = id;
		this.title = title;
		this.inChkDate = inChkDate;
		this.inChkTitle = inChkTitle;
		this.inChkContent = inChkContent;
		this.inChkTime = inChkTime;
		this.inChkPhoto = inChkPhoto;
		this.inChkPhoto2 = inChkPhoto2;
		this.file = file;
	}



	@Override
	public String toString() {
		return "HcInChkDto [pKey=" + pKey + ", id=" + id + ", title=" + title + ", inChkDate=" + inChkDate
				+ ", inChkTitle=" + inChkTitle + ", inChkContent=" + inChkContent + ", inChkTime=" + inChkTime
				+ ", inChkPhoto=" + inChkPhoto + ", inChkPhoto2=" + inChkPhoto2 + ", file=" + file + "]";
	}


	
	
	
}
