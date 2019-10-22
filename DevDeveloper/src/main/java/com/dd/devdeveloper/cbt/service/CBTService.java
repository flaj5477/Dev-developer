package com.dd.devdeveloper.cbt.service;

import com.dd.devdeveloper.cbt.TestsRecordVO;

public interface CBTService {
	
	//시험응시여부 조회
	public TestsRecordVO getTestJudg(TestsRecordVO recvo);
}

