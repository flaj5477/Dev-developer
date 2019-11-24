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
	public List<FilesVO> getFilesList(Paging paging, FilesVO vo) { // 페이징 설정
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(3); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<FilesVO> filesList = filesDAO.getFilesList(vo);

		for (FilesVO map : filesList) {
			map.setFilesSizeTrans(size2String(map.getFilesSize()));
			
		}
		return filesList;
	}
	
	public String size2String(long filesize) {
		Integer unit = 1024;
		if (filesize < unit) {
			return String.format("%d B", filesize);
		}
		int exp = (int) (Math.log(filesize) / Math.log(unit));

		return String.format("%.0f %s", filesize / Math.pow(unit, exp), "KMGTPE".charAt(exp - 1));
	}

	@Override
	public List<FilesVO> getImportList(Paging paging, FilesVO vo) { //
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(3); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<FilesVO> filesList = filesDAO.getImportList(vo);
		
		for (FilesVO map : filesList) {
			map.setFilesSizeTrans(size2String(map.getFilesSize()));
		}
		
		return filesList;
	}

	@Override
	public List<FilesVO> getTrashList(Paging paging, FilesVO vo) {
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(3); // 하단 페이지 목록 수

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<FilesVO> filesList = filesDAO.getTrashList(vo);
		
		for (FilesVO map : filesList) {
			map.setFilesSizeTrans(size2String(map.getFilesSize()));
		}
		
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
	public List<FilesVO> getFilesSearch(Paging paging, FilesVO vo) {
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(3); // 하단 페이지 목록 수 //이 부분 설정..

		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set

		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast()); // 마지막 레코드 번호

		List<FilesVO> filesList = filesDAO.getfilesSearch(vo);
		
		for (FilesVO map : filesList) {
			map.setFilesSizeTrans(size2String(map.getFilesSize()));
		}

		return filesList;
	}
	
	// 파일 루트
	@Override
	public List<FilesVO> getFilesRoute(FilesVO vo) {
		return filesDAO.getFilesRoute(vo);
		
	}

}
