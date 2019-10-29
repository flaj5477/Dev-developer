package com.dd.devdeveloper.dashboard;

import java.util.List;

import lombok.Data;

@Data
public class DashboardVO {
	private int memberNo;	//in 타입 
	private List<ActivityLogVO> activityLogList;//out타입
}
