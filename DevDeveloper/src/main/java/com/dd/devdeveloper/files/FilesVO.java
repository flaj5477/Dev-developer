package com.dd.devdeveloper.files;

import java.util.Date;

import lombok.Data;

@Data
/* @JsonIgnoreProperties(value = {"uploadFilename", "seqList", "msg"} ) */
public class FilesVO {
	/* @JsonProperty("파일번호") */
	private int filesNo;
	private int projNo;
	private int membersNo;
	private String filesTitle;
	private int filesGroupNo;
	private String filesComment;
	private Date filesUploadDate;
	private String filesPath;
	private int  filesFolder;
	private String filesType;
	private int filesSize;
	private String filesImport;
	private String filesTrash;
	private Date filesDelday;
	
	private int first;	//페이징
	private int last;	//페이징
	private String searchVal; //검색
	
	
	/*
	 * private List<MultipartFile> uploadFile; // 파일업로드용 list로 여러개 받음
	 */}
