package com.dd.devdeveloper.tags.service.impl;

import java.util.List;

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
	
}
