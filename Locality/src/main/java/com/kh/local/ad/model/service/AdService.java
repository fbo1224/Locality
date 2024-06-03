package com.kh.local.ad.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.local.ad.model.vo.AdBoardVO;
import com.kh.local.ad.model.vo.AdNumVO;
import com.kh.local.ad.model.vo.AdPhotoVO;
import com.kh.local.common.model.vo.PageInfo;

public interface AdService {

	int increaseCount(int adNo);
	
	int selectListCount(HashMap<String, Integer> map);
	
	List<AdBoardVO> selectAll(PageInfo pi, HashMap<String, Integer> map);
	
	int insertBoard(AdBoardVO board);
	
	int insertPhoto(AdPhotoVO photo);
	
	AdBoardVO selectBoard(int adNo);
	
	int updateBoard(AdBoardVO board);
	
	int updatePhoto(AdPhotoVO photo);
	
	int deleteBoard(int adNo);
}
