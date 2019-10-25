package com.dd.devdeveloper.wiki.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.wiki.WikiVO;

@Repository
public class WikiDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	public WikiVO getWiki(WikiVO vo) {
		return mybatis.selectOne("WikiDAO.getWiki", vo);
	}

	public List<Map<String, Object>> getWikiMap() {
		return mybatis.selectList("WikiDAO.getWikiMap");
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
	
	//전체건수가져오기
	public int getCountWiki() {
		return mybatis.selectOne("WikiDAO.getCountWiki");
	}
}
