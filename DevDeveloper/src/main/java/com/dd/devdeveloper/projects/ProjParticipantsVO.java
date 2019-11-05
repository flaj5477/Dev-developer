package com.dd.devdeveloper.projects;

import lombok.Data;

@Data
public class ProjParticipantsVO {
	private int applyNo;
	private int membersNo;
	private int projNo;
	private String status;
	private String participantName;
	private String email;
	private String phoneNo;
	private String address;
	private String coverLetter;
	
	private String projTitle;
}
