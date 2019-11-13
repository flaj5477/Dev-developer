package com.dd.devdeveloper.cbt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dd.devdeveloper.cbt.TestsQVO;
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
	
	@RequestMapping(value="cbt/getTestList",
					method=RequestMethod.GET)
	@ResponseBody
	public List<TestsVO> getTestList() {
		return cbtService.getTestList();
	}
	
	@RequestMapping("cbt/ready") 
	public String ready() {
		return "cbt/ready";
	}
	
	@RequestMapping(value="cbt/getTestInfo/{level}",
					method=RequestMethod.GET)
	@ResponseBody
	public TestsVO getTest(@PathVariable int level, TestsVO tvo) {
		tvo.setTestsNo(level);
		return cbtService.getTest(tvo);
	}
	
	@RequestMapping("cbt/examination") 
	public String setExamination(TestsRecordVO recvo, HttpSession session) { 
		MembersVO membersNo = (MembersVO) session.getAttribute("members");
		recvo.setMembersNo(membersNo.getMembersNo());
		//cbtService.cbtInsert(recvo);
		return "/notiles/cbt/examination";
	}
	
	@RequestMapping("cbt/viewer") 
	public String viewer() {
		return "/notiles/cbt/viewer";
	}
	
	@RequestMapping(value="cbt/getQuestList/{level}/{allocate}",
					method=RequestMethod.GET)
	@ResponseBody
	public List<TestsQVO> getQuestList(@PathVariable int level, @PathVariable int allocate, TestsQVO tqvo) {
		tqvo.setTestsNo(level);
		tqvo.setAllocate(allocate);
		return cbtService.getQuestList(tqvo);
	}
	
	@RequestMapping(value="getRecordList/{user}",
					method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> getRecordList(@PathVariable int user, TestsRecordVO recvo) {
		recvo.setMembersNo(user);
		return cbtService.getRecordList(recvo);
	}
	
	@RequestMapping(value="cbt/questionMapping",
					method=RequestMethod.POST,
					consumes="application/json")
	@ResponseBody
	public List<Map<String,String>> markedList(@RequestBody List<Map<String,String>> mark) {
		return cbtService.markedList(mark);
	}
}
