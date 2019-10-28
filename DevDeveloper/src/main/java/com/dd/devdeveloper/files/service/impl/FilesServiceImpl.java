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
	public List<FilesVO> getfilesList(FilesVO vo) {		// 파일 리스트 출력
		return filesDAO.getfilesList();
	}
	
	@Override
	public FilesVO getfuds(FilesVO vo) { // 단건 조회
		return filesDAO.getfuds(vo);
	}

	

}
