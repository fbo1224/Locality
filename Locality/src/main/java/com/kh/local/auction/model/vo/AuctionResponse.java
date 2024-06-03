package com.kh.local.auction.model.vo;

import java.util.List;

import com.kh.local.common.model.vo.PageInfo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class AuctionResponse {
	
	private List<Auction> auctions;
	private PageInfo pageInfo;
	
}
