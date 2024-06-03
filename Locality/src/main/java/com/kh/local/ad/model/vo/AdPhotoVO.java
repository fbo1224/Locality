package com.kh.local.ad.model.vo;

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
public class AdPhotoVO {

	private int photoNo;
	private int adNo;
	private String originName;
	private String changeName;
	private String filePath;
	
}
