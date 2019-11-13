package com.dd.devdeveloper.tags;

import lombok.Data;

@Data
public class TagsVO {
	private int tagsNo;			//태그등록번호
	private String tagsTitle;	//태그 이름
	private String tagsContents;	//태그내용
}
