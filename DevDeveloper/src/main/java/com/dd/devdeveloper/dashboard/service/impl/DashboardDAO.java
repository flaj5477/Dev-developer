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
import com.dd.devdeveloper.projects.ProjApplicantsVO;
import com.dd.devdeveloper.projects.ProjectsVO;

@Repository
public class DashboardDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	Logger logger = LoggerFactory.getLogger(DashboardDAO.class);

	// 활동로그 select
	public void getActivityLogList(DashboardVO vo) {
		mybatis.selectList("DashboardDAO.getActivityLogList", vo); // 리턴을 안해도 vo에 자동으로 들어간다
	}

	// 대시보드 프로필 정보 가져오기
	public MembersVO getMembers(MembersVO vo) {
		return mybatis.selectOne("DashboardDAO.getMembers", vo);
	}

	// 프로젝트 지원상태
	public DashboardVO getProjApplyStatus(DashboardVO vo) {
		return mybatis.selectOne("DashboardDAO.getProjApplyStatus", vo);
	}

	// 회원의 프로젝트 지원상태 상세 모달 가져옴
	public List<ProjApplicantsVO> getProjStatusDetail(ProjApplicantsVO vo) {
		return mybatis.selectList("DashboardDAO.getProjStatusDetail", vo);
	}

	// 프로젝트 지원 취소
	public void deleteApply(ProjApplicantsVO vo) {
		mybatis.delete("DashboardDAO.deleteApply", vo);
	}

	// 프로젝트 승인 확인
	public void updateApplyParticipantIn(ProjApplicantsVO vo) {
		mybatis.update("DashboardDAO.updateApplyParticipantIn", vo);
	}

	// 프로젝트 지원자 리스트 가져오기
	public List<ProjApplicantsVO> getProjApplicantsList(ProjApplicantsVO projParticipantsVO) {
		return mybatis.selectList("DashboardDAO.getProjApplicantsList", projParticipantsVO);
	}

	// 내가 올린 프로젝트 리스트 가져오기
	public List<ProjectsVO> getMyProjects(ProjectsVO projectsVO) {
		return mybatis.selectList("DashboardDAO.getMyProjects", projectsVO);
	}

	// 프로젝트 지원 승인(프로젝트 pm이 지원 상태를 승인 상태로 바꾸는 것)
	public void updateApplytoApproved(ProjApplicantsVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("DashboardDAO.updateApplytoApproved", vo);
	}

}
