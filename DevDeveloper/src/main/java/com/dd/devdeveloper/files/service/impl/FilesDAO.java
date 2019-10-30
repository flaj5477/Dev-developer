package com.dd.devdeveloper.files.service.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.files.FilesVO;

@Repository
public class FilesDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 파일 전체
	public List<FilesVO> getFilesList() {
		return mybatis.selectList("FilesDAO.getFilesList");
	}
	
	// 파일 상세
	public FilesVO getFiles(FilesVO vo) {
		return mybatis.selectOne("FilesDAO.getFiles", vo);
	}

}
