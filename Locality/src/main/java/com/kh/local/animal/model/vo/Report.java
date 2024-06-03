package com.kh.local.animal.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Report {

	
	private int reportNo;
	private String reportPlace;
	private String reportTime;
	private String reportDate;
	private int userNo;
	private String animalName;
	private String content;
}
