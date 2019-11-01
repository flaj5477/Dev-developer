package com.dd.devdeveloper.projects.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.board.BoardVO;
import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.projects.ProjParticipantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;
import com.dd.devdeveloper.projects.service.ProjectsService;

@Service
public class ProjectsServiceImpl implements ProjectsService {

	@Autowired ProjectsDAO projectsDAO;
	
	@Override
	public List<ProjectsVO> getProjectsList(Paging paging, ProjectsVO vo) {	//프로젝트 리스트 출력

		//페이징 처리
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 몇개뿌릴지?
		paging.setPageSize(5); // 하단 페이지목록 개수

		// 전체 건수
		paging.setTotalRecord(projectsDAO.getCountWiki(vo)); // 전체건수 가져와서 set

		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		return projectsDAO.getProjectsList(vo);
	}

	@Override
	public ProjectsVO getProjects(ProjectsVO vo) {	//프로젝트 상세 출력
		// TODO Auto-generated method stub
		return projectsDAO.getProjects(vo);
	}

	@Override
	public void applyProjects(ProjParticipantsVO vo) {		//프로젝트 지원
		// TODO Auto-generated method stub
		projectsDAO.applyProjects(vo);
	}


}
