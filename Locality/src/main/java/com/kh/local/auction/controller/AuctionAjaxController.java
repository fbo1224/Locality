package com.kh.local.auction.controller;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.local.auction.model.service.AuctionService;
import com.kh.local.auction.model.vo.Auction;
import com.kh.local.auction.model.vo.AuctionResponse;
import com.kh.local.auction.model.vo.SearchResponse;
import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value="products", produces="application/json; charset=UTF-8")
public class AuctionAjaxController {
	
	private final AuctionService auctionService;
	
	@GetMapping("/{page}/{filter}")
	public String selectAuction(@PathVariable("page") int page, 
			                    @PathVariable("filter") String filter) {
        
	    PageInfo pi = Pagination.getPageInfo(auctionService.selectListCount(), page, 8, 10);
	    RowBounds rowBounds = new RowBounds(
	    	(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
	         pi.getBoardLimit());
	    
	    // 리스트 조회
	    List<Auction> auctions = auctionService.selectAuction(rowBounds, filter);
	      
	    // 응답
	    AuctionResponse response = new AuctionResponse();
	    response.setAuctions(auctions);
	    response.setPageInfo(pi);
	      
		return new Gson().toJson(response);
		
	}
	
	@PostMapping("/{filter}/{keyword}")
	public String searchAuction(@PathVariable("filter") String filter,
			                    @PathVariable("keyword") String keyword) {
		
		HashMap<String, String> map = new HashMap();
		map.put("filter", filter);
		map.put("keyword", keyword);
		List<Auction> searchList = auctionService.searchAuction(map);
		
		// 응답
		SearchResponse response = new SearchResponse();
		response.setSearchList(searchList);
		response.setKeyword(keyword);
		
		return new Gson().toJson(response);
	}
	
	@GetMapping("/detail.auction/{auctionNo}")
	public ModelAndView auctionDetail(@PathVariable int auctionNo, ModelAndView mv) {
		Auction auction = auctionService.auctionDetail(auctionNo);
		if(auctionService.increaseCount(auctionNo) > 0 && auction != null) {
			mv.addObject("auction", auction).setViewName("auction/detail");
		} else {
			mv.addObject("errorMsg", "상품 조회에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	
}
