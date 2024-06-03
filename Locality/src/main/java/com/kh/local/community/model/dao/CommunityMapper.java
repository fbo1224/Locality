package com.kh.local.community.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.local.community.model.vo.CommuBoardVO;
import com.kh.local.community.model.vo.CommuLikeVO;
import com.kh.local.community.model.vo.CommuPhotoVO;
import com.kh.local.community.model.vo.CommuReplyVO;

@Mapper
public interface CommunityMapper {

	int selectListCount(int areasNo);

	List<CommuBoardVO> selectList(int areasNo, RowBounds rowBounds);

	int insertBoard(CommuBoardVO board);

	int insertPhoto(CommuPhotoVO photo);

	int increaseCount(int commuNo);

	CommuBoardVO selectBoard(int commuNo);

	int updateBoard(CommuBoardVO board);

	int deleteBoard(int commuNo);

	int updatePhoto(CommuPhotoVO photo);

	int insertReply(CommuReplyVO reply);

	List<CommuReplyVO> selectReply(int commuNo);

	int searchCount(HashMap<String, String> map);

	List<CommuBoardVO> searchSelect(HashMap<String, String> map, RowBounds rowBounds);

	int increaseLike(CommuLikeVO like);

	
	
	
}
