package com.dd.devdeveloper.dashboard.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.dashboard.service.DashboardService;
import com.dd.devdeveloper.members.MembersVO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired DashboardDAO dashboardDAO;

	@Override	//활동로그 가져오기
	public void getActivityLogList(DashboardVO vo) { 
		// TODO Auto-generated method stub
		dashboardDAO.getActivityLogList(vo);
	}

	@Override	//프로젝트 지원 상태 가져오기
	public DashboardVO getProjApplyStatus(DashboardVO vo) {
		return dashboardDAO.getProjApplyStatus(vo);
	}

	@Override	//프로젝트 지원자 리스트 가져오기
	public void getProjApplicantsList(DashboardVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	

}
