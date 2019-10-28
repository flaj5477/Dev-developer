package com.dd.devdeveloper.files;

import java.util.Date;

import lombok.Data;

@Data
public class FilesVO {
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

}
