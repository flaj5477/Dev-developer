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
	
	public List<FilesVO> getfilesList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("FilesDAO.getfilesList");
	}
	
	
	public FilesVO getfuds(FilesVO vo) {
		return mybatis.selectOne("FilesDAO.getfuds", vo);
	}

}
