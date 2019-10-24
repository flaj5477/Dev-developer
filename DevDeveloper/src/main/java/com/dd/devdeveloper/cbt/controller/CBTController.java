package com.dd.devdeveloper.cbt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.service.CBTService;

@Controller
public class CBTController {
	
	@Autowired
	CBTService cbtService;
	
	//record
	@RequestMapping("cbt/index")
	public String getTestJudg(TestsRecordVO recvo, Model model) {
		model.addAttribute("tr", cbtService.getTestJudg(recvo));
		return "cbt/jsp/index";
	}
	
	//tests
	@RequestMapping("cbt/levelChoice")
	public String setlevelChoice() {
		return "cbt/jsp/levelChoice";
	}
}
