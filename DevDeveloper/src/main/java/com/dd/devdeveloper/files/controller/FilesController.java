package com.dd.devdeveloper.files.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.files.FilesVO;
import com.dd.devdeveloper.files.service.FilesService;

@Controller
public class FilesController {

	@Autowired
	FilesService filesService;
	
	@RequestMapping("/getFilesList")
	public String getFilesList(FilesVO vo, Model model) {
		model.addAttribute("list", filesService.getfilesList(null));
		return "files/filesList";
	}

}
