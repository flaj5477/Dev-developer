package com.dd.devdeveloper.projects;

import java.sql.Date;
import lombok.Data;

@Data
public class ProjectsVO {
	private int projNo;
	private int membersNo;
	private String projTitle;
	private String projContents;
	private Date projRegDate;
	private Date projDueDate;
	private int projRequire;
	private int projMembersCnt;
	private String projType;
	private int projPrice;
	private String projStoreUrl;
	private String projTags;
	private Date projStartDate;
	private Date projEndDate;
	private String membersName;
	
	
	private int first;	//페이징 시작 게시글 번호
	private int last;	//페이징 종료 게시글 번호
	private String searchVal; //검색 값
	private String orderby; // 정렬
}
