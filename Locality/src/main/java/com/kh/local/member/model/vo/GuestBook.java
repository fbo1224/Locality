package com.kh.local.member.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GuestBook {
	
	private int postNo;
	private int postUser;
	private String nickName;
	private String postContent;
	private String createDate;
	
}
