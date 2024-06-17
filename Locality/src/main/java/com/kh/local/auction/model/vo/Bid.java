package com.kh.local.auction.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Bid {
	
	private int userNo;
	private int auctionNo;
	private String bidPrice;
	
}
