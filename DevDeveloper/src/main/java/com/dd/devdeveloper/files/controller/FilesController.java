package com.dd.devdeveloper.files.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;
import com.dd.devdeveloper.files.service.FilesService;

@Controller
public class FilesController {

	@Autowired
	FilesService filesService;
	
	// 파일 리스트 맵핑
	@RequestMapping("/getFilesList")
	public String getFilesList(Model model, Paging paging, FilesVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
        Integer projNo = (Integer) session.getAttribute("projNo");
        vo.setProjNo(1); // projNo 페이지 만들어지면 갈아끼울것
		model.addAttribute("list", filesService.getFilesList(paging,vo));
		model.addAttribute("paging", paging);
		return "files/filesList";
	}
	
	//파일 상세 맵핑
	@RequestMapping("/getFiles") 
	public String getFiles(FilesVO vo, Model model) {
		model.addAttribute("file", filesService.getFiles(vo));
		return "files/files";
	}

}
