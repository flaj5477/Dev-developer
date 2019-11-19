package com.dd.devdeveloper.projects.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

@Repository
public class ProjectsDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProjectsVO> getProjectsList(ProjectsVO vo) {
		return mybatis.selectList("ProjectsDAO.getProjectsList", vo);
	}
	
	//프로젝트 상세 가져오기
	public ProjectsVO getProjects(ProjectsVO vo) {
		return mybatis.selectOne("ProjectsDAO.getProjects", vo);
	}

	//프로젝트 지원 
	public void applyProjects(ProjApplicantsVO vo) {	
		// TODO Auto-generated method stub
		mybatis.insert("ProjectsDAO.applyProjects", vo);
	}

	//프로젝트 전체 갯수 가져오기
	public int getCountWiki(ProjectsVO vo) {
		return mybatis.selectOne("ProjectsDAO.getCountProj", vo);
	}
	
	 //프로젝트 지원 전 중복 검사
  public int applyDuplicationInspect(ProjApplicantsVO vo) {
    System.out.println("프로젝트 지원 전 중복 검사 DAO까지 왔땅");
    return mybatis.selectOne("ProjectsDAO.applyDuplicationInspect", vo);
  }

  //프로젝트 지원 전 등급 검사
  public int projRequireInspect(ProjApplicantsVO vo) {
    System.out.println("프로젝트 지원 전 등급 검사 DAO까지 왔땅");
    return mybatis.selectOne("ProjectsDAO.projRequireInspect", vo);
  }
  
  //프로젝트 입력
  public void insertProject(ProjectsVO vo) {
	  mybatis.insert("ProjectsDAO.insertProject",vo);
  }
  
  //프로젝트 삭제
  public void deleteProject(ProjectsVO vo) {
	  mybatis.delete("ProjectsDAO.deleteProject", vo);
  }
  
  //프로젝트 수정
  public void updateProject(ProjectsVO vo) {
	  mybatis.update("ProjectsDAO.updateProject", vo);
  }
}
