package com.dd.devdeveloper.wiki.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.wiki.WikiRecVO;
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
	
	//위키번역 등록
	public Map<Integer, Object> insertWikiTrans(WikiTransVO vo);

	//위키번역(라인) 가져오기
	public List<Map<String, Object>> getWikiTransLine(WikiTransVO vo); 
	
	//위키 번역된거 뿌리기
	public List<Map<Integer, Object>> getWikiTrans(WikiVO vo);

	//위키 태그리스트 보기
	public List<LinkedHashMap<String, Object>> getWikiTagList();

	
	//위키 번역 삭제
	public int delWikiTrans(WikiTransVO tVo);
	
	//위키번역 추천
	public int wikiTransRec(WikiRecVO rvo);
	
	//위키번역 추천취소
	public int wikiTransRecDel(WikiRecVO rvo);

	//나의 위키 번역내용
	public List<WikiTransVO> getMyWikiTransList();
}
