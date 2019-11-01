package com.dd.devdeveloper.wiki.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.wiki.WikiTransVO;
import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.service.WikiService;


//위키컨트롤러 1018 곽동우
@Controller
@SessionAttributes("wiki")
public class WikiController {
	
	@Autowired WikiService wikiService;
	
	/*
	 * 위키단건
	 */
	@RequestMapping("/getWiki")
	public String getWiki(WikiVO vo, Model model) {
		model.addAttribute("wiki", wikiService.getWiki(vo));
		
		return "wiki/getWiki";
	}
	
	/*
	 * 위키목록
	 */
	@RequestMapping("/wikihome")
	public String wikiHome(Model model, Paging paging, WikiVO vo) {
		model.addAttribute("wikiMap", wikiService.getWikiMap(paging, vo));
		model.addAttribute("paging", paging);
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
	@RequestMapping(value = "/insertWiki",
					method = RequestMethod.POST)
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
	@RequestMapping(value = "/updateWiki",
					method = RequestMethod.POST)
	public String updateWiki(WikiVO vo, Model model) {
		wikiService.updateWiki(vo);
		return "redirect:/wikihome";
	}
	
	/*
	 * 곽동우
	 * 2019-10-28
	 * 위키삭제
	 */
	@RequestMapping("/deleteWiki")
	public String deleteWiki(WikiVO vo) {
		wikiService.deleteWiki(vo);
		return "redirect:/wikihome";
	}
	
	/*
	 * 곽동우
	 * 2019-10-29
	 * 위키번역폼 이동
	 */
	@RequestMapping(value = "/transWikiForm", method = RequestMethod.POST)
	public String transWikiForm(@ModelAttribute("wiki") WikiVO vo, Model model) {	//
   		//테스트
		model.addAttribute("transWiki", wikiService.getTransWikiForm(vo));
		return "wiki/transWikiForm";
	}
	
	
	/*
	 * 곽동우
	 * 2019-10-31
	 * 위키번역 등록
	 */
	@RequestMapping(value = "/transWiki", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public Map transWiki(@RequestBody WikiTransVO tVo, Model model) {
		tVo.setTranslDate("오류");	//널이면 오류남
		tVo.setMembersNo(88); 	//테스트용
		wikiService.insertWikiTrans(tVo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		
		return map;
	}
	
	/*
	 * 곽동우
	 * 2019-11-01
	 * 위키번역폼에서- 위키라인 번역리스트가져오기
	 */
	@RequestMapping(value="/getWikiTransLine", method=RequestMethod.GET)
	@ResponseBody
	public List<WikiTransVO> getWikiTransLine(WikiTransVO tVo, Model model) {
		//model.addAttribute("user", userService.getUser(vo));
		return wikiService.getWikiTransLine(tVo);
	}
}
