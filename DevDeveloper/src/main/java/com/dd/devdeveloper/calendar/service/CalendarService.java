package com.dd.devdeveloper.calendar.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dd.devdeveloper.calendar.ProjCalendarVO;



public interface CalendarService {
	public List<ProjCalendarVO> uploadExcelFile(MultipartFile excelFile);
}
