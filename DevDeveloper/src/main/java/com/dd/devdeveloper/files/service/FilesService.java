package com.dd.devdeveloper.files.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;

public interface FilesService {
		
	// 파일 전체 조회
	List<FilesVO> getFilesList(Paging paging, FilesVO vo);
	
	// 임포트(중요) 조회
	List<FilesVO> getImportList(Paging paging, FilesVO vo);
	
	// 휴지통 조회
	List<FilesVO> getTrashList(Paging paging, FilesVO vo);
	
	// 검색
	List<FilesVO> getFilesSearch(Paging paging, FilesVO vo);
	 
	//파일 경로
	public String getFilesPath(FilesVO vo);
	
	// 업로드
	void filesUpload(FilesVO vo);
	
	// 수정
	void filesUpdate(FilesVO vo);
				
	// 임포트(중요)
	void filesImport(FilesVO vo);
	
	// 휴지통
	void filesTrash(FilesVO vo);
	
	// 삭제
	void deleteFiles(FilesVO vo);
	
	// 루트
	List<FilesVO> getFilesRoute(FilesVO vo);
	
}
