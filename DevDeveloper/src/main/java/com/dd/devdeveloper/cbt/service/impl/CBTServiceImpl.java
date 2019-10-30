package com.dd.devdeveloper.cbt.service.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		TestsRecordVO record = dao.getTestJudg(recvo);
		// 응시기록이 없는 경우.. 처리
		if(record.getUtcTestsDate() == null && record.getTestsDate() == null) {
			String initStr = "1970/01/01 00:00:00";
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			try {
			Date initdate = (Date) (format.parse(initStr)); // String -> Date
			Timestamp initTime = new Timestamp(initdate.getTime()); // Date -> Timestamp
			record.setUtcTestsDate(initTime);
			} catch(ParseException e) {
				e.printStackTrace();
			}
		}
		return record;
	}

	@Override
	public List<TestsVO> getTestList() {
		return dao.getTestList();
	}

	@Override
	public TestsVO getTest(TestsVO tvo) {
		return dao.getTest(tvo);
	}
	
}
