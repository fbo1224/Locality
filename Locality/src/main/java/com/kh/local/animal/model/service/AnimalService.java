package com.kh.local.animal.model.service;



import java.util.HashMap;
import java.util.List;

import com.kh.local.animal.model.vo.Animal;
import com.kh.local.animal.model.vo.AnimalBoard;
import com.kh.local.animal.model.vo.Attachment;
import com.kh.local.animal.model.vo.Report;
import com.kh.local.common.model.vo.AreaInfomation;
import com.kh.local.common.model.vo.PageInfo;

public interface AnimalService {
	
	// 반려동물 정보 추출
	Animal animalInfo(HashMap<String, String> info);
	
	// 지역코드 추출 
	AreaInfomation information(int code);
	
	// �Խñ� ��ü��
	int BoardCount();
	
	// �Խñ� �ҷ�����
	List<AnimalBoard> BoardList(PageInfo pi);
	
	// category 별 결과값
	List<AnimalBoard> keywordList(PageInfo pi,String category);
	
	// 검색 결과값 
	List<AnimalBoard> searchkeyword(PageInfo pi, HashMap<String, String> map);

	// 실종 게시판 게시글 첨부
	int insertContent(Report report);
	
	// 실종 게시판 첨부파일 첨부
		int insertReport(Attachment attachment);
	
	// 반려동물 메인화면 값 불러오기
		List<Report> viewMain();
		
		
	//게시판 글 작성
	int insertAnimalBoard(AnimalBoard board);
	
	// 게시판 글 작성 첨부파일
	int insertAttachment(Attachment attachment);
	
	// 게시글 상세보기
	AnimalBoard viewDetail(int boardNo);
	
	// 
	int defaultAttachment(Attachment attachment);
	
	// 사용자 모든 반려동물 정보 
	List<Animal> show(int userNo);
	
	// 
	List<AnimalBoard> findboard();
	
	// 게시글 수정
	AnimalBoard updateDetail(int boardNo);
	
	// 게시글 삭제
	AnimalBoard deleteDetail(int boardNo);
	
		
}
