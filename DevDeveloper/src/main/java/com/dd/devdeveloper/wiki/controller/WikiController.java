package com.dd.devdeveloper.wiki.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.service.WikiService;
import com.dd.devdeveloper.wiki.textFile.textToFile;


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
	
	/*
	 * 관리자-위키작성페이지 이동
	 */
	@RequestMapping("/insertWikiForm")
	public String insertWikiForm() {
		return "wiki/insertWikiForm";
	}
	
	/*
	 * 작성자:곽동우
	 * 작성일자:2019-10-22
	 * 설명:위키 등록하기
	 */
	@RequestMapping("/insertWiki")
	public String insertWiki(WikiVO vo) {
		wikiService.insertWiki(vo);
		
		return "redirect:/wikihome";
	}
	
	/*
	 * 곽동우
	 * 2019-10-24
	 * 위키수정폼 이동
	 */
	@RequestMapping("/updateWikiForm")
	public String updateWikiForm(WikiVO vo, Model model) {
		model.addAttribute("wiki", wikiService.getWiki(vo));
		return "wiki/updateWikiForm";
	}
	
	/*
	 * 곽동우
	 * 2019-10-24
	 * 위키수정하기
	 */
	@RequestMapping("/updateWiki")
	public String updateWiki(WikiVO vo, Model model) {
		System.out.println(vo.getManualTitle()+"============================");
		wikiService.updateWiki(vo);
		return "redirect:/wikihome";
	}
	
}
