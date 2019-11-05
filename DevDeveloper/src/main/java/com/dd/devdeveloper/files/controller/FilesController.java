package com.dd.devdeveloper.files.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("list", filesService.getFilesList(paging, vo));
		model.addAttribute("paging", paging);
		return "files/filesList";
	}
	
	@RequestMapping("/getFilesImport") // 중요 파일 뿌려주는?
	public String getfilesImport(Model model, Paging paging, FilesVO vo, HttpServletRequest request) {
		model.addAttribute("list", filesService.getImportList(paging, vo));
		model.addAttribute("paging", paging);
		return "files/filesImport";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/filesImport", method=RequestMethod.POST)
	public String filesImport(@ModelAttribute FilesVO vo) {
		System.out.println(vo);
		filesService.filesImport(vo);
		return "redirect:getFilesList"; //파일 리스트 페이지로 돌아감
	}
	
	@RequestMapping("/filesTrash")
	public String filesTrash(FilesVO vo) {
		filesService.filesTrash(vo);
		return "redirect:getFilesList";
	}
	
}
