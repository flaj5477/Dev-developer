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
		dashboardVO.setMemberNo( ((MembersVO)session.getAttribute("members")).getMembersNo() );//세션의 회원번호를 가져와서 vo에 담는다 
		
		dashboardService.getActivityLogList(dashboardVO);	
		
		model.addAttribute("activityLogList", dashboardVO.getActivityLogList() );
		
		return "dashboard/svgtest";
		//return "dashboard/dashboard";
	}
}
