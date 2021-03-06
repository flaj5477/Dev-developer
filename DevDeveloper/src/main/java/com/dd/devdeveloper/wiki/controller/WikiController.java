package com.dd.devdeveloper.wiki.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.transaction.Transaction;
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
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.tags.controller.TagsController;
import com.dd.devdeveloper.tags.service.TagsService;
import com.dd.devdeveloper.wiki.WikiRecVO;
import com.dd.devdeveloper.wiki.WikiTransVO;
import com.dd.devdeveloper.wiki.WikiVO;
import com.dd.devdeveloper.wiki.api.PapagoTranslateNMT;
import com.dd.devdeveloper.wiki.service.WikiService;
import com.dd.devdeveloper.wiki.service.impl.WikiDAO;


//위키컨트롤러 1018 곽동우
@Controller
@SessionAttributes("wiki")
public class WikiController {
	
	@Autowired WikiService wikiService;
	@Autowired TagsService tagsService;
	@Autowired
	WikiDAO wikiDAO;
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
	 * 관리자-위키등록폼 이동
	 */
	@RequestMapping("/insertWikiForm")
	public String insertWikiForm(Model model) {
		model.addAttribute("tagList", tagsService.getTagList());	//등록폼으로 태그목록던져줌
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
		model.addAttribute("tagList", tagsService.getTagList());	//등록폼으로 태그목록던져줌
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
	@RequestMapping(value = "/transWikiForm")
	public String transWikiForm(@ModelAttribute("wiki") WikiVO vo, Model model) {	//
		
		Map<Integer, Object> transList = wikiService.getWikiTrans(vo).get(1);   //번역들고옴	여기서 @Autowired WikiDAO wikiDAO 써도되나? 안쓰고 NEW 하면 에러남
		
		model.addAttribute("transWiki", wikiService.getTransWikiForm(vo));
		model.addAttribute("transList", transList);
		return "wiki/transWikiForm";
	}
	
	/*
	 * 곽동우
	 * 2019-11-05
	 * 위키원문에 등록된 태그 리스트 뿌려주기
	 */
	@RequestMapping(value= "/getWikiTagList")
	public String getWikiTagList(Model model) {
		model.addAttribute("tagList",wikiService.getWikiTagList());
		return "wiki/getWikiTagList";
	}
	
	/*
	 * 곽동우
	 * 2019-11-05
	 * 번역전체보기 
	 */
	@RequestMapping(value= "/getWikiTrans")
	public String getWikiTrans(WikiVO vo, Model model) {
		
		model.addAttribute( "transWiki", wikiService.getWikiTrans(vo).get(0) );
		return "wiki/getWikiTrans";
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
		wikiService.insertWikiTrans(tVo);	//위키번역등록
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		
		return map;
	}
	
	/*
	 * 곽동우
	 * 2019-11-01
	 * 위키번역폼에서- 위키라인 번역리스트가져오기
	 */
	@RequestMapping(value="/getWikiTransLine", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public List<Map<String, Object>> getWikiTransLine(@RequestBody WikiTransVO tVo, Model model) {
		return wikiService.getWikiTransLine(tVo);
	}
	
	
	/*
	 * 곽동우
	 * 2019-11-04
	 * 파파고 api
	 */
	@RequestMapping(value="/papagoTrans", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String papagoTrans(HttpServletRequest request) {
		String papagoTrans = PapagoTranslateNMT.papago(request.getParameter("oriContents"));
		return papagoTrans;
	}
	
	/*
	 * 곽동우
	 * 2019-11-08
	 * 번역삭제
	 */
	@RequestMapping(value = "/delWikiTrans", method = RequestMethod.POST)
	@ResponseBody
	public int delWikiTrans(HttpServletRequest request) {
		int transNo = Integer.parseInt((String) request.getParameter("transNo"));
		WikiTransVO tVo = new WikiTransVO();
		tVo.setTransNo(transNo);
		
		return wikiService.delWikiTrans(tVo);
	}
	
	/*==============
	  	곽동우
	  	20191112
	  	번역추천
	 ================*/
	@RequestMapping(value = "/wikiTransRec", method = RequestMethod.POST)
	@ResponseBody
	public int wikiTransRec(WikiRecVO rvo) {
				
		return wikiService.wikiTransRec(rvo);
	}
	
	/*==============
  	곽동우
  	20191113
  	번역취소
 	================*/
	@RequestMapping(value = "/wikiTransRecDel", method = RequestMethod.POST)
	@ResponseBody
	public int wikiTransRecDel(WikiRecVO rvo) {
				
		return wikiService.wikiTransRecDel(rvo);
	}
	
	/*==============
  	곽동우
  	20191122
  	번역추천수가져오기
 	================*/
	@RequestMapping(value = "/getTransRec", method = RequestMethod.POST)
	@ResponseBody
	public int getTransRec(HttpServletRequest request) {
		int transNo = Integer.parseInt((String) request.getParameter("transNo"));
		return wikiService.getTransRec(transNo);
	}
}
