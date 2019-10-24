package com.dd.devdeveloper.projects.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.projects.ProjParticipantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.projects.service.ProjectsService;

@Controller
public class ProjectsController {
	@Autowired
	ProjectsService projectsService;
	
	@RequestMapping("/getProjectsList")
	public String getProjectsList(ProjectsVO vo, Model model) {
		model.addAttribute("list", projectsService.getProjectsList(null));
		return "projects/projectsList";
	}
	
	@RequestMapping("/getProjects")
	public String getProjects(ProjectsVO vo, Model model) {
		model.addAttribute("project", projectsService.getProjects(vo));
		return "projects/projects";
	}
	
	@RequestMapping("/applyProjectsForm")
	public String applyProjectsForm(ProjParticipantsVO vo, Model model, HttpSession session) {
		model.addAttribute("projParticipants", vo);
		session.setAttribute("projNo", vo.getProjNo());
		return "projects/applyProjectsForm";
	}
	
	@RequestMapping("/applyProjects")
	public String applyProjects(ProjParticipantsVO vo, HttpSession session) {
		//vo에 지원자 no 담기
		vo.setMembersNo(2); /////////////////////////////////////membersId말고 members객체 넣을꺼임 바꿔야함!
		vo.setProjNo((Integer)session.getAttribute("projNo"));
		projectsService.applyProjects(vo);
		return "redirect:/projectsList";	//프로젝트 목록 페이지로 돌아감
	}
}