package com.kh.local.auction.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.auction.model.service.AuctionService;
import com.kh.local.auction.model.vo.Auction;
import com.kh.local.auction.model.vo.Bid;
import com.kh.local.auction.model.vo.Save;
import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AuctionController {
	
	private final AuctionService auctionService;
	
	
	// 메인페이지 이동
	@GetMapping("auction")
	public String auctionMain() {
		// 날짜가 지난 상품들 중 입찰 가격이 가장 높은 것
		Bid bid = auctionService.selectRemainDate();
		// 상품 번호당 가장 높은 입찰금액(낙찰!) => 낙찰로 처리해줘야함(컨디션을 Y)
		
		if(bid != null) {
			// CONDITION컬럼으로 낙찰 표시
			//auctionService.changeCondition(prizeList);
			// 날짜 지난 상품 Status N처리
			if(auctionService.changeStatus(bid) > 0) {
				auctionService.deleteRecord(bid);
			}
		}
		return "auction/main";
	}
	
	// 상세페이지 이동
	@GetMapping("detail.auction")
	public ModelAndView auctionDetail(int auctionNo, ModelAndView mv) {
		Auction auction = auctionService.auctionDetail(auctionNo);
		if(auctionService.increaseCount(auctionNo) > 0 && auction != null) {
			mv.addObject("auction", auction).setViewName("auction/detail");
		} else {
			mv.addObject("errorMsg", "상품 조회에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 상세페이지에서 자기가 등록한 물품 삭제
	@GetMapping("delete.auction")
	public String auctionDelete(Save save, Model model, HttpSession session) {
		if(auctionService.deleteAuction(save) > 0) {
			session.setAttribute("alertMsg", "상품 1건을 삭제하였습니다.");
			return "redirect:/auction";
		} else {
			model.addAttribute("errorMsg", "상품을 삭제하지 못했습니다.");
			return "common/errorPage";
		}
		
		
	}
	
	// 경매 상품등록 페이지 이동
	@GetMapping("insert.page")
	public String insertPage() {
		return "auction/insertAuction";
	}
	
	// 경매 상품등록 INSERT
	@PostMapping("insert.auction")
	public String insertAuction(Auction auction, String seller, int scale, MultipartFile upfile, HttpSession session, Model model) {
		auction.setSeller(seller);
		auction.setCateNo(scale);
		

		if(!upfile.getOriginalFilename().equals("")) {
			auction.setImgPath(saveFile(upfile, session));
		}
		
		int auctionNo = auctionService.insertAuction(auction);
		auction.setAuctionNo(auctionNo);
		
		if(auctionNo > 0) {
			model.addAttribute("auctionNo", auction.getAuctionNo());
			session.setAttribute("alertMsg", "상품 1건이 등록되었습니다.");
			return "redirect:/detail.auction";
		} else {
			model.addAttribute("errorMsg", "상품 등록이 완료되지 않았습니다.");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)Math.random() * 90000 + 10000;
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("./resources/images/auction/upfiles/");
		// 파일 저장 경로 지정
		
		try {
			
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "./resources/images/auction/upfiles/" + changeName;
	}
	
	
	
	// 장바구니 추가하기
	@GetMapping("save.insert")
	@ResponseBody
	public String insertSave(Save save) {
		
		if(auctionService.selectSave(save) != null) {
			return "NE";
		} else {
			auctionService.insertSave(save);
			return "ET";
		}
	}
	
	// 내 장바구니 리스트
	@GetMapping("save.list")
	public String saveList(int userNo, Model model) {
		model.addAttribute("list", auctionService.selectSaveList(userNo));
		return "auction/saveList";
	}
	
	// 장바구니 리스트 삭제
	@GetMapping("save.delete")
	public String deleteSave(Save save, Model model, HttpSession session) {
		if(auctionService.deleteSave(save) > 0) {
			session.setAttribute("alertMsg", "상품 1건이 삭제되었습니다.");
			return "redirect:/save.list?userNo=" + save.getUserNo();
		} else {
			model.addAttribute("errorMsg", "삭제할 상품이 존재하지 않습니다.");
			return "common/errorMsg";
		}
	}
	
	// 입찰 진행 페이지로 이동
	@GetMapping("auction.result")
	public ModelAndView resultAuction(int userNo, ModelAndView mv) {
		List<Auction> list = auctionService.resultAuction(userNo);
		if(list != null) {
			mv.addObject("list", list).setViewName("auction/myBid");
		} else {
			mv.addObject("errorMsg", "입찰 진행 조회에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 입찰 진행페이지에서 입찰 취소
	@GetMapping("bid.cancel")
	public String cancelBid(Save save, HttpSession session, Model model) {
		if(auctionService.cancelBid(save) > 0) {
			session.setAttribute("alertMsg", "입찰이 취소되었습니다.");
			return "redirect:/auction.result?userNo=" + save.getUserNo();
		} else {
			model.addAttribute("errorMsg", "입찰을 취소하지 못했습니다.");
			return "common/errorPage";
		}
	}
	
	// 입찰하기
	@GetMapping("auction.bid")
	public String auctionBid(Bid bid, HttpSession session) {
		
		if(auctionService.updateBid(bid) == 0) {
			auctionService.auctionBid(bid);
			session.setAttribute("alertMsg", "입찰이 완료되었습니다.");
			return "redirect:/auction.result?userNo=" + bid.getUserNo();
		
		} else {
			session.setAttribute("errorMsg", "입찰에 실패하였습니다");
			return "common/errorPage";
		}
	}
	
	// 더보기 페이징
//	@ResponseBody
//	@GetMapping("more.do")
//	public List<MorePagination> morePage(MorePagination morepagination) {
//		
//		List<MorePagination> list = auctionService.morePage(morepagination);
//		
//		list;
//	}
	
	
}
