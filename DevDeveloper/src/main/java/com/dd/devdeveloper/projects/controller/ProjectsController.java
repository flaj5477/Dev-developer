package com.dd.devdeveloper.projects.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.projects.service.ProjectsService;

@Controller
public class ProjectsController {
	@Autowired
	ProjectsService projectsService;
	
	@RequestMapping("/getProjectsList") //프로젝트 목록
	public String getProjectsList(ProjectsVO vo, Model model, Paging paging) {
		model.addAttribute("list", projectsService.getProjectsList(paging, vo));
		model.addAttribute("paging", paging);
		return "projects/projectsList";
	}
	
	@RequestMapping("/getProjects")	//프로젝트 공고 상세
	public String getProjects(ProjectsVO vo, Model model, HttpSession session) {
		model.addAttribute("project", projectsService.getProjects(vo));
		session.setAttribute("projNo", vo.getProjNo());	//세션에 projNo 추가
		return "projects/projects";
	}
	
	@RequestMapping("/applyProjectsForm")	//지원하기 버튼 누르면 지원폼 출력
	public String applyProjectsForm(ProjApplicantsVO vo, Model model, HttpSession session) {
		
	  vo.setMembersNo( ((MembersVO)session.getAttribute("members")).getMembersNo() ); //session의 멤버id를 vo에 담는다.
	  
	  System.out.println("vo검사::::::::::::::::::::" + vo.getMembersNo() + vo.getProjNo()  );
	  
	  
	  //프로젝트 지원 중복 검사
	  if( projectsService.applyDuplicationInspect(vo) == 0 ) {  //지원이력이 없으면 0이 반환된다.
	    //프로젝트 지원가능 등급인지 검사 
	    if( projectsService.projRequireInspect(vo) == 1 ) { //지원가능 등급이면 1, 등급 미달이면 0이 반환된다.
	      model.addAttribute("projParticipants", vo);
	      return "projects/applyProjectsForm";
	    }else {
	      //지원가능 등급이 아니라고 경고창 띄우기
	      model.addAttribute("errorMsg", "지원가능 등급이 아닙니다.");
	      model.addAttribute("url", "./getProjectsList");
	      return "common/Error";
	    }
	  }else {
	    //중복 지원이라고 경고창 띄우기
	    model.addAttribute("errorMsg", "이미 지원하셨습니다.");
      model.addAttribute("url", "./getProjectsList");
      return "common/Error";
	  }

	  
	}
	
	
	
	@RequestMapping("/applyProjects")	//지원 폼 정보로 지원하기
	public String applyProjects(ProjApplicantsVO vo, HttpSession session) {
		//vo에 지원자 no 담기
		//vo.setMembersNo(2); /////////////////////////////////////membersId말고 members객체 넣을꺼임 바꿔야함!
		vo.setMembersNo(  ((MembersVO)session.getAttribute("members")).getMembersNo() );
		vo.setProjNo((Integer)session.getAttribute("projNo"));
		projectsService.applyProjects(vo);
		return "redirect:/getProjectsList";	//프로젝트 목록 페이지로 돌아감
	}
}