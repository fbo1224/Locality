package com.kh.local.auction.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.local.auction.model.repository.AuctionMapper;
import com.kh.local.auction.model.vo.Auction;
import com.kh.local.auction.model.vo.Bid;
import com.kh.local.auction.model.vo.MorePagination;
import com.kh.local.auction.model.vo.Save;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class AuctionServiceImpl implements AuctionService{

	private final AuctionMapper auctionMapper;
	
	@Override
	public List<Auction> selectAuction(RowBounds rowBounds, String filter) {
		return auctionMapper.selectAuction(rowBounds, filter);
	}

	@Override
	public Auction auctionDetail(int auctionNo) {
		return auctionMapper.auctionDetail(auctionNo);
	}

	@Override
	public int increaseCount(int auctionNo) {
		return auctionMapper.increaseCount(auctionNo);
	}
	
	@Override
	public Save selectSave(Save save) {
		return auctionMapper.selectSave(save);
	}

	@Override
	public int insertSave(Save save) {
		return auctionMapper.insertSave(save);
	}

	@Override
	public List<Save> selectSaveList(int userNo) {
		return auctionMapper.selectSaveList(userNo);
	}

	@Override
	public int deleteSave(Save save) {
		return auctionMapper.deleteSave(save);
	}

	@Override
	public int insertAuction(Auction auction) {
		if(auctionMapper.insertAuction(auction) > 0) {
			return auctionMapper.selectAuctionNo(auction);
		} else {
			return 0;
		}
	}

	@Override
	public int deleteAuction(Save save) {
		return auctionMapper.deleteAuction(save);
	}

//	@Override
//	public int remainDate(int auctionNo) {
//		return auctionMapper.remainDate(auctionNo);
//	}

	@Override
	public List<Auction> searchAuction(HashMap<String, String> map) {
		return auctionMapper.searchAuction(map);
	}

	@Override
	public List<Auction> searchFilter(String field) {
		return auctionMapper.searchFilter(field);
	}

	@Override
	public List<Auction> resultAuction(int userNo) {
		return auctionMapper.resultAuction(userNo);
	}

	@Override
	public int cancelBid(Save save) {
		return auctionMapper.cancelBid(save);
	}

	@Override
	public int auctionBid(Bid bid) {
		return auctionMapper.auctionBid(bid);
	}

	@Override
	public Bid selectBid(Bid bid) {
		return auctionMapper.selectBid(bid);
	}

	@Override
	public List<MorePagination> morePage(MorePagination morepagination) {
		return auctionMapper.morePage(morepagination);
	}

	@Override
	public int changeStatus(Bid bid) {
		if((auctionMapper.changeCondition(bid) * auctionMapper.changeStatus(bid)) > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public Bid selectRemainDate() {
		return auctionMapper.selectRemainDate();
	}

	@Override
	public int deleteRecord(Bid bid) {
		return auctionMapper.deleteRecord(bid);
	}

	@Override
	public int updateBid(Bid bid) {
		return auctionMapper.updateBid(bid);
	}

	@Override
	public int selectListCount() {
		return auctionMapper.selectListCount();
	}



	
	
	
}
