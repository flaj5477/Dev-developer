package com.dd.devdeveloper.wiki;

import lombok.Data;

@Data
public class WikiVO {
	private int manualNo;				//메뉴얼 번호
	private String manualContentsPath;	//메뉴얼 txt 파일 경로
	private String manualOriUrl;		//메뉴얼 원문 url
	private String manualTags;			//메뉴얼 적용태그
	private String manualTitle;			//메뉴얼 제목
	
	private String manualContents;		//메뉴얼 원문 내용
	private int first;					//페이징시 첫데이터번호
	private int last;					//페이징시 마지막데이터번호
	private String orderby;
}
