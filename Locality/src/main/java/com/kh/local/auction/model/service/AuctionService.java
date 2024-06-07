package com.kh.local.auction.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.local.auction.model.vo.Auction;
import com.kh.local.auction.model.vo.Bid;
import com.kh.local.auction.model.vo.MorePagination;
import com.kh.local.auction.model.vo.Save;

public interface AuctionService {
	
	// 상품 리스트 조회
	List<Auction> selectAuction(RowBounds rowBounds, String filter);
	
	// 상품 상세조회
	Auction auctionDetail(int auctionNo);
	
	// 조회수 증가
	int increaseCount(int auctionNo);
	
	// 장바구니 추가 전 확인
	Save selectSave(Save save);
	
	// 장바구니 INSERT
	int insertSave(Save save);
	
	// 내 장바구니 리스트 SELECT
	List<Save> selectSaveList(int userNo);
	
	// 장바구니 리스트 삭제
	int deleteSave(Save save);
	
	// 상품 등록
	int insertAuction(Auction auction);
	
	// 상품 삭제
	int deleteAuction(Save save);
	
	// 검색기능
	List<Auction> searchAuction(HashMap<String, String> map);
	
	// 필터기능
	List<Auction> searchFilter(String field);
	
	// 입찰진행 받아오기
	List<Auction> resultAuction(int userNo);
	
	// 입찰 진행 취소
	int cancelBid(Save save);
	
	// 입찰 전 체크
	Bid selectBid(Bid bid);
	
	// 입찰하기
	int auctionBid(Bid bid);
	
	// 더보기페이징
	List<MorePagination> morePage(MorePagination morepagination);
	
	// 날짜 지난거 조회
	Bid selectRemainDate();
	
	// 남은날짜 지난 것 상태변경
	int changeStatus(Bid bid);
	
	// 날짜 지난거 삭제
	int deleteRecord(Bid bid);
	
	// 입찰 업데이트 먼저 수행
	int updateBid(Bid bid);

	// 리스트 숫자 만들기
	int selectListCount();

}
