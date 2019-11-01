package com.dd.devdeveloper.projects.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.projects.ProjParticipantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

@Repository
public class ProjectsDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProjectsVO> getProjectsList(ProjectsVO vo) {
		return mybatis.selectList("ProjectsDAO.getProjectsList", vo);
	}
	
	public ProjectsVO getProjects(ProjectsVO vo) {
		return mybatis.selectOne("ProjectsDAO.getProjects", vo);
	}

	//프로젝트 지원 
	public void applyProjects(ProjParticipantsVO vo) {	
		// TODO Auto-generated method stub
		mybatis.insert("ProjectsDAO.applyProjects", vo);
	}

	//프로젝트 전체 갯수 가져오기
	public int getCountWiki(ProjectsVO vo) {
		return mybatis.selectOne("ProjectsDAO.getCountProj", vo);
	}
}
