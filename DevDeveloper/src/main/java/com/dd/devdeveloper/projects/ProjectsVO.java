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
	
}
