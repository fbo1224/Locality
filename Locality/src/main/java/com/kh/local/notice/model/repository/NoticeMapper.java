package com.kh.local.notice.model.repository;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.local.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	// 게시글 총 개수 조회
	int selectListCount();
	
	// 게시글 목록 조회
	List<Notice> selectList(RowBounds rowBounds);
	
	// 조회수 증가
	int increaseCount(int noticeNo);
	
	// 게시글 상세조회
	Notice selectNotice(int noticeNo);
	
	// 게시글 수정
	int updateNotice(int noticeNo);
	
	// 게시글 삭제
	int deleteNotice(int noticeNo);
	
}
