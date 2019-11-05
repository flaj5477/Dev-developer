package com.dd.devdeveloper.dashboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjParticipantsVO;

public interface DashboardService {

	//활동로그 가져오기
	public void getActivityLogList(DashboardVO vo);
	
	//프로젝트 지원 상태 가져오기
	public DashboardVO getProjApplyStatus(DashboardVO vo);
	
	//프로젝트공고에 지원한 지원자 리스트
	public void getProjApplicantsList(DashboardVO vo);
	
	//회원의 프로젝트 지원상태 상세 모달 가져옴
	public List<ProjParticipantsVO> getProjStatusDetail(ProjParticipantsVO vo);
	
	//프로젝트 지원 취소
	public void deleteApply(ProjParticipantsVO vo);
	
	//Q&A리스트
	
	//위키리스트
	
	//CBT기록
	
}
