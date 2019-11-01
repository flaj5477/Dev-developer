package com.dd.devdeveloper.files.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;

public interface FilesService {
		
	// 파일 전체 조회
	List<LinkedHashMap<String, Object>> getFilesList(Paging paging, FilesVO vo);
				
	//파일 상세 조회
	FilesVO getFiles(FilesVO vo);
	
}
