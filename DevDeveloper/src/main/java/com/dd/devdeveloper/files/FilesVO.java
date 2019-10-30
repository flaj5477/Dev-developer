package com.dd.devdeveloper.files;

import java.util.Date;

import lombok.Data;

@Data
/* @JsonIgnoreProperties(value = {"uploadFilename", "seqList", "msg"} ) */
public class FilesVO {
	/* @JsonProperty("파일번호") */
	private int fileNo;
	private int projNo;
	private int members_No;
	private String files_Title;
	private int files_Group_No;
	private String files_Coment;
	private Date files_Upload_Date;
	private String files_Path;
	private int  files_Folder;
	private String files_Type;
	private int files_Size;
	private String files_Import;
	private String files_Trash;
	private Date files_Delday;
	
	/*
	 * private List<MultipartFile> uploadFile; // 파일업로드용 list로 여러개 받음
	 */}
