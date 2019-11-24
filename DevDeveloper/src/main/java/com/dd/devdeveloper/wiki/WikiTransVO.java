package com.dd.devdeveloper.wiki;

import lombok.Data;
import lombok.EqualsAndHashCode;


/*
 * 20191030
 * 곽동우
 * 위키 번역 vo
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class WikiTransVO extends WikiVO{
	private int transNo;		//번역번호	
	private Integer manualLine;		//메뉴얼 라인번호
	private String manualBefore;	//번역전
	private String manualAfter;		//번역후
	private int manualNo;			//메뉴얼 번호
	private int membersNo;			//멤버 번호
	private String translDate;	//등록날짜

	private Integer loginNo;	//로그인한사람번호
	private String myTransRec;	//추천여부확인
	private int rec;		//추천수
	private String orderby;	//정렬?
	private String orderby2;	//막바지라 그냥 추가했음 수정필요
	
	
}
