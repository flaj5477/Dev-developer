package com.dd.devdeveloper.cbt.service.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
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
	public void solutionProc(Map<String,Object> cd) {
		int score = 0;	// 맞은 문제 갯수
		@SuppressWarnings("unchecked") // warning 막기
		List<Map<String,Object>> mark = (List<Map<String,Object>>) cd.get("data"); // "data" = 시험 문제 key ,value 값
		//SORTING (Lambda)
		/*
		Collections.sort(mark,(Map<String,Object> m1, Map<String,Object> m2)-> { // List안에 담긴 Map 객체 정렬, lambda 형식으로
			// 2진 트리
			return m1.get("key") - m2.get("key");  // 오름차순 정렬
		});
		*/
		
		Collections.sort(mark,new Comparator<Map<String,Object>>() {
			@Override
			public int compare(Map<String, Object> m1, Map<String, Object> m2) {
				return ((Integer)m1.get("key")).compareTo(((Integer)m2.get("key")));
			}	
		});
		/* https://dublin-java.tistory.com/12
		//SORTING (Anonymous Class)
		Collections.sort(mark,new Comparator<Map<String,Integer>>() {
			@Override
   			public int compare(Map<String,Integer> m1, Map<String,Integer> m2) {
       			return m2.get("key")-m1.get("key");  // o2가 앞에 있으면 내림차순.
  			}
		});	
		*/
		// 정답 비교
		List<Map<String,Object>> solution = dao.getSolutionList(mark);
		for(Integer i=0;i<mark.size();i++) {
			//Integer markValue = mark.get(i).get("value");
			String markValue = mark.get(i).get("value").toString();
			if(markValue == null) {
				markValue = "";
			}
			/*
			if(markValue == ((BigDecimal)solution.get(i).get("value")).intValue()) {
				score ++;
			}
			*/
			if(markValue.equals((solution.get(i).get("value")).toString())) {
				score ++;
			}
		}
		// 점수계산
		float quest = ((float)100/(Integer)cd.get("quest")); // (float) : 계산값 실수타입으로 출력
		int resultScore = Math.round(score*quest); // 점수 반올림
		// 결과 업데이트
		TestsRecordVO recvo = new TestsRecordVO(); // 업데이트 할 값을 객체에 담는다.
		recvo.setTestsApplyNo((Integer)cd.get("rid"));
		recvo.setMembersNo((Integer)cd.get("user"));
		recvo.setTestsNo((Integer)cd.get("level"));
		recvo.setTestsTime((Integer)cd.get("time"));
		recvo.setTestsScore(resultScore);
		dao.cbtResultUpdate(recvo);
	}

	@Override
	public Map<String,Object> getResult(TestsRecordVO recvo) {
		return dao.getResult(recvo);
	}
	
	@Override
	public List<Map<String,Object>> getRecordList(TestsRecordVO recvo) {
		return dao.getRecordList(recvo);
	}

}
