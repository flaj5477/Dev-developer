package com.dd.devdeveloper.members.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.members.service.MembersService;
import com.dd.devdeveloper.members.service.MembersSha256;
import com.dd.devdeveloper.wiki.WikiVO;

@Controller
public class MembersController {

	 @Autowired MembersService membersService;
	 
	 
	 @RequestMapping(value ="/login2" , method = RequestMethod.GET)
			public String loginform1() {
				return "/notiles/members/loginForm2";
			}   
	
		
		@RequestMapping("/signForm")
		public String loginformtest() {
			return "/notiles/members/signForm";
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
		
		
		@RequestMapping(value="/testForm", method=RequestMethod.GET)
		public String testForm(HttpServletRequest request, @RequestParam Map<String, Object> param, Model model) throws Exception {

		    return "/notiles/members/testForm";
		} 


 
	
	 //회원가입 폼
	
	  @RequestMapping(value="/signup", method=RequestMethod.GET) 
	  public String signupGET() {
		  return "/notiles/members/signForm";
	 	 }
	 
  
		
		
		
	//회원가입
       @RequestMapping(value="/signup", method=RequestMethod.POST)
       public String signupPOST(MembersVO vo, HttpSession session,
				MultipartHttpServletRequest multipart,
				HttpServletRequest request) {
    	   
    	   
    	   System.out.println("등록 비밀번호 : " + vo.getMembersPw());
    //암호화
    	   String encryPassword = MembersSha256.encrypt(vo.getMembersPw());
    	   vo.setMembersPw(encryPassword);
    	   System.out.println("암호화작업후 : " + vo.getMembersPw());
    	   
   	   
    	   
    	   
    		// 첨부파일 업로드하고 파일명 조회
   		MultipartFile multipartFile = multipart.getFile("membersImage4"); //multipartlist getfiles
   		 
   		if (multipartFile != null && multipartFile.getSize() > 0) {
   			// 파일명
   			//String fileName = multipartFile.getOriginalFilename();
   			//int dot = fileName.lastIndexOf(".");
   			//String fileName1 = fileName.substring(0, dot); 
   			String dot = ".";
   			String fileName1 = FilenameUtils.getBaseName(multipartFile.getOriginalFilename());
   			String fileName2 = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
   			// 업로드 폴더로 파일 이동
   			String path = request.getSession().getServletContext().
   					getRealPath("/images/profile/");
   					System.out.println("============="+path);
   					
   				if(new File(path + fileName1+dot+fileName2).exists()) {
   					fileName1 = fileName1 + "_" + System.currentTimeMillis();
   				}
   			
   			try {
   				//파일 중복되면 rename
   				
   				multipartFile.transferTo(new File(path + fileName1+dot+fileName2));
   				vo.setMembersImage(fileName1+dot+fileName2);
   			} catch (IOException e) {
   				e.printStackTrace();
   			}
   		}
   		membersService.insertMembers(vo);
   		return "redirect:wikihome";
   	}
          
     //로그인폼 
       @RequestMapping(value ="/login" , method = RequestMethod.GET)
		public String loginform() {
			return "/members/loginForm";
		}      
       
     //로그인처리
   	@RequestMapping(value ="/login" , method = RequestMethod.POST)
   	@ResponseBody
   	public int loginCheck(@ModelAttribute MembersVO vo,HttpSession session) {
   		
   		String Pw = vo.getMembersPw();
  		vo.setMembersPw(MembersSha256.encrypt(Pw));
  		System.out.println("=========111111111=======" +Pw);
  		
   		int result = membersService.loginCheck(vo, session);
   		
   		
   		
   		return result;
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
