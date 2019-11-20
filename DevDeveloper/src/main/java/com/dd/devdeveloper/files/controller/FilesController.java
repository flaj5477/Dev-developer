package com.dd.devdeveloper.files.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;
import com.dd.devdeveloper.files.service.FilesService;
import com.dd.devdeveloper.files.service.impl.FilesDAO;
import com.dd.devdeveloper.members.MembersVO;

@Controller
//@SessionAttributes("files")
public class FilesController {

	@Autowired
	FilesService filesService;
	@Autowired
	FilesDAO filesDAO;

	// 파일 리스트 맵핑
	@RequestMapping("/getFilesList")
	public String getFilesList(Model model, Paging paging, FilesVO vo, HttpServletRequest request) { // Jsp에서 보내온 정보들이
																										// //자동으로 vo안에
																										// // 들어간다
		HttpSession session = request.getSession();
//		System.out.println(vo.getUpperFolder());
//		System.out.println(vo.getFilesNo());

		Integer projNo = (Integer) session.getAttribute("projNo");
		vo.setProjNo(1); // projNo 페이지 만들어지면 갈아끼울것
		if (vo.getUpperFolder() != null)
			model.addAttribute("filesRoute", filesService.getFilesRoute(vo));
		model.addAttribute("list", filesService.getFilesList(paging, vo)); // 서비스impl 실행해서 모델에 담는다
		model.addAttribute("projNo", projNo);
		model.addAttribute("paging", paging);
		return "files/filesList";
	}

	// 파일 업로드
	@RequestMapping("/filesUpload")
	public String filesUpload(FilesVO vo, MultipartHttpServletRequest multipart, HttpServletRequest request,
			HttpSession session, List<MultipartFile> uploadFile) {

		Integer projNo = (Integer) session.getAttribute("projNo");
		vo.setProjNo(1); // projNo 페이지 만들어지면 갈아끼울것

		for (int i = 0; i < uploadFile.size(); i++) {
			// 첨부파일 업로드하고 파일명 조회
			MultipartFile multipartFile = uploadFile.get(i); // 넘어오는 jsp페이지의 멀티파트파일 name
			String path = "";
			if (multipartFile != null && multipartFile.getSize() > 0) {

				// 파일명
				String filesName = multipartFile.getOriginalFilename();
				// 업로드 폴더로 파일 이동
				path = request.getSession().getServletContext().getRealPath("/resources/upload");
				System.out.println("====================" + path);
				File imageFile = new File(path, filesName);

				System.out.println("처음 파일 위치" + path);

				try {
					// 파일 중복되면 rename
					// vo.setMembersNo(membersNo); 얘 세션 받아와서 넘겨
					vo.setFilesType("F");
					vo.setFilesSize(multipartFile.getSize());
					vo.setUploadFilename(filesName);
					multipartFile.transferTo(imageFile);

					System.out.println("이동 한 파일 위치" + path);
				} catch (IOException e) {
					e.printStackTrace();
				}
				// action="filesUpload?projNo=${projNo}"
			}
			int membersNo = ((MembersVO) session.getAttribute("members")).getMembersNo();
			vo.setMembersNo(membersNo);
			vo.setFilesPath(path);

			System.out.println("------------------------------------프로젝트 넘버" + vo.getProjNo());
			filesService.filesUpload(vo);
		}
		return "redirect:/getFilesList?upperFolder=" + vo.getUpperFolder();
	}

	// 파일 다운로드
	@RequestMapping("/download")
	public void filesDownload(HttpServletRequest request, HttpServletResponse response, FilesVO vo) {
		String fileName = filesService.getFilesPath(vo);
		Path file = Paths.get(fileName);
		int fileName1 = (fileName.lastIndexOf("\\") + 1);
		fileName = fileName.substring(fileName1);
		if (Files.exists(file)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment; filename=" + fileName);
			try {
				Files.copy(file, response.getOutputStream()); // 다운로드
				response.getOutputStream().flush();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

	// 새파일 인설트

	// 중요 파일 체크기능
	@ResponseBody
	@RequestMapping(value = "/filesImport", method = RequestMethod.POST)
	public String filesImport(FilesVO vo) {
		System.out.println(vo);
		filesService.filesImport(vo);
		return "redirect:getFilesList"; // 파일 리스트 페이지로 돌아감
	}

	// 중요파일 리스트
	@RequestMapping("/getFilesImport") // 중요 파일 리스트 보여주는..
	public String getfilesImport(Model model, Paging paging, FilesVO vo, HttpServletRequest request) {
		model.addAttribute("list", filesService.getImportList(paging, vo));
		model.addAttribute("paging", paging);
		return "files/filesImport";
	}

	// 휴지통 체크
	@ResponseBody
	@RequestMapping(value = "/filesTrash", method = RequestMethod.POST)
	public String filesTrash(FilesVO vo) {
		System.out.println(vo);
		filesService.filesTrash(vo);
		return "redirect:getFilesTrash";
	}

	// 휴지통 리스트
	@RequestMapping("/getFilesTrash")
	public String getfilesTrash(Model model, Paging paging, FilesVO vo, HttpServletRequest request) {
		model.addAttribute("list", filesService.getTrashList(paging, vo));
		model.addAttribute("paging", paging);
		return "files/filesTrash";
	}

	// 삭제 //서버에 있는 파일도 지워야함
	@RequestMapping("/deleteFiles")
	public String deleteFiles(FilesVO vo) {
		filesService.deleteFiles(vo);
		return "redirect:/getFilesTrash";
	}

	// 검색
	@RequestMapping("/filesSearch")
	public String getfilesSearch(FilesVO vo, Paging paging, Model model) {
		model.addAttribute("list", filesService.getFilesSearch(paging, vo));
		return "files/filesSearch";
	}

}