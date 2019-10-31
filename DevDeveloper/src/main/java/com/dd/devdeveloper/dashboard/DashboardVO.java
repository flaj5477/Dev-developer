package com.dd.devdeveloper.dashboard;

import java.util.List;

import lombok.Data;

@Data
public class DashboardVO {
	private int memberNo;	//in 타입 
	private List<ActivityLogVO> activityLogList;//out타입
	private int projApply; //out타입 지원상태 갯수
	private int projApprove; //out타입 승인상태 갯수
	private int projParticipant; //out타입 참여상태 갯수
}
