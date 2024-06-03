package com.kh.local.ad.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.local.ad.model.dao.AdMapper;
import com.kh.local.ad.model.vo.AdBoardVO;
import com.kh.local.ad.model.vo.AdPhotoVO;
import com.kh.local.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdServiceImpl implements AdService {

	
	
	private final AdMapper adMapper;
	
	
	@Override
	public int selectListCount(HashMap<String, Integer> map) {
		return adMapper.selectListCount(map);
	}



	@Override
	public int increaseCount(int adNo) {
		return adMapper.increaseCount(adNo);
	}
	
	@Override
	public List<AdBoardVO> selectAll(PageInfo pi, HashMap<String, Integer> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return adMapper.selectAll(map, rowBounds);
		
	}

	
	@Override
	public AdBoardVO selectBoard(int adNo) {
		return adMapper.selectBoard(adNo);
	}
	
	
	@Override
	public int insertBoard(AdBoardVO board) {
		return 0;
	}



	@Override
	public int insertPhoto(AdPhotoVO photo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateBoard(AdBoardVO board) {
		return adMapper.updateBoard(board);
	}



	@Override
	public int updatePhoto(AdPhotoVO photo) {
		return adMapper.updatePhoto(photo);
	}



	@Override
	public int deleteBoard(int adNo) {
		return adMapper.deleteBoard(adNo);
	}







}
