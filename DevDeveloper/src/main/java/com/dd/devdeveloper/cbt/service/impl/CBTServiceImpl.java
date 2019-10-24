package com.dd.devdeveloper.cbt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.service.CBTService;

@Service
public class CBTServiceImpl implements CBTService{
	
	@Autowired CBTDAO cbtDao;

	@Override
	public TestsRecordVO getTestJudg(TestsRecordVO recvo) {
		return cbtDao.getTestJudg(recvo);
	}
	
}
