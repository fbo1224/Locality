package com.kh.local.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {

	private int userNo;
	private int friendNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String address;
	private String detailedAddress;
	private String phone;
	private String status;
	private String cityName;
	private int cityCode;
	private String countyName;
	private int areasCode;
	private String idChecked;
}
