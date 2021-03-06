package com.dd.devdeveloper.projects.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.common.CustomDateEditor2;
import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.projects.service.ProjectsService;
import com.dd.devdeveloper.tags.service.TagsService;

@Controller
public class ProjectsController {
	@Autowired
	ProjectsService projectsService;
	
	@Autowired
	TagsService tagsService;

	@RequestMapping("/getProjectsList") // 프로젝트 목록
	public String getProjectsList(ProjectsVO vo, Model model, Paging paging) {
		List<ProjectsVO> projectsList = projectsService.getProjectsList(paging, vo);
		
		for(int i=0;i<projectsList.size();i++) {
			String tags = projectsList.get(i).getProjTags(); //스트링으로 연결되어있는 tags를
			ProjectsVO t_project = projectsList.get(i);
			t_project.setProjTagsList(tagsService.divTag(tags)); //잘라서 list 형식으로 넣어줌
			projectsList.set(i, t_project);
		}
		
		model.addAttribute("list", projectsList);
		model.addAttribute("paging", paging);

		return "projects/projectsList";
	}

	@RequestMapping("/getProjects") // 프로젝트 공고 상세
	public String getProjects(ProjectsVO vo, Model model, HttpSession session) {
		
		ProjectsVO project = projectsService.getProjects(vo);
		project.setProjTagsList(tagsService.divTag(project.getProjTags())); //스트링 형식 tags를 잘라서 tagsList에 넣어줌
		
		model.addAttribute("project", project );
		model.addAttribute("loginMembersNo", ((MembersVO) session.getAttribute("members")).getMembersNo() );
		session.setAttribute("projNo", vo.getProjNo()); // 세션에 projNo 추가
		
		return "projects/projects";
	}

	@RequestMapping("/applyProjectsForm") // 지원하기 버튼 누르면 지원폼 출력
	public String applyProjectsForm(ProjApplicantsVO vo, Model model, HttpSession session) {

		vo.setMembersNo(((MembersVO) session.getAttribute("members")).getMembersNo()); // session의 멤버id를 vo에 담는다.

		System.out.println("vo검사::::::::::::::::::::" + vo.getMembersNo() + vo.getProjNo());

		// 프로젝트 지원 중복 검사
		if (projectsService.applyDuplicationInspect(vo) == 0) { // 지원이력이 없으면 0이 반환된다.
			// 프로젝트 지원가능 등급인지 검사
			if (projectsService.projRequireInspect(vo) == 1) { // 지원가능 등급이면 1, 등급 미달이면 0이 반환된다.
				model.addAttribute("projParticipants", vo);
				return "projects/applyProjectsForm";
			} else {
				// 지원가능 등급이 아니라고 경고창 띄우기
				model.addAttribute("errorMsg", "지원가능 등급이 아닙니다.");
				model.addAttribute("url", "./getProjectsList");
				return "common/Error";
			}
		} else {
			// 중복 지원이라고 경고창 띄우기
			model.addAttribute("errorMsg", "이미 지원하셨습니다.");
			model.addAttribute("url", "./getProjectsList");
			return "common/Error";
		}
	}

	@RequestMapping("/applyProjects") // 지원 폼 정보로 지원하기
	public String applyProjects(ProjApplicantsVO vo, HttpSession session) {
		// vo에 지원자 no 담기
		// vo.setMembersNo(2); /////////////////////////////////////membersId말고
		// members객체 넣을꺼임 바꿔야함!
		vo.setMembersNo(((MembersVO) session.getAttribute("members")).getMembersNo());
		vo.setProjNo((Integer) session.getAttribute("projNo"));
		projectsService.applyProjects(vo);
		return "redirect:/getProjectsList"; // 프로젝트 목록 페이지로 돌아감
	}

	@RequestMapping("/insertProjectForm") // 프로젝트 등록
	public String insertProjectForm(Model model) {
		
		model.addAttribute("tagList", tagsService.getTagList());	//등록폼으로 태그목록던져줌
		return "projects/insertProjectForm"; // 프로젝트 등록 폼으로 이동
	}

	@RequestMapping("/insertProject") // 프로젝트 등록
	public String insertProject(ProjectsVO vo, HttpSession session) {
		System.out.println(vo);
		vo.setMembersNo(((MembersVO) session.getAttribute("members")).getMembersNo());
		projectsService.insertProject(vo);
		return "redirect:/getProjectsList"; // 프로젝트 목록 페이지로 돌아감
	}

	@RequestMapping("/deleteProject") // 프로젝트 삭제
	public String deleteProject(ProjectsVO vo) {
		projectsService.deleteProject(vo);
		return "redirect:/getProjectsList"; // 프로젝트 목록 페이지로 돌아감
	}

	@InitBinder // 컨트롤러 들어옵면 이거 먼저 실행하고 매핑한다.
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor2(format, false));
	}

	@RequestMapping("/updateProjectForm") // 프로젝트 수정
	public String updateProjectForm(ProjectsVO vo, Model model ) {
		// 프로젝트 정보 가져와서
		model.addAttribute("vo", vo); //모델에 담아서 다음 페이지로 넘김
		
		System.out.println("수정 컨트롤러:::::::::::::::::::::::::::::::::::::::::::::::" + vo);
		
		model.addAttribute("tagList", tagsService.getTagList());	//수정폼으로 태그목록(Tags테이블에 있는거)던져줌
		
		model.addAttribute("divTagList", tagsService.divTag(vo.getProjTags())); //게시글에 등록된 태그 잘라주는거
		
		return "projects/updateProjectForm"; // 프로젝트 수정 폼으로 이동
	}
	
	@RequestMapping("/updateProject")
	public String updateProject(ProjectsVO vo) {
		
		System.out.println(vo);
		
		projectsService.updateProject(vo);
		
		
		return "redirect:/getProjects?projNo=" + vo.getProjNo(); // 프로젝트 상세 페이지
	}
	
	@RequestMapping("/kakao") //카카오메시지 보내기 임시 페이지
	public String kakao() {
		return "projects/kakao";
	}
	
	
}