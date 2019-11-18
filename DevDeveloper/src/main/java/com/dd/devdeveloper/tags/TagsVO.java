package com.dd.devdeveloper.tags;

import lombok.Data;

@Data
public class TagsVO {
	private int tagsNo;			//태그등록번호
	private String tagsTitle;	//태그 이름
	private String tagsContents;	//태그내용
	
	private Integer qCount;			//질문게시판 개수
	private Integer pCount;			//프로젝트게시판 개수
	private Integer wCount;			//위키게시판 개수
	public Integer getqCount() {
		return qCount;
	}
	public void setqCount(Integer qCount) {
		this.qCount = qCount;
	}
	public Integer getpCount() {
		return pCount;
	}
	public void setpCount(Integer pCount) {
		this.pCount = pCount;
	}
	public Integer getwCount() {
		return wCount;
	}
	public void setwCount(Integer wCount) {
		this.wCount = wCount;
	}
	
	
}
