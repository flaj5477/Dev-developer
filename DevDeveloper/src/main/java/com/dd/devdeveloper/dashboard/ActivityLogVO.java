package com.dd.devdeveloper.dashboard;

import java.sql.Date;

import lombok.Data;

@Data
public class ActivityLogVO {
	private int membersNo;
	private Date activityDate;
	private String activityScore;
}
