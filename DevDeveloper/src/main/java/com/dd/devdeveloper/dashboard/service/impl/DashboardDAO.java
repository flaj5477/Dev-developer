package com.dd.devdeveloper.dashboard.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjParticipantsVO;


@Repository
public class DashboardDAO {
	
	@Autowired SqlSessionTemplate mybatis; 
	Logger logger = LoggerFactory.getLogger(DashboardDAO.class);

	//활동로그 select
	public void getActivityLogList(DashboardVO vo) { 
		mybatis.selectList("DashboardDAO.getActivityLogList", vo); //리턴을 안해도 vo에 자동으로 들어간다
	}
	
	//프로젝트 지원상태 
	public DashboardVO getProjApplyStatus(DashboardVO vo) {
		return mybatis.selectOne( "DashboardDAO.getProjApplyStatus" , vo);
	}
	
	//회원의 프로젝트 지원상태 상세 모달 가져옴
	public List<ProjParticipantsVO> getProjStatusDetail(ProjParticipantsVO vo) {
		return mybatis.selectList("DashboardDAO.getProjStatusDetail", vo);
	}

}
