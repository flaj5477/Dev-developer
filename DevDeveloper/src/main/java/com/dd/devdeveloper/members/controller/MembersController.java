package com.dd.devdeveloper.members.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.members.service.MembersService;
import com.dd.devdeveloper.wiki.WikiVO;

@Controller
public class MembersController {

	 @Autowired MembersService membersService;
	
	 @RequestMapping("/login")
		public String loginform() {
			return "members/login";
		}
		
		@RequestMapping("/loginTest")
		public String loginformtest() {
			return "members/loginTest";
		}
		
		@RequestMapping("/signUp")
		public String signUp() {
			return "members/signUp";
	}
		@RequestMapping("/test")
		public String test() {
			return "members/test";
	}
	
	 //SignUp GET
	/*
	 * @RequestMapping(value="/signup", method=RequestMethod.GET) 
	 * public void signupGET() {
	 * 	 }
	 */
   //SignUp PSOT
       @RequestMapping(value="/signup", method=RequestMethod.POST)
       public String signupPOST(MembersVO vo) {
       
           membersService.insertMembers(vo);
           
           return "members/loginTest";
       }
}
