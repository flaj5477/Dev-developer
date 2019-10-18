package com.dd.devdeveloper.board;

import java.sql.Date;

import lombok.Data;


@Data
public class BoardVO {
		private String seq;
		private String title;
		private String writer;
		private String content;
		private Date regDate;
		private int cnt;
}
