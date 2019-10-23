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
		List<Map<String, Object>> wikiList= wikiDAO.getWikiMap();
		
		
		for(int i=0; i<wikiList.size(); i++) {
			String res = (String)wikiList.get(i).get("manualTitle");
			
			res = removeTag(res);
			wikiList.get(i).put("manualTitle",res);
		}
		
		return wikiList;
	}

	//위키등록
	@Override
	public int insertWiki(WikiVO vo) {
		return wikiDAO.insertWiki(vo);
	}
	
	//태그제거
	public String removeTag(String html){
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}

}
