package com.kh.local.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;
import com.kh.local.notice.model.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	
	// 고객센터 이동
	// 게시판 리스트 조회
	@GetMapping("customer")
	public String customerPage(@RequestParam(value="page", defaultValue="1")
								int page, Model model) {
		
		
		PageInfo pi = Pagination.getPageInfo(noticeService.selectListCount(), page, 5, 5);
		
		model.addAttribute("list", noticeService.selectList(pi));
		model.addAttribute("pageInfo", pi);
		
		return "customer/customer";
	}
	
	// 공지사항 상세조회
	@GetMapping("detail.notice")
	public ModelAndView detailNotice(int noticeNo, ModelAndView mv) {
		
		if(noticeService.increaseCount(noticeNo) > 0) {
			mv.addObject(noticeService.selectNotice(noticeNo)).setViewName("customer/detail");
		} else {
			mv.addObject("errorMsg", "게시판 상세조회에 실패했습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
}
