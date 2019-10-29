package com.dd.devdeveloper.dashboard.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.members.MembersVO;

@Repository
public class ActivityLogDAO {
	
	@Autowired SqlSessionTemplate mybatis; 

	public void getActivityLogList(DashboardVO vo) { //활동로그 select
		// TODO Auto-generated method stub
		
		mybatis.selectList("ActivityLogDAO.getActivityLogList", vo); //리턴을 안해도 vo에 자동으로 들어간다
	}

}
