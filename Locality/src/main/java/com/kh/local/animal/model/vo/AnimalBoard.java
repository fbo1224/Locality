package com.kh.local.animal.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter 
public class AnimalBoard {
	
	private int boardNo;
	private String title;
	private String content;
	private String writer;
	private String categoryName;
	private Date writeDate;
	private int viewCount;
	private int categoryNo;
	private int userNo;
	private String animalName;
	private String uploadedFile;

}
