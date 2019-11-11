package com.dd.devdeveloper.dashboard.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.dashboard.service.DashboardService;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired DashboardDAO dashboardDAO;

	@Override	//활동로그 가져오기
	public void getActivityLogList(DashboardVO vo) { 
		dashboardDAO.getActivityLogList(vo);
	}

	@Override	//프로젝트 지원 상태 가져오기
	public DashboardVO getProjApplyStatus(DashboardVO vo) {
		return dashboardDAO.getProjApplyStatus(vo);
	}
	
  @Override //대시보드 프로필정보 가져오기
  public MembersVO getMembers(MembersVO vo) {
    return dashboardDAO.getMembers(vo);
  }
  
	

	@Override	//프로젝트 지원자 리스트 가져오기
	public List<ProjApplicantsVO> getProjApplicantsList(ProjApplicantsVO projParticipantsVO) {
	  return dashboardDAO.getProjApplicantsList(projParticipantsVO);
	}

	@Override 	//회원의 프로젝트 지원상태 상세 모달 가져옴
	public List<ProjApplicantsVO> getProjStatusDetail(ProjApplicantsVO vo) {
		return dashboardDAO.getProjStatusDetail(vo);
	}

  @Override //프로젝트 지원 취소
  public void deleteApply(ProjApplicantsVO vo) {
    dashboardDAO.deleteApply(vo);
  }

  @Override //프로젝트 승인 확인
  public void updateApplyParticipantIn(ProjApplicantsVO vo) {
    dashboardDAO.updateApplyParticipantIn(vo);
    
  }

  @Override //내가 올린 프로젝트 리스트 가져오기
  public List<ProjectsVO> getProjects(ProjectsVO projectsVO) {
    return dashboardDAO.getMyProjects(projectsVO);
  }

 


	
	

}
