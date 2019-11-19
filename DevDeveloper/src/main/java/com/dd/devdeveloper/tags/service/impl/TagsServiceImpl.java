package com.dd.devdeveloper.tags.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.tags.TagsVO;
import com.dd.devdeveloper.tags.service.TagsService;

@Service
public class TagsServiceImpl implements TagsService{

	
	@Autowired TagsDAO tagsDAO;
	/*========
	 * 20191113
	 * 곽동우
	 * 태그목록보기 
	 ============*/
	@Override
	public List<TagsVO> tagList() {
		
		return tagsDAO.tagList();
	}
	
	/*========
	 * 20191118
	 * 곽동우
	 * 태그목록보기
	 ============*/
	@Override
	public List<Map<String, Object>> getTagList() {
		return tagsDAO.getTagList();
	}
	
	/*========
	 * 20191118
	 * 곽동우
	 * db 태그값 ,기준으로 나누기  
	 ============*/
	@Override
	public List<String> divTag(String tagVal){
		
		List<String> divTagList = new ArrayList<>(Arrays.asList(tagVal.split(",")));	//tagVal 받아서 나눈후에 list에 담는다

		return divTagList;
	}
	
}
