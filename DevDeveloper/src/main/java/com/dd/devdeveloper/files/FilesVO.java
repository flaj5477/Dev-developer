package com.dd.devdeveloper.files;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

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
	private String filesPath; //경로 조회
	private String  upperFolder;
	private String filesType;
	private long filesSize;
	private String filesImport;
	private MultipartFile filesUpload;
	private String filesTrash;
	private Date filesDelday;
	private String uploadFilename;
	private String getFilesRoute;
	private String membersName;
	
	private int first;	//페이징
	private int last;	//페이징
	private String select; // 검색 분류 선택 (제목, 작성자)
	private String searchVal; //검색
		
	/*
	 * private List<MultipartFile> uploadFile; // 파일업로드용 list로 여러개 받음
	 */}
