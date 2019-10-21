package com.dd.devdeveloper.cbt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dd.devdeveloper.cbt.service.CBTService;

@Controller
public class CBTController {
	
	@Autowired
	CBTService cbtService;
}
