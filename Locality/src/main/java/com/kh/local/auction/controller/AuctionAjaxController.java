package com.kh.local.auction.controller;



import org.apache.ibatis.session.RowBounds;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.local.auction.model.service.AuctionService;
import com.kh.local.auction.model.vo.Auction;
import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value="products", produces="application/json; charset=UTF-8")
public class AuctionAjaxController {
	
	private final AuctionService auctionService;
	
	@GetMapping("/{page}/{filter}")
	public String selectAuction(@PathVariable("page") int page, @PathVariable("filter") String filter) {
		System.out.println(filter);
		System.out.println(page);
	      PageInfo pi = Pagination.getPageInfo(auctionService.selectListCount(), page, 12, 10);
	      RowBounds rowBounds = new RowBounds(
	            (pi.getCurrentPage() - 1) * pi.getBoardLimit(),
	            pi.getBoardLimit()
	            );
		return new Gson().toJson(auctionService.selectAuction(rowBounds, filter));
	}
	
	@GetMapping("/detail.auction/{auctionNo}")
	public ModelAndView auctionDetail(@PathVariable int auctionNo, ModelAndView mv) {
		System.out.println(auctionNo);
		Auction auction = auctionService.auctionDetail(auctionNo);
		if(auctionService.increaseCount(auctionNo) > 0 && auction != null) {
			mv.addObject("auction", auction).setViewName("auction/detail");
			
		} else {
			mv.addObject("errorMsg", "상품 조회에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	
}
