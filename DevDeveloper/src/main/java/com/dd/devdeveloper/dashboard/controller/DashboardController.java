package com.dd.devdeveloper.dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.service.DashboardService;

@Controller
public class DashboardController {
	
	//@Autowired DashboardService dashboardService;
	
	@RequestMapping("/getDashboard")
	public String getDashboard(ActivityLogVO vo, Model model) {
		System.out.println(vo);
		//model.addAttribute("activityLog", dashboardService.getActivityList(vo));
		
		return "dashboard/dashboard";
	}
}
