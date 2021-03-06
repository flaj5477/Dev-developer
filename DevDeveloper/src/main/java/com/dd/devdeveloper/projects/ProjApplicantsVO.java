package com.dd.devdeveloper.projects;

import lombok.Data;

@Data
public class ProjApplicantsVO {
	private int applyNo;
	private int membersNo;
	private int projNo;
	private String status;
	private String participantName;
	private String email;
	private String phoneNo;
	private String address;
	private String coverLetter;
	
	//join members
	private String membersImage;
	private String membersId;
	
	//진척률
	private int progress;
	
	private String projTitle;
	private int pmNo; //프로젝트 pm(공고낸사람)번호
	
}
