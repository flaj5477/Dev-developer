package com.dd.devdeveloper.calendar;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class ProjCalendarVO {
	
	private int taskNo;
	private String taskTitle;
	 private int projNo;
	 private Date startDate;
	 private Date endDate;
	 private int developerNo;
	 private String developerId; //엑셀에서 입력되는 사용자 id
	 private String taskComplete;
	 private String date; //선택한 날짜
	
	//fullCalendar 타입
	private String title;
	private String start;
	private String end;
	
}
