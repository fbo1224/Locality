package com.kh.local.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommuBoardVO {

	private int commuNo;
	private int categoryNo;
	private String category;
	private String commuTitle;
	private int userNo;
	private String commuContent;
	private Date enrollDate;
	private Date modifyDate;
	private int count;
	private String status;
	private String commuWriter;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String sidoName;
	private int areasNo;
	
	
	
}
