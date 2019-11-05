package com.dd.devdeveloper.wiki;

import lombok.Data;

@Data
public class WikiTagVO {
	private int tagsNo;	//태그번호
	private String tagsTitle;	//태그이름
	private String tagsContents;	//태그설명
	private String manualTags;
	
	private int countTags;	//태그개수
	
}
