package com.dd.devdeveloper.cbt;

import lombok.Data;

@Data
public class TestsQVO {
	private int testQNo; // TESTS_Q_NO
	private String testQ; // TESTS_Q_CONTENTS
	private String testEx1; // TESTS_Q_EX1    
	private String testEx2; // TESTS_Q_EX2
	private String testEx3; // TESTS_Q_EX3 
	private String testEx4; //TESTS_Q_EX4    
	private String testA; // TESTS_Q_ANSWER
	private String testDesc; // TESTS_Q_UNIT  
}