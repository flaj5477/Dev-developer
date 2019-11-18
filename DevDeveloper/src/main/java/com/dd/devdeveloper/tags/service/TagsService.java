package com.dd.devdeveloper.tags.service;

import java.util.List;
import java.util.Map;

import com.dd.devdeveloper.tags.TagsVO;

public interface TagsService {
	
	//태그목록보기
	public List<TagsVO> tagList();
	
	//태그목록 가져오기
	public List<Map<String, Object>> getTagList();

	//태그 나누기
	public List<String> divTag(String tagVal);
}
