package com.dd.devdeveloper.files.service.impl;


import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.common.paging.Paging;
import com.dd.devdeveloper.files.FilesVO;
import com.dd.devdeveloper.files.service.FilesService;

@Service
public class FilesServiceImpl implements FilesService {
	
	@Autowired FilesDAO filesDAO;

	@Override
	public List<LinkedHashMap<String, Object>> getFilesList(Paging paging, FilesVO vo) { // 페이징 설정
		if(paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10); // 게시글 뿌려주는것
		paging.setPageSize(5); // 하단 페이지 목록 수
		
		paging.setTotalRecord(filesDAO.getConuntFiles(vo)); // 전체 개수 가져온 뒤 set
		
		vo.setFirst(paging.getFirst()); // 시작 레코드 번호
		vo.setLast(paging.getLast());	// 마지막 레코드 번호
		
		List<LinkedHashMap<String, Object>> filesList = filesDAO.getFilesList(vo);
		
		return  filesList;
	}
	
	
	@Override
	public FilesVO getFiles(FilesVO vo) { //파일 상세 출력
		return filesDAO.getFiles(vo);
	}

}
