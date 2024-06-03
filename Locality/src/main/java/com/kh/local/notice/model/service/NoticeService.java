package com.kh.local.notice.model.service;

import java.util.List;

import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.notice.model.vo.Notice;

public interface NoticeService {
	
	
	// 게시글 총 개수 조회
	int selectListCount();
	
	// 게시글 목록 조회
	List<Notice> selectList(PageInfo pi);
	
	// 조회수 증가
	int increaseCount(int noticeNo);
	
	// 게시글 상세조회
	Notice selectNotice(int noticeNo);
	
	// 게시글 수정
	int updateNotice(int noticeNo);
	
	// 게시글 삭제
	int deleteNotice(int noticeNo);
	
	
	
}
