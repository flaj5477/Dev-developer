package com.dd.devdeveloper.cbt;

import lombok.Data;

@Data
public class TestsQVO {
	private int testsQNo; // TESTS_Q_NO
	private int testsNo; // TESTS_NO  
	private String testsQContents; // TESTS_Q_CONTENTS
	private String testsQEx1; // TESTS_Q_EX1    
	private String testsQEx2; // TESTS_Q_EX2
	private String testsQEx3; // TESTS_Q_EX3 
	private String testsQEx4; //TESTS_Q_EX4    
	private String testsQAnswer; // TESTS_Q_ANSWER
	private String testsQUnit; // TESTS_Q_UNIT  
	private int allocate; // 시험 문제 배분
}