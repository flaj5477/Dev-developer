package com.dd.devdeveloper.cbt;

import java.sql.Date;

import lombok.Data;

@Data
public class TestsRecordVO {
	private int testRecNo; // TESTS_APPLY_NO
	private int memberNo; // MEMBERS_NO   
	private int testNo; // TESTS_NO  
	private Date testDay; // TESTS_DATE 
	private int testScore; // TESTS_SCORE 
	private String testRes; // TESTS_RESULTS
	private int testResTime; // TESTS_TIME     
	
}
