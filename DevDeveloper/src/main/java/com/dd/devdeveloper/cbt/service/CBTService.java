package com.dd.devdeveloper.cbt.service;

import java.util.List;

import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.TestsVO;

public interface CBTService {
	
	//시험응시여부 조회
	public TestsRecordVO getTestJudg(TestsRecordVO recvo);
	
	public List<TestsVO> getTestList();
	
	public TestsVO getTest(TestsVO tvo);
}

