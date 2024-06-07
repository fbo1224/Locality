package com.kh.local.member.controller;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.local.common.model.vo.Message;
import com.kh.local.member.model.service.MemberService;
import com.kh.local.member.model.vo.GuestBook;
import com.kh.local.member.model.vo.Member;

@RestController
@RequestMapping("miniPage/")
public class MiniAjaxController {
	
	
	private MemberService memberService; 
	private Message message;
	
	public MiniAjaxController(MemberService memberService, Message message) {
		this.memberService = memberService;
		this.message = message;
	}
	
	public ResponseEntity<Message> merge(Message message){
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		return new ResponseEntity<Message>(message, headers, HttpStatus.OK);
	}
	
	@GetMapping("/book/{userNo}")
	public ResponseEntity<Message> guestBookList(@PathVariable("userNo")int userNo) {
		
		List<GuestBook> list = memberService.guestBookList(userNo);
		List<GuestBook> gbList = new ArrayList();
		if(list.isEmpty()) {
			message.setMessage("조회결과 없음");
			message.setResponseCode("204");
		}else {
			message.setMessage("조회결과 있음");
			message.setResponseCode("200");
		}
		
		for(GuestBook result : list) {
			String change = result.getPostContent();
			change.replaceAll("&nbsp;", " ");
			change.replaceAll("<br>", "\\n");
			result.setPostContent(change);
			gbList.add(result);
		}
		message.setData(gbList);
		return merge(message);
	}
	
	@PostMapping("{postUser}/{content}/{nickName}")
	public ResponseEntity<Message> insertPost(@PathVariable("postUser")int postUser,
							 @PathVariable("content")String postContent,
							 @PathVariable("nickName")String nickName) {
		String msg = "";
		GuestBook book = new GuestBook();
		book.setPostUser(postUser);
		book.setPostContent(postContent);
		book.setNickName(nickName);
		
		String change = book.getPostContent();
		change = change.replaceAll(" ", "&nbsp;");
		book.setPostContent(change.replaceAll("\\n", "<br>"));
		msg = (memberService.insertPost(book) > 0) ? "Y" : "N";
		
		message.setData(msg);
		message.setMessage("방명록 작성 결과");
		message.setResponseCode(!msg.equals("Y") ? "400": "200");
		
		Message m = new Message("안녕","안녕", "200");
		return merge(message);
	}
	
	@PostMapping("/delete/{postNo}")
	public ResponseEntity<Message> deletePost(@PathVariable("postNo")int postNo) {
		
		String msg = (memberService.deletePost(postNo) > 0) ? "success" : "fail";
		message.setData(msg);
		message.setMessage("방명록 댓글 삭제");
		message.setResponseCode(msg.equals("success") ? "200" : "400");
		
		return merge(message);
		
	}
	@GetMapping("{userNo}")
	public ResponseEntity<Message> friendList(@PathVariable("userNo")int userNo){
		
		message.setData(memberService.friendList(userNo));
		message.setMessage("친구 전체 리스트");
		message.setResponseCode("200");
		
		return merge(message);
	}
	@GetMapping("/search/{keyword}")
	public ResponseEntity<Message> searchFriend(@PathVariable("keyword")String keyword){
		
		message.setData(memberService.searchFriend(keyword));
		message.setMessage("친구 조회");
		message.setResponseCode("200");
		
		return merge(message);
	}
	@GetMapping("/confirm/{userNo}")
	public ResponseEntity<Message> friendConfirm(@PathVariable("userNo")int userNo){
		
		message.setData(memberService.friendConfirm(userNo));
		message.setMessage("친구 요청 리스트");
		message.setResponseCode("200");
		
		return merge(message);
	}
	
	@PostMapping("/follow/{friend}")
	public ResponseEntity<Message> follow(@PathVariable("friend")int friend, HttpSession session) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", ((Member)session.getAttribute("loginUser")).getUserNo());
		map.put("firendNo", friend);
		
		message.setData(memberService.follow(map));
		message.setMessage("친구추가");
		message.setResponseCode("200");
		
		return merge(message);
	}
	
	@PostMapping("/friendDelete/{friendNo}/{userNo}")
	public ResponseEntity<Message> refuse(@PathVariable("friendNo") int friendNo, @PathVariable("userNo")int userNo, HttpSession session){
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", userNo);
		map.put("firendNo", friendNo);
		
		message.setData(memberService.refuse(memberService.friendSelect(map)));
		message.setMessage("친구삭제");
		message.setResponseCode("200");
		
		return merge(message);
	}
	
	@PostMapping("/updateConfirm/{friendNo}/{userNo}")
	public ResponseEntity<Message> confirmUpdate(@PathVariable("friendNo") int friendNo, @PathVariable("userNo")int userNo){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", userNo);
		map.put("firendNo", friendNo);
		
		message.setData(memberService.confirmUpdate(memberService.friendSelect(map)));
		message.setMessage("친구승인");
		message.setResponseCode("200");
		
		return merge(message);
	}
	
}
