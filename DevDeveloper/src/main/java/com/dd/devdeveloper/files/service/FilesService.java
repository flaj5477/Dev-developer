package com.dd.devdeveloper.files.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;

public interface FilesService {
		
	// 파일 전체 조회
	List<LinkedHashMap<String, Object>> getFilesList(Paging paging, FilesVO vo);
	
	// 임포트(중요) 조회
	List<LinkedHashMap<String, Object>> getImportList(Paging paging, FilesVO vo);
	
	// 업로드
	void filesUpload(FilesVO vo);
	
	// 수정
	void filesUpdate(FilesVO vo);
				
	// 임포트(중요)
	void filesImport(FilesVO vo);
	
	// 휴지통
	void filesTrash(FilesVO vo);

}
