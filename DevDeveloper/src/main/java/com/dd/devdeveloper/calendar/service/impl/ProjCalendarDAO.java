package com.dd.devdeveloper.calendar.service.impl;

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
}
