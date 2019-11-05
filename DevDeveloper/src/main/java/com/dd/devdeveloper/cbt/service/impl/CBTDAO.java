package com.dd.devdeveloper.cbt.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.cbt.TestsQVO;
import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.TestsVO;

@Repository
public class CBTDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//시험응시여부 조회
	public TestsRecordVO getTestJudg(TestsRecordVO recvo) {
		return mybatis.selectOne("CBTDAO.getTestJudg",recvo);
	}
	//시험목록 전체조회
	public List<TestsVO> getTestList() {
		return mybatis.selectList("CBTDAO.getTestList");
	}
	//선택한 시험 조회
	public TestsVO getTest(TestsVO tvo) {
		return mybatis.selectOne("CBTDAO.getTestList",tvo);
	}
	//응시기록 추가
	public void cbtInsert(TestsRecordVO recvo) {
		mybatis.insert("CBTDAO.cbtInsert",recvo);
	}
	//시험문제 조회
	public List<TestsQVO> getQuestList(TestsQVO tqvo) {
		return mybatis.selectList("CBTDAO.getQuestList",tqvo);
	}
}
