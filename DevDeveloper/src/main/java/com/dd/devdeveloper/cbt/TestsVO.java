package com.dd.devdeveloper.cbt;

import lombok.Data;

@Data
public class TestsVO {
	private int testsNo; // TESTS_NO  
	private String testsTitle; // TESTS_TITLE
	private int testsQVolume; // TESTS_Q_VOLUME
	private int testsPassCriterion; // TESTS_PASS_CRITERION
	private int testsTimeLimit; //TESTS_TIME_LIMIT
	private String testsContents; // TESTS_CONTENTS   
}