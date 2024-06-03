package com.kh.local.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.notice.model.repository.NoticeMapper;
import com.kh.local.notice.model.vo.Notice;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper noticeMapper;
	
	
	@Override
	public int selectListCount() {
		return noticeMapper.selectListCount();
	}

	@Override
	public List<Notice> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return noticeMapper.selectList(rowBounds);
	}

	@Override
	public int increaseCount(int noticeNo) {
		return noticeMapper.increaseCount(noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeMapper.selectNotice(noticeNo);
	}

	@Override
	public int updateNotice(int noticeNo) {
		return 0;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}

}
