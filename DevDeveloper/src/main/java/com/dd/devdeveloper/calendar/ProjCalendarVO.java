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
	@JsonIgnore private String taskComplete;
	
	//fullCalendar 타입
	private String title;
	private String start;
	private String end;
	
}
