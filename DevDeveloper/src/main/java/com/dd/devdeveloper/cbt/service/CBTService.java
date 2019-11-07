package com.dd.devdeveloper.cbt.service;

import java.util.List;

import com.dd.devdeveloper.cbt.TestsQVO;
import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.TestsVO;

public interface CBTService {
	
	//시험응시여부 조회
	public TestsRecordVO getTestJudg(TestsRecordVO recvo);
	//시험목록 전체조회
	public List<TestsVO> getTestList();
	//선택한 시험 조회
	public TestsVO getTest(TestsVO tvo);
	//응시기록 추가
	public void cbtInsert(TestsRecordVO recvo);
	//시험문제 조회
	public List<TestsQVO> getQuestList(TestsQVO tqvo);
}

