package com.dd.devdeveloper.wiki.service;

import java.util.List;
import java.util.Map;

import com.dd.devdeveloper.wiki.WikiVO;

public interface WikiService {
	
	//위키 단건?
	public WikiVO getWiki(WikiVO vo);
	
	//위키리스트
	List<Map<String, Object>> getWikiMap();
	
	
	//위키등록
	public int insertWiki(WikiVO vo);

	//위키수정
	public void updateWiki(WikiVO vo);

	//위키경로 가져오기
	public String getWikiContentsPath(WikiVO vo);
	
	
}
