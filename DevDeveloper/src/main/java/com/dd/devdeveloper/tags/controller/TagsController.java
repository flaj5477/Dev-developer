package com.dd.devdeveloper.tags.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dd.devdeveloper.tags.service.TagsService;

@Controller
public class TagsController {
	
	@Autowired TagsService tagService;
}
