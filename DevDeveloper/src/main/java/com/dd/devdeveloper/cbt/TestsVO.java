package com.dd.devdeveloper.cbt;

import lombok.Data;

@Data
public class TestsVO {
	private int testNo; // TESTS_NO  
	private int testLevel; // TESTS_TITLE
	private String testTitle; // TESTS_LEVEL  
	private int testQuestNum; // TESTS_Q_VOLUME
	private int testPassNum; // TESTS_PASS_CRITERION
	private int testTimeLimit; //TESTS_TIME_LIMIT
	private String testComment; // TESTS_CONTENTS   
}