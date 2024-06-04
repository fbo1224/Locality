package com.kh.local.animal.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Report {

	
	private int reportNo;
	private String reportPlace;
	private String reportDate;
	private String reportTime;
	private String nickName;
	private String animalName;
	private String animalType;
	private String breede;
	private String age;
	private String status;
	private String content;
	private String changeName;
	private int userNo;
}
