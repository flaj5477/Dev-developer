package com.dd.devdeveloper.qna;

import lombok.Data;

@Data
public class QuestionVO {
	private int qNo;
	private int membersNo;
	private String qTitle;
	private String qContents;
	private String qCode;
	private String qDate;
	private int qViews;
	private String qTags;
}
