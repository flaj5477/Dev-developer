package com.dd.devdeveloper.qna;




public class AnswerVO {
	private int aNo;
	private int qNo;
	private String aContents;
	private String aCode;
	private String aDate;
	private int aChoice;
	private int membersNo;
	private String membersId;
	private String membersImage;
	private int aLikeCount;
	
	
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getaContents() {
		return aContents;
	}
	public void setaContents(String aContents) {
		this.aContents = aContents;
	}
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	public int getaChoice() {
		return aChoice;
	}
	public void setaChoice(int aChoice) {
		this.aChoice = aChoice;
	}
	public int getMembersNo() {
		return membersNo;
	}
	public void setMembersNo(int membersNo) {
		this.membersNo = membersNo;
	}
 
	public String getMembersId() {
		return membersId;
	}
	public void setMembersId(String membersId) {
		this.membersId = membersId;
	}
	public String getMembersImage() {
		return membersImage;
	}
	public void setMembersImage(String membersImage) {
		this.membersImage = membersImage;
	}
	
	
	
	
	public int getaLikeCount() {
		return aLikeCount;
	}
	public void setaLikeCount(int aLikeCount) {
		this.aLikeCount = aLikeCount;
	}
	
	
	
	@Override
	public String toString() {
		return "AnswerVO [aNo=" + aNo + ", qNo=" + qNo + ", aContents=" + aContents + ", aCode=" + aCode + ", aDate="
				+ aDate + ", aChoice=" + aChoice + ", membersNo=" + membersNo + ", membersId=" + membersId
				+ ", membersImage=" + membersImage + ", aLikeCount=" + aLikeCount + "]";
	}
	
	
	
	
	
	
	
	
	
}
