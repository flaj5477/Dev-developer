package com.dd.devdeveloper.files.service;

import java.util.List;

import com.dd.devdeveloper.files.FilesVO;

public interface FilesService {
	// 파일 전체 조회
	List<FilesVO> getFilesList(FilesVO vo);
	
	//파일 상세 조회
	FilesVO getFiles(FilesVO vo);
	
	

		
	

}
