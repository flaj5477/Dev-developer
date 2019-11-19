package com.dd.devdeveloper.files.service.impl;

import java.io.File;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;
import com.dd.devdeveloper.files.service.FilesService;

@Service
public class FilesServiceImpl implements FilesService {

	@Autowired
	FilesDAO filesDAO;

	@Override
	public List<LinkedHashMap<String, Object>> getFilesList(Paging paging, FilesVO vo) { // 페이징 설정
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(5); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<LinkedHashMap<String, Object>> filesList = filesDAO.getFilesList(vo);

		return filesList;
	}

	@Override
	public List<LinkedHashMap<String, Object>> getImportList(Paging paging, FilesVO vo) { //
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(5); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<LinkedHashMap<String, Object>> filesList = filesDAO.getImportList(vo);

		return filesList;
	}

	@Override
	public List<LinkedHashMap<String, Object>> getTrashList(Paging paging, FilesVO vo) {
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(5); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<LinkedHashMap<String, Object>> filesList = filesDAO.getTrashList(vo);
		return filesList;
	}

	@Override
	public void filesUpload(FilesVO vo) { // 여기서 DAO ㄱㄱ
		filesDAO.filesUpload(vo);

	}

	@Override
	public void filesUpdate(FilesVO vo) {

	}

	@Override
	public void filesImport(FilesVO vo) {
		filesDAO.filesImport(vo);

	}

	@Override
	public void filesTrash(FilesVO vo) {
		filesDAO.filesTrash(vo);
	}

	@Override
	public String getFilesPath(FilesVO vo) {
		String path = null;
		path = filesDAO.getFiles(vo).getFilesPath();
		return path;
	}

	@Override
	public void deleteFiles(FilesVO vo) {
		String path = filesDAO.getFiles(vo).getFilesPath();
		File files = new File(path);
		
		if (files.exists()) {
			if (files.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다.");
		}
		filesDAO.deleteFiles(vo);

	}

	@Override
	public List<LinkedHashMap<String, Object>> getFilesSearch(Paging paging, FilesVO vo) {
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(5); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<LinkedHashMap<String, Object>> filesList = filesDAO.getfilesSearch(vo);

		return filesList;
	}
	
	// 파일 루트
	@Override
	public List<FilesVO> getFilesRoute(FilesVO vo) {
		return filesDAO.getFilesRoute(vo);
		
	}

//	public List<LinkedHashMap<String, Object>> filesSearch(Paging paging, FilesVO vo) { // 페이징 설정
//		if(paging.getPage() == null) {
//			paging.setPage(1);
//		}
//		paging.setPageUnit(10); // 게시글 뿌려주는것
//		paging.setPageSize(5); // 하단 페이지 목록 수
//		
//		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set
//		
//		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
//		vo.setLast(paging.getLast());	// 마지막 레코드 번호
//		
//		List<LinkedHashMap<String, Object>> filesList = filesDAO.filesSearch(vo);
//		
//		return  filesList;
//	}

}
