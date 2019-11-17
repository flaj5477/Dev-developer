package com.dd.devdeveloper.tags.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.tags.service.TagsService;

@Controller
public class TagsController {
	
	@Autowired TagsService tagService;
	
	@RequestMapping("/tagList")
	public String tagList(Model model){
		
		model.addAttribute("tagList", tagService.tagList());
		
		return "tag_jsp/taghome";
	}
}
