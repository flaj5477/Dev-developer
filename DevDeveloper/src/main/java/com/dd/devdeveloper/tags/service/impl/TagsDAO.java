package com.dd.devdeveloper.tags.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.tags.TagsVO;

@Repository
public class TagsDAO {
	
	@Autowired SqlSessionTemplate mybatis;

	public List<TagsVO> tagList() {
		return mybatis.selectList("TagsDAO.tagList");
	}
}
