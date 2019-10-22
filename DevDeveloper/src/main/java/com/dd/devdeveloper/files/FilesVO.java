package com.dd.devdeveloper.files;

import lombok.Data;

@Data
public class FilesVO {
	private int fileNo;
	private int projNo;
	private int members_No;
	private String files_Title;
	private int files_Group_No;
	private String files_Coment;
	private String files_Upload_Date; //타입 조원들에게 질문할것 string값으로 설정해서 할지 아니면 다른 방법이 있는지
	private String files_Path;

}
