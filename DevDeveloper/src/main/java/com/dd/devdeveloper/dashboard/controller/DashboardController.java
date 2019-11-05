package com.dd.devdeveloper.dashboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.dd.devdeveloper.dashboard.ActivityLogVO;
import com.dd.devdeveloper.dashboard.DashboardVO;
import com.dd.devdeveloper.dashboard.service.DashboardService;
import com.dd.devdeveloper.members.MembersVO;
import com.dd.devdeveloper.projects.ProjParticipantsVO;

@Controller
public class DashboardController {
	
	@Autowired DashboardService dashboardService;

	
	@RequestMapping("/getDashboard") //대시보드 페이지 가져오기
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
	
	
	//회원의 프로젝트 지원상태 상세 모달 가져옴
	@ResponseBody
	@RequestMapping(value="/getProjStatusDetail/{status}", method=RequestMethod.GET)
	public List<ProjParticipantsVO> getProjStatusDetail(	@PathVariable String status,
														ProjParticipantsVO vo, 
														HttpSession session, 
														//Model model,
														ModelMap map) {
		
		
		//세션에서 회원정보 가져와서 vo에 달고
		vo.setMembersNo( ((MembersVO)session.getAttribute("members")).getMembersNo() );
		vo.setStatus(status);
		
		//서비스 연결
		//model.addAttribute("statusDetail", dashboardService.getProjStatusDetail(vo));
		return dashboardService.getProjStatusDetail(vo);
	}
	
	
	//지원취소
	@RequestMapping("/deleteApply") 
	public String deleteApply(ProjParticipantsVO vo) {
	  dashboardService.deleteApply(vo);
	  return "redirect:/getDashboard";
	}
	
	//승인확인
	@RequestMapping("/updateApplyParticipantIn")
	public String updateApplyParticipantIn(ProjParticipantsVO vo) {
	  dashboardService.updateApplyParticipantIn(vo);
    return "redirect:/getDashboard";
	}
	
	//파일관리 페이지로 이동
	@RequestMapping("/moveToFileList")
	public String moveToFileList(ProjParticipantsVO vo, HttpSession session) {
	  session.setAttribute("projNo", vo.getProjNo());
	  System.out.println("세션확인!!!!!!!!!!!!!!!!!!!!!!!!!!!-> " + session.getAttribute("projNo"));
	  return "redirect:/getFilesList";
	}
	
}
