package com.dd.devdeveloper.projects.service;

import java.util.List;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.projects.ProjParticipantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

public interface ProjectsService {
	
	
	//전체 조회
	List<ProjectsVO> getProjectsList(ProjectsVO vo);

	//상세 프로젝트 조회
	ProjectsVO getProjects(ProjectsVO vo);

	//프로젝트 지원
	void applyProjects(ProjParticipantsVO vo);
}
