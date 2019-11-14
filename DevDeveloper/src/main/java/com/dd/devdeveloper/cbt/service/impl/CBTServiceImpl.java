package com.dd.devdeveloper.cbt.service.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dd.devdeveloper.cbt.TestsQVO;
import com.dd.devdeveloper.cbt.TestsRecordVO;
import com.dd.devdeveloper.cbt.TestsVO;
import com.dd.devdeveloper.cbt.service.CBTService;

@Service
public class CBTServiceImpl implements CBTService {
	
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

	@Override
	public void cbtInsert(TestsRecordVO recvo) {
		dao.cbtInsert(recvo);
	}

	@Override
	public List<TestsQVO> getQuestList(TestsQVO tqvo) {
		return dao.getQuestList(tqvo);
	}

	@Override
	public List<Map<String,Object>> getRecordList(TestsRecordVO recvo) {
		return dao.getRecordList(recvo);
	}

	@Override
	public void markMatchProc(List<Map<String,Integer>> mark) {
		//SORTING (Lambda)
		Collections.sort(mark,(Map<String,Integer> m1, Map<String,Integer> m2)-> { // List안에 담긴 Map 객체 정렬
			return m1.get("key")-m2.get("key");  // 오름차순 정렬
		});
		System.out.println(mark);
		
		List<Map<String,Object>> match = dao.getAnswerList(mark);
		
		System.out.println(match);
		
		/* https://dublin-java.tistory.com/12
		//SORTING (Anonymous Class)
		Collections.sort(mark,new Comparator<Map<String,Integer>>() {
			@Override
   			public int compare(Map<String,Integer> m1, Map<String,Integer> m2) {
       			return m2.get("key")-m1.get("key");  // o2가 앞에 있으면 내림차순.
  			}
		});	
		*/
		
	}
}
