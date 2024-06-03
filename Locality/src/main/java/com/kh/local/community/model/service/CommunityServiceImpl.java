package com.kh.local.community.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.community.model.dao.CommunityMapper;
import com.kh.local.community.model.vo.CommuBoardVO;
import com.kh.local.community.model.vo.CommuLikeVO;
import com.kh.local.community.model.vo.CommuPhotoVO;
import com.kh.local.community.model.vo.CommuReplyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	
	
	
	private final CommunityMapper commuMapper;
	
	
	
	@Override
	public int selectListCount(int areasNo) {
		return commuMapper.selectListCount(areasNo);
		
	}

	@Override
	public List<CommuBoardVO> selectList(PageInfo pi, int areasNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		 
		List<CommuBoardVO> list = commuMapper.selectList(areasNo, rowBounds);
		
		return list;
		 
	}

	@Override
	public int insertBoard(CommuBoardVO board) {

		return commuMapper.insertBoard(board);
	}

	@Override
	public int insertPhoto(CommuPhotoVO photo) {

		return commuMapper.insertPhoto(photo);
	}

	@Override
	public int increaseCount(int commuNo) {
		
		return commuMapper.increaseCount(commuNo);
	}

	@Override
	public CommuBoardVO selectBoard(int commuNo) {

		return commuMapper.selectBoard(commuNo);
	}

	@Override
	public int updateBoard(CommuBoardVO board) {
		return commuMapper.updateBoard(board);
	}

	@Override
	public int deleteBoard(int commuNo) {

		return commuMapper.deleteBoard(commuNo);
	}

	@Override
	public int updatePhoto(CommuPhotoVO photo) {
		return commuMapper.updatePhoto(photo);
	}

	@Override
	public int insertReply(CommuReplyVO reply) {
		return commuMapper.insertReply(reply);
	}

	@Override
	public List<CommuReplyVO> selectReply(int commuNo) {
		return commuMapper.selectReply(commuNo);
	}

	@Override
	public int searchCount(HashMap<String, String> map) {
		return commuMapper.searchCount(map);
	}

	@Override
	public List<CommuBoardVO> searchSelect(PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return commuMapper.searchSelect(map, rowBounds);
	}


	@Override
	public int increaseLike(CommuLikeVO like) {
		return commuMapper.increaseLike(like);
	}





}
