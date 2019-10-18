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
	public List<ProjectsVO> getBoardList(ProjectsVO vo) {
		// TODO Auto-generated method stub
		return projectsDAO.getProjectsList();
	}

}
