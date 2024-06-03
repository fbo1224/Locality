package com.kh.local.member.model.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.local.member.model.vo.Areas;
import com.kh.local.member.model.vo.GuestBook;
import com.kh.local.member.model.vo.JpgFile;
import com.kh.local.member.model.vo.Member;

@Mapper
public interface MemberMapper  {

	Member loginConfirm(Member member);
	
	List<Areas> citySearch(int cityNo);
	
	List<Integer> nickPhoneConfirm(Member member);
	
	int emailConfirm(String email);
	
	int signUpUser(Member member);
	
	int updateUser(Member member);
	
	List<JpgFile> photo(int userNo);
	
	int photoUpload(JpgFile jpg);
	
	int photoDelete(int fileNo);
	
	List<GuestBook> guestBookList(int userNo);
	
	int insertPost(GuestBook book);
	
	int deletePost(int postNo);
	
	List<Member> friendList(int userNo);
	
	List<Member> searchFriend(String keyword);
	
	List<Member> friendConfirm(int userNo);

	int follow(HashMap<String, Integer> map);
	
	int userDelete(int userNo);

	int confirmUpdate(HashMap<String, Integer> map);

	int refuse(HashMap<String, Integer> map);

	int updateAddress(Member member);

	int insertAddress(Member member);
	
	
}

