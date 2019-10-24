package com.dd.devdeveloper.members.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.members.service.MembersService;
import com.dd.devdeveloper.wiki.WikiVO;

@Controller
public class MembersController {

	 @Autowired MembersService membersService;
	
	@RequestMapping("/login")
	public String loginform() {
		return "members/login";
	}
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "members/signUp";
}
}
