package com.dd.devdeveloper.calendar.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dd.devdeveloper.calendar.ProjCalendarVO;



public interface CalendarService {
	//엑셀로 업로드
	public List<ProjCalendarVO> uploadExcelFile(MultipartFile excelFile, int projNo);
	
	//DB데이터 가져오기
	public List<ProjCalendarVO> getProjCalendarData(ProjCalendarVO vo);

	//하루 할일 가져오기
	public List<ProjCalendarVO> getToDoList(ProjCalendarVO vo);

	public int updateToDoList(ProjCalendarVO projCalendarVO);
	
}
