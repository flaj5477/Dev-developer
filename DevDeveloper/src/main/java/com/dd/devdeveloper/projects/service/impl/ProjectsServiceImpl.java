package com.dd.devdeveloper.projects.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.projects.service.ProjectsService;

@Service
public class ProjectsServiceImpl implements ProjectsService {

	@Autowired ProjectsDAO projectsDAO;
	
	@Override
	public List<ProjectsVO> getProjectsList(ProjectsVO vo) {	//프로젝트 리스트 출력
		// TODO Auto-generated method stub
		return projectsDAO.getProjectsList();
	}

	@Override
	public ProjectsVO getProjects(ProjectsVO vo) {	//프로젝트 상세 출력
		// TODO Auto-generated method stub
		return projectsDAO.getProjects(vo);
	}

}
