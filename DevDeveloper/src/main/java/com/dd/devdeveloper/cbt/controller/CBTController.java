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
import com.dd.devdeveloper.members.service.MembersService;

@Controller
public class CBTController {
	
	@Autowired
	CBTService cbtService;
	@Autowired
	MembersService membersService;
	
	@RequestMapping("cbt/index")
	public String getTestJudg(TestsRecordVO recvo, Model model, HttpSession session) {
		MembersVO members = (MembersVO) session.getAttribute("members");
		recvo.setMembersNo(members.getMembersNo());
		model.addAttribute("tr", cbtService.getTestJudg(recvo)); // Command(vo) 객체를 담을 때 model.addAttribute
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
		return "cbt/examination";
	}
	
	@RequestMapping("cbt/insertRecord")
	//redirect 방식 : a요청을 하였을 때 서비스를 가지고 b로 이동하여 실행한다.
	public String cbtInsert(TestsRecordVO recvo, HttpSession session) {
		cbtService.cbtInsert(recvo);
		session.setAttribute("recvo",recvo);
		return "redirect:viewer"; 
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
	
	@RequestMapping(value="cbt/solutionProc",
					method=RequestMethod.POST,
					consumes="application/json")
	@ResponseBody
	public Map<String,Boolean> solutionProc(@RequestBody Map<String,Object> cd, HttpSession session) {
		cbtService.solutionProc(cd);
		// 멤버 등급 업데이트 후, members 세션 리로드 (조회)
		MembersVO members = (MembersVO) session.getAttribute("members");
		session.setAttribute("members",membersService.getmembers(members));
		return Collections.singletonMap("result",true); // response 객체에 값 넘겨주기위해 사용
		
	}
	
	@RequestMapping(value="cbt/getResult",
					method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getResult(HttpSession session) {
		TestsRecordVO recvo = (TestsRecordVO) session.getAttribute("recvo");
		Map<String,Object> resultMap = cbtService.getResult(recvo);
		return resultMap;
	}
	
	@RequestMapping(value="getRecordList/{user}",
					method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> getRecordList(@PathVariable int user, TestsRecordVO recvo) {
	recvo.setMembersNo(user);
	return cbtService.getRecordList(recvo);
	}
}
