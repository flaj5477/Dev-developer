package com.dd.devdeveloper.dashboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

public interface DashboardService {

	//활동로그 가져오기
	public void getActivityLogList(DashboardVO vo);
	
	//프로젝트 지원 상태 가져오기
	public DashboardVO getProjApplyStatus(DashboardVO vo);
	
	//프로필 정보 가져오기
	public MembersVO getMembers(MembersVO vo);
	
	//프로젝트공고에 지원한 지원자 리스트
	public List<ProjApplicantsVO> getProjApplicantsList(ProjApplicantsVO projParticipantsVO);
	
	//회원의 프로젝트 지원상태 상세 모달 가져옴
	public List<ProjApplicantsVO> getProjStatusDetail(ProjApplicantsVO vo);
	
	//프로젝트 지원 취소
	public void deleteApply(ProjApplicantsVO vo);
	
	//프로젝트 승인 확인
	public void updateApplyParticipantIn(ProjApplicantsVO vo);
	
	//프로젝트 지원 승인(프로젝트 pm이 지원 상태를 승인 상태로 바꾸는 것)
	public void updateApplytoApproved(ProjApplicantsVO vo);

	//내가 올린 프로젝트 리스트
	 public List<ProjectsVO> getProjects(ProjectsVO projectsVO);

	


	
	//Q&A리스트
	
	//위키리스트
	
	//CBT기록
	
}
