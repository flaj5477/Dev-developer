package com.dd.devdeveloper.cbt;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TestsRecordVO {
	private int testsApplyNo; // TESTS_APPLY_NO
	private int membersNo; // MEMBERS_NO
	private int membersGrade; // Members_grade
	private int testsNo; // TESTS_NO  
	private Timestamp testsDate; // TESTS_DATE 
	private int testsScore; // TESTS_SCORE 
	private String testsResult; // TESTS_RESULTS
	private int testsTime; // TESTS_TIME
	
	private Timestamp utcTestsDate;
}
