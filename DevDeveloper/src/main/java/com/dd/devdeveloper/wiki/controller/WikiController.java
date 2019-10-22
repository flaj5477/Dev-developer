package com.dd.devdeveloper.wiki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.service.WikiService;


//위키컨트롤러 1018 곽동우
@Controller
public class WikiController {
	
	@Autowired WikiService wikiService;
	
	@RequestMapping("/getWiki")
	public String getWiki(WikiVO vo, Model model) {
		model.addAttribute("wiki", wikiService.getWiki(vo));
		
		
		
		return "wiki/getWiki";
	}
	
	
	@RequestMapping("/wikihome")
	public String wikiHome(Model model) {
		model.addAttribute("wikiMap", wikiService.getWikiMap());
		return "wiki/wikihome";
	}
	
	@RequestMapping("/insertWikiForm")
	public String insertWiki() {
		return "wiki/insertWikiForm";
	}
}
