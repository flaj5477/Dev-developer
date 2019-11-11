package com.dd.devdeveloper.qna;

import lombok.Data;

@Data
public class QuestionVO {
	private int qqNo;
	private int membersNo;
	private String qqTitle;
	private String qqContents;
	private String qqCode;
	private String qqDate;
	private int qqViews;
	private String qqTags;
	private String membersId;
	
	
	private String searchVal;		//검색값
	private int first;	//페이징 시작 게시글 번호
	private int last;	//페이징 종료 게시글 번호
	private String orderby; //정렬
}
