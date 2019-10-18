package com.dd.devdeveloper.projects.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.projects.ProjectsVO;

@Repository
public class ProjectsDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProjectsVO> getProjectsList() {
		return mybatis.selectList("ProjectsDAO.getProjectsList");
	}
}
