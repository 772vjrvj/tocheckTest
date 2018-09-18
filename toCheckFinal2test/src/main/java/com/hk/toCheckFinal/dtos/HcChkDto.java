package com.hk.toCheckFinal.dtos;

public class HcChkDto {

	private String pKey; //pKey
	private String chk; //체크한 날짜들
	
	public HcChkDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HcChkDto(String pKey, String chk) {
		super();
		this.pKey = pKey;
		this.chk = chk;
	}

	public String getpKey() {
		return pKey;
	}

	public void setpKey(String pKey) {
		this.pKey = pKey;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	@Override
	public String toString() {
		return "HcWithDto [pKey=" + pKey + ", chk=" + chk + "]";
	}
	
	
	
	
	
}
