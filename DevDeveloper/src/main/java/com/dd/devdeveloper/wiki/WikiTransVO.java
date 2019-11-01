package com.dd.devdeveloper.wiki;

import lombok.Data;


/*
 * 20191030
 * 곽동우
 * 위키 번역 vo
 */
@Data
public class WikiTransVO extends WikiVO{
	private int transNo;		//번역번호	
	private int manualLine;		//메뉴얼 라인번호
	private String manualBefore;	//번역전
	private String manualAfter;		//번역후
	private int manualNo;			//메뉴얼 번호
	private int membersNo;			//멤버 번호
	private String translDate;	//등록날짜
}
