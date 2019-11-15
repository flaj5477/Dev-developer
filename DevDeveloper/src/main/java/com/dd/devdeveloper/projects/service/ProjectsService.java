package com.dd.devdeveloper.projects.service;

import java.util.List;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

public interface ProjectsService {
	
	
	//전체 조회
	List<ProjectsVO> getProjectsList(Paging paging, ProjectsVO vo);

	//상세 프로젝트 조회
	ProjectsVO getProjects(ProjectsVO vo);

	//프로젝트 지원
	void applyProjects(ProjApplicantsVO vo);
	
	//프로젝트 지원 전 중복 검사
	int applyDuplicationInspect(ProjApplicantsVO vo);

	//프로젝트 지원 전 등급 검사
  int projRequireInspect(ProjApplicantsVO vo);
  
  //프로젝트 입력
  void insertProject(ProjectsVO vo);
  
  //프로젝트 삭제
  void deleteProject(ProjectsVO vo);
  
  //프로젝트 수정
  void updateProject(ProjectsVO vo);
}
