package com.kh.local.ad.model.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.local.ad.model.vo.AdBoardVO;
import com.kh.local.ad.model.vo.AdPhotoVO;

@Mapper
public interface AdMapper {

	int selectListCount(HashMap<String, Integer> map);
	
	List<AdBoardVO> selectAll(HashMap<String, Integer> map, RowBounds rowBounds);
	
	int increaseCount(int adNo);
	
	AdBoardVO selectBoard(int adNo);
	
	int deleteBoard(int adNo);
	
	int updatePhoto(AdPhotoVO photo);

	int updateBoard(AdBoardVO board);
	
		
}
