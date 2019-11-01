package com.dd.devdeveloper.files.service.impl;


import java.util.LinkedHashMap;
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
	public List<LinkedHashMap<String, Object>> getFilesList(FilesVO vo) {
		return mybatis.selectList("FilesDAO.getFilesList", vo);
	}
	
	// 파일 상세
	public FilesVO getFiles(FilesVO vo) {
		return mybatis.selectOne("FilesDAO.getFiles", vo);
	}
	
	//검색하면 검색한거 개수 가져오는
	public int getConuntFiles(FilesVO vo) {
		return mybatis.selectOne("FilesDAO.getCountFiles", vo);
	}

}
