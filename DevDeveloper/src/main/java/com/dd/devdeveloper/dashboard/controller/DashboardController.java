package com.dd.devdeveloper.dashboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.dashboard.service.DashboardService;
import com.dd.devdeveloper.members.MembersVO;

@Controller
public class DashboardController {
	
	@Autowired DashboardService dashboardService;
	
	@RequestMapping("/getDashboard")
	public String getDashboard(ActivityLogVO vo, Model model, HttpSession session) {
		
		DashboardVO dashboardVO = new DashboardVO();
		int membersNo = ((MembersVO)session.getAttribute("members")).getMembersNo();
		dashboardVO.setMemberNo( membersNo );//세션의 회원번호를 가져와서 vo에 담는다 
		
		//회원의 활동로그 가져옴
		dashboardService.getActivityLogList(dashboardVO);
		model.addAttribute("activityLogList", dashboardVO.getActivityLogList() );
		
		//회원의 프로젝트 지원 상태 가져옴
		dashboardVO = dashboardService.getProjApplyStatus(dashboardVO);
		model.addAttribute("projApply", dashboardVO.getProjApply());
		model.addAttribute("projApprove", dashboardVO.getProjApprove());
		model.addAttribute("projParticipant", dashboardVO.getProjParticipant());
		
		//회원이 올린 프로젝트공고에 지원한 지원자 리스트 가져옴
		
		//Q&A리스트 가져옴
		
		//위키리스트 가져옴
		
		//CBT기록 가져
		
		//return "dashboard/svgtest";

			return "dashboard/dashboard";
	}
}
