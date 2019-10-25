package com.dd.devdeveloper.cbt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.TestsVO;
import com.dd.devdeveloper.cbt.service.CBTService;

@Service
public class CBTServiceImpl implements CBTService{
	
	@Autowired CBTDAO dao;

	@Override
	public TestsRecordVO getTestJudg(TestsRecordVO recvo) {
		return dao.getTestJudg(recvo);
	}

	@Override
	public List<TestsVO> getTestList() {
		return dao.getTestList();
	}
	
}
