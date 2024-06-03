package com.kh.local.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.local.member.model.repository.MemberMapper;
import com.kh.local.member.model.vo.Areas;
import com.kh.local.member.model.vo.GuestBook;
import com.kh.local.member.model.vo.JpgFile;
import com.kh.local.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	
	
	@Override
	public Member loginConfirm(Member member) {
		return memberMapper.loginConfirm(member);
	}

	@Override
	public List<Areas> citySearch(int cityNo) {
		return memberMapper.citySearch(cityNo);
	}
	
	@Override
	public int emailConfirm(String email) {
		return memberMapper.emailConfirm(email);
	}

	@Override
	public List<Integer> nickPhoneConfirm(Member member) {
		return memberMapper.nickPhoneConfirm(member);
	}

	@Override
	public int signUpUser(Member member) {
		return memberMapper.signUpUser(member);
	}

	@Override
	public int updateUser(Member member) {
		return memberMapper.updateUser(member);
	}

	@Override
	public List<JpgFile> photo(int userNo) {
		return memberMapper.photo(userNo);
	}

	@Override
	public int photoUpload(JpgFile jpg) {
		return memberMapper.photoUpload(jpg);
	}

	@Override
	public int photoDelete(int fileNo) {
		return memberMapper.photoDelete(fileNo);
	}

	@Override
	public List<GuestBook> guestBookList(int userNo) {
		return memberMapper.guestBookList(userNo);
	}

	@Override
	public int insertPost(GuestBook book) {
		
		return memberMapper.insertPost(book);
	}

	@Override
	public int deletePost(int postNo) {
		return memberMapper.deletePost(postNo);
	}

	@Override
	public List<Member> friendList(int userNo) {
		return memberMapper.friendList(userNo);
	}

	@Override
	public List<Member> searchFriend(String keyword) {
		return memberMapper.searchFriend(keyword);
	}

	@Override
	public List<Member> friendConfirm(int userNo) {
		return memberMapper.friendConfirm(userNo);
	}

	@Override
	public int follow(HashMap<String, Integer> map) {
		return memberMapper.follow(map);
	}

	@Override
	public int userDelete(int userNo) {
		return memberMapper.userDelete(userNo);
	}

	@Override
	public int confirmUpdate(HashMap<String, Integer> map) {
		return memberMapper.confirmUpdate(map);
	}

	@Override
	public int refuse(HashMap<String, Integer> map) {
		return memberMapper.refuse(map);
	}

	@Override
	public int updateAddress(Member member) {
		return memberMapper.updateAddress(member);
	}

	@Override
	public int insertAddress(Member member) {
		return memberMapper.insertAddress(member);
	}

	@Override
	public Member socialLogin(String socialId) {
		return memberMapper.socialLogin(socialId);
	}



}
