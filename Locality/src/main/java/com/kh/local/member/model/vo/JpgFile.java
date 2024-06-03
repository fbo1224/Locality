package com.kh.local.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@Setter
@NoArgsConstructor
@ToString
public class JpgFile {
	
	private int fileNo;
	private int userNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String createDate;
	
}
