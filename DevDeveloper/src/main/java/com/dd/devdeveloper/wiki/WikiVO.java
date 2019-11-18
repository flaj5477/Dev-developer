package com.dd.devdeveloper.wiki;

import java.util.List;

import lombok.Data;

@Data
public class WikiVO {
	private int manualNo;				//메뉴얼 번호
	private String manualContentsPath;	//메뉴얼 txt 파일 경로
	private String manualOriUrl;		//메뉴얼 원문 url
	private String manualTags;			//메뉴얼 적용태그
	private String manualTitle;			//메뉴얼 제목
	private int manualTotalline;		//메뉴얼 총라인수
	
	private int manualTransPercent;		//메뉴얼 번역률
	private String manualContents;		//메뉴얼 원문 내용
	private int first;					//페이징시 첫데이터번호
	private int last;					//페이징시 마지막데이터번호
	private String select;			//검색 분류 선택 (태그,제목)
	private String searchVal;		//검색값
	private String orderby;
	private List<List<Integer>> updateInfo;	//업데이트할 번역 라인정보
	
	private Integer manualContentsCheck;	//메뉴얼내용 null확인
}
