package com.dd.devdeveloper.cbt;

import lombok.Data;

@Data
public class MemberVO {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberImPath;
	private int memberGrade;
	private String memberType;
	private String memberAddr;
	private String memberTel;
	private String blackYN;
	private String memberMail;
}