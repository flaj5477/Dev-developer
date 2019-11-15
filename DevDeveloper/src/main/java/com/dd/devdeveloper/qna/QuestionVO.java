package com.dd.devdeveloper.qna;

 


public class QuestionVO {
	private int qNo;
	private int membersNo;
	private String qTitle;
	private String qContents;
	private String qCode;
	private String qDate;
	private int qViews;
	private String qTags;
	private String membersId;
	private String membersImage;
	private int aCount;
	private String searchVal;		//검색값
	private int first;	//페이징 시작 게시글 번호
	private int last;	//페이징 종료 게시글 번호
	private String orderby; //정렬
	
	
	
	public int getaCount() {
		return aCount;
	}
	public void setaCount(int aCount) {
		this.aCount = aCount;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public int getMembersNo() {
		return membersNo;
	}
	public void setMembersNo(int membersNo) {
		this.membersNo = membersNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContents() {
		return qContents;
	}
	public void setqContents(String qContents) {
		this.qContents = qContents;
	}
	public String getqCode() {
		return qCode;
	}
	public void setqCode(String qCode) {
		this.qCode = qCode;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public int getqViews() {
		return qViews;
	}
	public void setqViews(int qViews) {
		this.qViews = qViews;
	}
	public String getqTags() {
		return qTags;
	}
	public void setqTags(String qTags) {
		this.qTags = qTags;
	}
	public String getMembersId() {
		return membersId;
	}
	public void setMembersId(String membersId) {
		this.membersId = membersId;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	
	
	
	
	public String getMembersImage() {
		return membersImage;
	}
	public void setMembersImage(String membersImage) {
		this.membersImage = membersImage;
	}
	
	
	
	@Override
	public String toString() {
		return "QuestionVO [qNo=" + qNo + ", membersNo=" + membersNo + ", qTitle=" + qTitle + ", qContents=" + qContents
				+ ", qCode=" + qCode + ", qDate=" + qDate + ", qViews=" + qViews + ", qTags=" + qTags + ", membersId="
				+ membersId + ", membersImage=" + membersImage + ", aCount=" + aCount + ", searchVal=" + searchVal
				+ ", first=" + first + ", last=" + last + ", orderby=" + orderby + "]";
	}

	}
	
