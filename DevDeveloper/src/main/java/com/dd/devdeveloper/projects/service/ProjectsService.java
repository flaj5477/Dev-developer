package com.dd.devdeveloper.projects.service;

import java.util.List;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.projects.ProjectsVO;

public interface ProjectsService {
	
	
	//전체 조회
	List<ProjectsVO> getBoardList(ProjectsVO vo);
}
