package com.dd.devdeveloper.members.controller;

import java.util.Collections;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.members.service.MembersService;
import com.dd.devdeveloper.wiki.WikiVO;

@Controller
public class MembersController {

	 @Autowired MembersService membersService;
	
	 @RequestMapping("/loginForm")
		public String loginform() {
			return "members/loginForm";
		}
		
		@RequestMapping("/signForm")
		public String loginformtest() {
			return "members/signForm";
		}
		
		@RequestMapping("/signUp")
		public String signUp() {
			return "members/signUp";
	}
		@RequestMapping("/loginSuccess")
		public String test() {
			return "members/test";
	}
		
		@RequestMapping("/idsearch")
		@ResponseBody
		public MembersVO idSearch(MembersVO vo) {
			MembersVO member = membersService.getmembers(vo);
			if(member != null)
				return member;
			else
				return new MembersVO();
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
       
     //로그인처리
   	@RequestMapping(value="/loginCheck")
   	public ModelAndView loginCheck(@ModelAttribute MembersVO vo,HttpSession session) {
   		
   		boolean result =  membersService.loginCheck(vo, session);
   		ModelAndView mav = new ModelAndView();
   		
   		mav.setViewName("members/loginForm");
   		
   		if(result) {
   			mav.addObject("msg","성공");
   		}else {
   			mav.addObject("msg","실패");
   		}	
   		return mav;
   	}
   	
  //로그아웃 처리
  	@RequestMapping("logout")
  	public ModelAndView logout(HttpSession session) {
  		
  		membersService.logout(session);
  		ModelAndView mav = new ModelAndView();
  		mav.setViewName("members/loginForm");
  		mav.addObject("msg", "logout");
  		
  		return mav;
  	}
  	
       
       
       
       
       
       
       
       
       
       
	/*
	 * //로그인시도
	 * 
	 * @RequestMapping(value="/login") public ModelAndView
	 * openLogin(HttpServletRequest request, HttpServletResponse response,
	 * CommandMap commandMap) throws Exception { ModelAndView mav = new
	 * ModelAndView();
	 * 
	 * //세션정보가 null이 아닐 때 if (request.getSession().getAttribute("loginInfo") !=
	 * null) { String msg = "이미 로그인 중입니다!!"; mav.addObject("msg", msg);
	 * mav.setViewName("/user/loginSuccess"); } else { mav.setViewName("/login"); }
	 * return mav; }
	 * 
	 * @RequestMapping(value="/loginCheck") public ModelAndView
	 * login(HttpServletRequest request, CommandMap commandMap) throws Exception {
	 * ModelAndView mav = new ModelAndView("/loginSuccess");
	 * 
	 * Map<String, Object> map = membersService.selectUserInfo(commandMap.getMap());
	 * 
	 * //로그인 정보가 있다면 로그인 if (map == null) { mav.addObject("msg", "로그인에 실패하였습니다."); }
	 * else { request.getSession().setAttribute("loginInfo", map);
	 * request.getSession().setMaxInactiveInterval(60*30);
	 * 
	 * mav.addObject("msg", "로그인에 성공하였습니다."); } return mav; }
	 */
       
       
}
