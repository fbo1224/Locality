package com.kh.local.ad.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AdBoardVO {

	private int adNo;
	private int categoryNo;
	private String categoryName;
	private String adTitle;
	private String adContent;
	private String adWriter;
	private Date enrollDate;
	private Date modifyDate;
	private int count;
	private String status;
	private String countyName;
	private int areasNo;
	private int bizNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String bizCall;
	private String bizAddress;
}
