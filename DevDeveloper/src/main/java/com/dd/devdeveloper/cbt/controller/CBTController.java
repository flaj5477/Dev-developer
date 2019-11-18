package com.dd.devdeveloper.cbt.controller;

import java.util.Collections;
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
		model.addAttribute("tr", cbtService.getTestJudg(recvo)); // Command(vo) 객체를 담을 때 model.addAttribute ,,
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
	public String examination() { 
		return "/notiles/cbt/examination";
	}
	
	@RequestMapping("cbt/viewer") 
	public String viewer(TestsRecordVO recvo) {
		cbtService.cbtInsert(recvo);
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
	
	@RequestMapping(value="cbt/solutionProc",
					method=RequestMethod.POST,
					consumes="application/json")
	@ResponseBody
	public Map<String,Boolean> solutionProc(@RequestBody Map<String,Object> cd) {
		cbtService.solutionProc(cd);
		return Collections.singletonMap("result",true); // repsonse 값 하나라도 넘겨주기위해?
	}
	
	@RequestMapping("cbt/processing")
	public String processing() {
		return "/notiles/cbt/processing";
	}
	
	@RequestMapping(value="cbt/getResult/{rid}",
					method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getResult(@PathVariable int rid, TestsRecordVO recvo) {
		recvo.setTestsApplyNo(rid);
		return cbtService.getResult(recvo);
	}
	
	@RequestMapping(value="getRecordList/{user}",
			method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> getRecordList(@PathVariable int user, TestsRecordVO recvo) {
	recvo.setMembersNo(user);
	return cbtService.getRecordList(recvo);
	}
}
