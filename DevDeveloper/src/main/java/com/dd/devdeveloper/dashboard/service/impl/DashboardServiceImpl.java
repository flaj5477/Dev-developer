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
	
	@Autowired ActivityLogDAO activityLogDAO;

	@Override
	public void getActivityLogList(DashboardVO vo) { //활동로그 가져오기
		// TODO Auto-generated method stub
		activityLogDAO.getActivityLogList(vo);
	}

}
