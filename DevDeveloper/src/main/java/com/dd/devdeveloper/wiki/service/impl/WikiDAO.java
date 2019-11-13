package com.dd.devdeveloper.wiki.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.wiki.WikiRecVO;
import com.dd.devdeveloper.wiki.WikiTransVO;
import com.dd.devdeveloper.wiki.WikiVO;

@Repository
public class WikiDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	public WikiVO getWiki(WikiVO vo) {
		return mybatis.selectOne("WikiDAO.getWiki", vo);
	}

	public List<Map<String, Object>> getWikiMap(WikiVO vo) {
		return mybatis.selectList("WikiDAO.getWikiMap", vo);
	}

	public int insertWiki(WikiVO vo) {
		return mybatis.insert("WikiDAO.insertWiki", vo);
	}
	
	public int updateWiki(WikiVO vo) {
		return mybatis.update("WikiDAO.updateWiki", vo);
	}

	public WikiVO getWikiContentsPath(WikiVO vo) {
		return mybatis.selectOne("WikiDAO.getWikiContentsPath", vo);
	}
	
	//전체건수가져오기	//검색하면 검색한거 개수가져오기
	public int getCountWiki(WikiVO vo) {
		return mybatis.selectOne("WikiDAO.getCountWiki", vo);
	}

	//위키삭제
	public void deleteWiki(WikiVO vo) {
		mybatis.delete("WikiDAO.deleteWiki", vo);	
	}

	//위키번역등록
	public void insertWikiTrans(WikiTransVO vo) {
		mybatis.insert("WikiDAO.insertWikiTrans", vo);
	}

	//위키번역받기(라인별)
	public List<Map<String, Object>> getWikiTransLine(WikiTransVO vo) {
		System.out.println(vo.getOrderby()+"=======================");
		return mybatis.selectList("WikiDAO.getWikiTransLine", vo);
	}
	
	//위키번역받기(게시글)
	public List<Map<String, Object>> getWikiTrans(WikiVO vo){
		return mybatis.selectList("WikiDAO.getWikiTrans", vo);
	}

	//위키원문 등록된 태그 리스트 뿌려주기
	public List<LinkedHashMap<String, Object>> getWikiTagList() {
		return mybatis.selectList("WikiDAO.getWikiTagList");
	}
	
	//위키 번역 수 가져오기
	public int getTransCount(int manualNo) {
		Integer count = mybatis.selectOne("WikiDAO.getTransCount",manualNo);
		return  count != null ? count : 0 ;
	}
	
	//위키 번역 삭제
	public int delWikiTrans(WikiTransVO tVo) {
			
		return mybatis.delete("WikiDAO.delWikiTrans", tVo);	
	}

	//위키번역추천
	public int wikiTransRec(WikiRecVO rvo) {
		return mybatis.insert("WikiDAO.wikiTransRec", rvo);
	}

	//위키번역추천취소
	public int wikiTransRecDel(WikiRecVO rvo) {
		// TODO Auto-generated method stub
		return mybatis.delete("WikiDAO.wikiTransRecDel", rvo);
	}
}
