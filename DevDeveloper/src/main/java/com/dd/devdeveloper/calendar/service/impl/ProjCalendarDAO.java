package com.dd.devdeveloper.calendar.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dd.devdeveloper.calendar.ProjCalendarVO;

@Repository
public class ProjCalendarDAO {

	@Autowired SqlSessionTemplate mybatis;
	//insert
	public void insertProjCalendar(ProjCalendarVO vo) { 
		mybatis.insert("CalendarDAO.insertProjCalendar", vo);
	}
	
	//select 조회
	public List<ProjCalendarVO> getProjCalendarData(ProjCalendarVO vo) {
		return mybatis.selectList("CalendarDAO.getProjCalendarData", vo);
	}
	
	//하루 할일 조회
	public List<ProjCalendarVO> getToDoList(ProjCalendarVO vo){
		return mybatis.selectList("CalendarDAO.getToDoList",vo);
	}
}
