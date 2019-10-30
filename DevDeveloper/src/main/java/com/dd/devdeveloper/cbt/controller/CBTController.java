package com.dd.devdeveloper.cbt.controller;

import java.util.List;

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

@Controller
public class CBTController {
	
	@Autowired
	CBTService cbtService;
	
	@RequestMapping("cbt/index")
	public String getTestJudg(TestsRecordVO recvo, Model model) {
		model.addAttribute("tr", cbtService.getTestJudg(recvo));
		return "cbt/jsp/index";
	}
	
	@RequestMapping("cbt/levelChoice")
	public String setLevelChoice() {
		return "cbt/jsp/levelChoice";
	}
	
	@RequestMapping(value="cbt/getTestList", method=RequestMethod.GET)
	@ResponseBody
	public List<TestsVO> getTestList() {
		return cbtService.getTestList();
	}
}
