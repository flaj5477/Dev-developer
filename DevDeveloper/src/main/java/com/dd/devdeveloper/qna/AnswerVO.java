package com.dd.devdeveloper.qna;

import lombok.Data;

@Data
public class AnswerVO {
	private int aNo;
	private int qNo;
	private String aContents;
	private String aCode;
	private String aDate;
	private int aChoice;
	private int membersNo;
}
