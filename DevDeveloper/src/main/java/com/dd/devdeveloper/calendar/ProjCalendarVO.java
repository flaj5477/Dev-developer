package com.dd.devdeveloper.calendar;

import java.sql.Date;

import lombok.Data;

@Data
public class ProjCalendarVO {
	private int taskNo;
	private String taskTitle;
	private int projNo;
	private Date startDate;
	private Date endDate;
	private int developerNo;
	private String taskComplete;
}
