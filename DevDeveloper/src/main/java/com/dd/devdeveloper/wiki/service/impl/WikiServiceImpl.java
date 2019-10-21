package com.dd.devdeveloper.wiki.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.service.WikiService;

@Service
public class WikiServiceImpl implements WikiService{

	@Autowired WikiDAO wikiDAO;
	
	@Override
	public WikiVO getWiki(WikiVO vo) {
		
		return wikiDAO.getWiki(vo);
	}

	//20191021 곽동우	//위키리스트조회
	@Override
	public List<Map<String, Object>> getWikiMap() {
		
		return wikiDAO.getWikiMap();
	}

}
