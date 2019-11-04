package com.dd.devdeveloper.cbt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.TestsVO;
import com.dd.devdeveloper.cbt.service.CBTService;
import com.dd.devdeveloper.members.MembersVO;

@Controller
public class CBTController {
	
	@Autowired
	CBTService cbtService;
	
	@RequestMapping("cbt/index")
	public String getTestJudg(TestsRecordVO recvo, Model model, HttpSession session) {
		MembersVO membersNo = (MembersVO) session.getAttribute("members");
		recvo.setMembersNo(membersNo.getMembersNo());
		model.addAttribute("tr", cbtService.getTestJudg(recvo));
		return "cbt/index";
	}
	
	@RequestMapping("cbt/choice")
	public String setChoice() {
		return "cbt/choice";
	}
	
	@RequestMapping(value="cbt/getTestList", method=RequestMethod.GET)
	@ResponseBody
	public List<TestsVO> getTestList() {
		return cbtService.getTestList();
	}
	
	@RequestMapping("cbt/ready") 
	public String ready() {
		return "cbt/ready";
	}
	
	@RequestMapping(value="cbt/getTestInfo/{level}", method=RequestMethod.GET)
	@ResponseBody
	public TestsVO getTest(@PathVariable int level, TestsVO tvo) {
		tvo.setTestsLevel(level);
		return cbtService.getTest(tvo);
	}
	
	@RequestMapping("cbt/examination") 
	public String setExamination(TestsRecordVO recvo) { 
		//recvo.setMembersNo(membersNo);
		//recvo.setTestsNo(testsNo);
		return "cbt/examination";
	}
}
