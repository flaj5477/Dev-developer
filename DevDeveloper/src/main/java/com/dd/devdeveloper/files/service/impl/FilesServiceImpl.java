package com.dd.devdeveloper.files.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.files.FilesVO;
import com.dd.devdeveloper.files.service.FilesService;

@Service
public class FilesServiceImpl implements FilesService {
	
	@Autowired FilesDAO filesDAO;

	@Override
	public List<FilesVO> getFilesList(FilesVO vo) { // 파일 전체 출력
		return filesDAO.getFilesList();
	}
	
	@Override
	public FilesVO getFiles(FilesVO vo) { //파일 상세 출력
		return filesDAO.getFiles(vo);
	}
	
	
	

	

}
