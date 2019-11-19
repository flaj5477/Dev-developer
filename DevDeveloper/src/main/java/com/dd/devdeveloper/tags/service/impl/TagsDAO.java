package com.dd.devdeveloper.tags.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.tags.TagsVO;

@Repository
public class TagsDAO {
	
	@Autowired SqlSessionTemplate mybatis;

	public List<TagsVO> tagList() { //태그 홈에 나오는 리스트
		return mybatis.selectList("TagsDAO.tagList");
	}

	public List<Map<String, Object>> getTagList() { //입력폼에서 태그 리스트 가져오는거
		return mybatis.selectList("TagsDAO.getTagList");
	}
}
