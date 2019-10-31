package com.dd.devdeveloper.dashboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.members.MembersVO;

public interface DashboardService {

	//활동로그 가져오기
	public void getActivityLogList(DashboardVO vo);
	
	//프로젝트 지원 상태 가져오기
	public void getProjApplyStatus(DashboardVO vo);
	
	//프로젝트공고에 지원한 지원자 리스트
	public void getProjApplicantsList(DashboardVO vo);
	
	//Q&A리스트
	
	//위키리스트
	
	//CBT기록
	
}
