package com.kh.local.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.local.community.model.service.CommunityService;
import com.kh.local.community.model.vo.CommuLikeVO;
import com.kh.local.community.model.vo.CommuReplyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CommunityAjaxController {

	
	private final CommunityService commuService;
	
	
	@ResponseBody
	@GetMapping(value="reply", produces="application/json; charset=UTF-8")
	public String selectReply(int commuNo) {
		
		return new Gson().toJson(commuService.selectReply(commuNo));
		
	}
	
	@ResponseBody
	@PostMapping("reply")
	public String insertReply(CommuReplyVO reply) {
		return commuService.insertReply(reply) > 0 ? "success" : "fail";
	}
	
	
	@ResponseBody
	@PostMapping("like")
	public String insertLike(CommuLikeVO like) {
		
		return commuService.increaseLike(like) > 0 ? "seccess" : "fail";
		
		
	}
	
	
}
