package com.dd.devdeveloper.dashboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.members.MembersVO;

public interface DashboardService {

	//활동로그 가져오기
	public void getActivityLogList(DashboardVO vo);
	
	
}
