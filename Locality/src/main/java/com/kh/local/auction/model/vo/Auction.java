package com.kh.local.auction.model.vo;

import com.kh.local.common.model.vo.PageInfo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Auction {
	
	private int auctionNo;
	private String pdName; // 상품명
	private String pdDesc; // 상품설명
	private int bidUnit; // 입찰가격
	private String condition; // 낙찰여부
	private String startDate;
	private String endDate;
	private int bidCnt; // 입찰수
	private int startPrice;
	private int pdCnt;
	private String pdStatus;
	private String pdLcn;
	private int cateNo;
	private String seller;
	private String remainDate;
	
	// 물품 사진 테이블
	private String imgPath; // 사진 경로
	private String createDate; // 생긴 날짜 
	
	// 회원 테이블
	private int userNo;
	
	// 낙찰가격
	private int bidPrice;
	
	private PageInfo pageInfo;
	
}
