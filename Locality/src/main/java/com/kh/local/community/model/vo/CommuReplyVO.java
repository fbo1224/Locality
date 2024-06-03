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
public class CommuReplyVO {

	private int replyNo;
	private String replyContent;
	private String status;
	private int commuNo;
	private int userNo;
	private String replyWriter;
	private Date createDate;
	private Date modifyDate;
	
	
	
}
