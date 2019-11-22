package com.dd.devdeveloper.calendar;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class ProjCalendarVO {
	
	@JsonIgnore	private int taskNo;
	@JsonIgnore	private String taskTitle;
	@JsonIgnore private int projNo;
	@JsonIgnore private Date startDate;
	@JsonIgnore private Date endDate;
	@JsonIgnore private int developerNo;
	@JsonIgnore private String developerId; //엑셀에서 입력되는 사용자 id
	@JsonIgnore private String taskComplete;
	@JsonIgnore private String date; //선택한 날짜
	
	//fullCalendar 타입
	private String title;
	private String start;
	private String end;
	
}
