package com.kh.local.member.model.service;


import java.util.HashMap;
import java.util.List;

import com.kh.local.member.model.vo.Areas;
import com.kh.local.member.model.vo.GuestBook;
import com.kh.local.member.model.vo.JpgFile;
import com.kh.local.member.model.vo.Member;

public interface MemberService {

	Member loginConfirm(Member member);
	
	List<Areas> citySearch(int cityNo);
	
	int emailConfirm(String email);
	
	List<Integer> nickPhoneConfirm(Member member);
	
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
	
	int follow(HashMap<String,Integer>map);
	
	int userDelete(int userNo);
	
	int confirmUpdate(HashMap<String, Integer> map);
	
	int refuse(HashMap<String, Integer> map);

	int updateAddress(Member member);

	int insertAddress(Member member);
	
	Member socialLogin(String socialId);
	
}
