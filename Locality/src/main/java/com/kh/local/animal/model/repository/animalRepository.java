package com.kh.local.animal.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.local.animal.model.vo.Animal;
import com.kh.local.animal.model.vo.AnimalBoard;
import com.kh.local.animal.model.vo.Attachment;
import com.kh.local.animal.model.vo.Report;
import com.kh.local.common.model.vo.AreaInfomation;

@Repository
public class animalRepository {
	

	public AreaInfomation information(SqlSession sqlSession, int code) {
		return sqlSession.selectOne("animalMapper.areaInfo",code);
	}
	
	public int BoardCount(SqlSession sqlSession) {
		return sqlSession.selectOne("animalMapper.BoardCount");
	}
	
	public List<AnimalBoard> BoardList(SqlSession sqlSession, RowBounds rowBounds){
		return sqlSession.selectList("animalMapper.BoardList", null, rowBounds);
		
	}
	
	public List<AnimalBoard> keywordList(SqlSession sqlSession, RowBounds rowBounds,String category){
		return sqlSession.selectList("animalMapper.keywordList",category,rowBounds);
		
	}
	
	public List<AnimalBoard> searchkeyword(SqlSession sqlSession, RowBounds rowBounds, HashMap<String, String> map){
		
		return sqlSession.selectList("animalMapper.searchkeyword", map, rowBounds);
	}

	public int insertReport(SqlSession sqlSession, Attachment attachment) {
		
		return sqlSession.insert("animalMapper.insertReport", attachment);
	}
	
	public int insertContent(SqlSession sqlSession, Report report) {
		return sqlSession.insert("animalMapper.insertContent",report);
	}
	/*
	public List<Report> viewMain(SqlSession sqlSession, int userNo) {
		return sqlSession.selectList("animalMapper.viewMain", userNo);
	}
	
	*/
	public int insertAnimalBoard(SqlSession sqlSession, AnimalBoard board) {
		return sqlSession.insert("animalMapper.insertBoard", board);
	}
	
	public int Attachment(SqlSession sqlSession, Attachment attachment) {
		return sqlSession.insert("animalMapper.Attachment", attachment);
	}

	
	public Animal animalInfo(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.selectOne("animalMapper.animalInfo", info);
	}
	
	public AnimalBoard viewDetail(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("animalMapper.viewDetail", boardNo);
	}
	
	public int defaultAttachment(SqlSession sqlSession, Attachment attachment) {
		return sqlSession.insert("animalMapper.default", attachment);	
				}
}
