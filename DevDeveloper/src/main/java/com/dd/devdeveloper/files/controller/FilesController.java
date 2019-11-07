package com.dd.devdeveloper.files.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	// 파일 업로드
	@RequestMapping("/form")
	public String form() {
		System.out.println("fffffhhhhhhhh");
		return "form";
	}

//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	public String upload(@RequestParam("file") MultipartFile multipartFile) {
//		// log.info("### upload");
//		File targetFile = new File("/home1/irteam/" + multipartFile.getOriginalFilename());
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);
//			e.printStackTrace();
//		}
//		return "redirect:getFilesList";
//	}


	@RequestMapping(value = "/multipartUpload.do", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Object> multipartUpload(MultipartHttpServletRequest request) throws Exception { 
		List<MultipartFile> fileList = request.getFiles("file"); 
		String path = application.getRealPath("[경로]"); 
		File fileDir = new File(path); 
		if (!fileDir.exists()) { 
			fileDir.mkdirs(); 
		} 
		long time = System.currentTimeMillis(); 
		for (MultipartFile mf : fileList) { 
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
			String saveFileName = String.format("%d_%s", time, originFileName); 
			try { 
					// 파일생성
				mf.transferTo(new File(path, saveFileName)); 
				} catch (Exception e) { 
					e.printStackTrace(); 
					} 
			} 
		}
	

		
	
	// 백업파일 다운로드

//	@RequestMapping("/download/{backupFileNm:.+}")
//	public void downloadBackupResource(HttpServletRequest request, HttpServletResponse response,
//			@PathVariable("backupFileNm") String fileName) {
//		Path path = Paths.get(filesPath, filesTitle);
//		if (Files.exists(path)) {
//			response.setContentType("application/octet-stream;charset=UTF-8"); // 파일의 타입
//			response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
//			try {
//				Files.copy(path, response.getOutputStream());
//				response.getOutputStream().flush();
//			} catch (IOException ex) {
//				ex.printStackTrace();
//			}
//		}
//	}

	@RequestMapping("/getFilesImport") // 중요 파일 뿌려주는? public String
	public String getfilesImport(Model model, Paging paging, FilesVO vo, HttpServletRequest request) {
		model.addAttribute("list", filesService.getImportList(paging, vo));
		model.addAttribute("paging", paging);
		return "files/filesImport";

	}

	// 중요 파일
	@ResponseBody
	@RequestMapping(value = "/filesImport", method = RequestMethod.POST)
	public String filesImport(@ModelAttribute FilesVO vo) {
		System.out.println(vo);
		filesService.filesImport(vo);
		return "redirect:getFilesList"; // 파일 리스트 페이지로 돌아감
	}

	// 휴지통
	@RequestMapping("/filesTrash")
	public String filesTrash(FilesVO vo) {
		filesService.filesTrash(vo);
		return "redirect:getFilesList";
	}

}
