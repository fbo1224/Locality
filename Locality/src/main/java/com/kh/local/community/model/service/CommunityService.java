package com.kh.local.community.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.community.model.vo.CommuBoardVO;
import com.kh.local.community.model.vo.CommuLikeVO;
import com.kh.local.community.model.vo.CommuPhotoVO;
import com.kh.local.community.model.vo.CommuReplyVO;

public interface CommunityService {

	
	
	// 소통게시판 리스트 카운트
	int selectListCount(int areasNo);
	
	// 소통게시판 리스트 조회
	List<CommuBoardVO> selectList(PageInfo pi, int areasNo);
	
	// 소통게시판 INSERT
	int insertBoard(CommuBoardVO board);
	
	// 소통게시판 첨부파일 INSERT
	int insertPhoto(CommuPhotoVO photo);
	
	// 상세
	// 소통게시판 조회수 증가
	int increaseCount(int commuNo);
	
	// 소통게시판 상세조회
	CommuBoardVO selectBoard(int commuNo);
	
	// 소통게시판 좋아요
	int increaseLike(CommuLikeVO like);
	
	// 게시글 수정
	int updateBoard(CommuBoardVO board);
	
	// 게시글 첨부파일 수정
	int updatePhoto(CommuPhotoVO photo);
	
	// 게시글 삭제
	int deleteBoard(int commuNo);
	
	// 답글 INSERT
	int insertReply(CommuReplyVO reply);
	
	// 답글 SELECT
	List<CommuReplyVO> selectReply(int commuNo);
	
	// 검색 리스트 count
	int searchCount(HashMap<String, String> map);
	
	// 검색 리스트
	List<CommuBoardVO> searchSelect(PageInfo pi, HashMap<String, String> map);
	
	
	
	
	
	
	
	
	
	
	
}
