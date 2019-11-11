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
}
