package com.dd.devdeveloper.cbt.service.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.cbt.TestsRecordVO;

@Repository
public class CBTDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//시험응시여부 조회
	public TestsRecordVO getTestJudg(TestsRecordVO recvo) {
		return mybatis.selectOne("CBTDAO.getTestJudg",recvo);
	}
}
