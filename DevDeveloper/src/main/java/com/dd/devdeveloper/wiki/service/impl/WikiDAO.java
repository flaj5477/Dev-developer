package com.dd.devdeveloper.wiki.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	//위키번역받기
	public List<Map<String, Object>> getWikiTransLine(WikiTransVO vo) {
		return mybatis.selectList("WikiDAO.getWikiTransLine", vo);
	}
}
