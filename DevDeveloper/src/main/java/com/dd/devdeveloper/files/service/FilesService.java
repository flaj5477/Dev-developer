package com.dd.devdeveloper.files.service;

import java.util.List;

import com.dd.devdeveloper.files.FilesVO;

public interface FilesService {
	//전체 조회
	List<FilesVO> getfudList(FilesVO vo);
	
	//파일 상세 조회
	FilesVO getfuds(FilesVO vo);
		
	

}
