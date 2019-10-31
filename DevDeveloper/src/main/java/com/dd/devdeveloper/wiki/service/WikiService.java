package com.dd.devdeveloper.wiki.service;

import java.util.List;
import java.util.Map;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.wiki.WikiTransVO;
import com.dd.devdeveloper.wiki.WikiVO;

public interface WikiService {
	
	//위키 단건?
	public WikiVO getWiki(WikiVO vo);
	
	//위키리스트
	List<Map<String, Object>> getWikiMap(Paging paging, WikiVO vo);
	
	
	//위키등록
	public int insertWiki(WikiVO vo);

	//위키수정
	public void updateWiki(WikiVO vo);

	//위키경로 가져오기
	public String getWikiContentsPath(WikiVO vo);

	//위키삭제(단건)
	public void deleteWiki(WikiVO vo);
	
	//위키번역폼
	public Map<Integer, Object> getTransWikiForm(WikiVO vo);
	
	//위키
	public Map<Integer, Object> insertWikiTrans(WikiTransVO vo); 
}
