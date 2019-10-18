package com.dd.devdeveloper.wiki.service.impl;

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

}
