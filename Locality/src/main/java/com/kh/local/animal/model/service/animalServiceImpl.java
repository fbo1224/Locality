package com.kh.local.animal.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.local.animal.model.repository.animalRepository;
import com.kh.local.animal.model.vo.Animal;
import com.kh.local.animal.model.vo.AnimalBoard;
import com.kh.local.animal.model.vo.Attachment;
import com.kh.local.animal.model.vo.Report;
import com.kh.local.common.model.vo.AreaInfomation;
import com.kh.local.common.model.vo.PageInfo;

@Service
public class animalServiceImpl implements animalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private animalRepository repository;

	@Override
	public AreaInfomation information(int code) {

		return repository.information(sqlSession,code);
		
	}

	@Override
	public int BoardCount() {
		return repository.BoardCount(sqlSession);
	}

	@Override
	public List<AnimalBoard> BoardList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit()); 
	
		return repository.BoardList(sqlSession, rowBounds);
	}

	@Override
	public List<AnimalBoard> keywordList(PageInfo pi,String category) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit()); 
	
		return repository.keywordList(sqlSession,rowBounds,category);
	}

	@Override
	public List<AnimalBoard> searchkeyword(PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit()); 
		return repository.searchkeyword(sqlSession, rowBounds, map);
	}
	
	@Override
	public int insertContent(Report report) {
		return repository.insertContent(sqlSession, report);
	}

	@Override
	public int insertReport(Attachment attachment) {
		return repository.insertReport(sqlSession, attachment);
	}
	
	@Override
	public List<Report> viewMain() {
		
		return repository.viewMain(sqlSession);
	}
	

	@Override
	public int insertAnimalBoard(AnimalBoard board) {
		return repository.insertAnimalBoard(sqlSession, board);	}

	@Override
	public int insertAttachment(Attachment attachment) {

		return repository.Attachment(sqlSession,attachment);
	}
	
	@Override
	public Animal animalInfo(HashMap<String, String> info) {
		return repository.animalInfo(sqlSession,info);
	}

	@Override
	public AnimalBoard viewDetail(int boardNo) {
		return repository.viewDetail(sqlSession,boardNo);
	}

	@Override
	public int defaultAttachment(Attachment attachment) {
	
		return repository.defaultAttachment(sqlSession,attachment);
	}

	@Override
	public List<Animal> show(int userNo) {
		
		return repository.show(sqlSession, userNo);
	}

	
	

	

	

	

	

	
	

}
