package com.dd.devdeveloper.tags.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dd.devdeveloper.tags.service.TagsService;

@Controller
public class TagsController {
	
	@Autowired TagsService tagService;
	
	
	/*=================
	 * 20191118
	 * 태그홈 태그목록 가져오기
	 * 곽동우
	 =================*/
	@RequestMapping("/tagList")
	public String tagList(Model model){
		
		model.addAttribute("tagList", tagService.tagList());	//태그정보
		
		return "tag_jsp/taghome";
	}
	
	
	/*=================
	 * 20191119
	 * 태그관리폼
	 * 곽동우
	 =================*/
	@RequestMapping("/tagManageForm")
	public String tagManageForm(Model model){
		
		model.addAttribute("tagList", tagService.tagManageForm());	//태그정보
		
		return "tag_jsp/tagManageForm";
	}
	
	
	/*=================
	 * 20191119
	 * 태그관리 태그등록
	 * 곽동우
	 =================*/
	@RequestMapping("/insertTag")
	public String insertTag(Model model){
		
		model.addAttribute("tagList", tagService.tagList());	//태그정보
		
		return "tag_jsp/taghome";
	}
	
	/*=================
	 * 20191119
	 * 태그관리 태그수정
	 * 곽동우
	 =================*/
	@RequestMapping("/updateTag")
	public String updateTag(Model model){
		
		model.addAttribute("tagList", tagService.tagList());	//태그정보
		
		return "tag_jsp/taghome";
	}
	
	/*=================
	 * 20191119
	 * 태그관리 태그삭제
	 * 곽동우
	 =================*/
	@RequestMapping("/deleteTag")
	public String deleteTag(Model model){
		
		model.addAttribute("tagList", tagService.tagList());	//태그정보
		
		return "tag_jsp/taghome";
	}
	

	
//	/*=================
//	 * 20191118
//	 * 게시글 등록 or 수정시 태그목록 가져오기 ajax
//	 * 곽동우
//	 =================*/
//	@RequestMapping("/getTagList")
//	public List<Map<String, Object>> getTagList() {		
//		return tagService.getTagList();
//	}
}
