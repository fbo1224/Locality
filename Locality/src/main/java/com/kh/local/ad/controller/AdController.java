package com.kh.local.ad.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.ad.model.service.AdService;
import com.kh.local.ad.model.vo.AdBoardVO;
import com.kh.local.ad.model.vo.AdPhotoVO;
import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdController {

	
	private final AdService adService;
	
	
	@GetMapping("ad")
	public String selectAll(@RequestParam(value="page", defaultValue="1") int page, int areasNo, int category, Model model) {
		
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();	
		map.put("areasNo", areasNo);
		map.put("category", category);
		
		int listCount = adService.selectListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, page, 6, 5);
		List<AdBoardVO> list = adService.selectAll(pi, map);
				
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "ad/adList";
	}
	

	@RequestMapping("adDetail")
	public ModelAndView selectBoard(int adNo, ModelAndView mv) {
		if(adService.increaseCount(adNo) > 0) {
			mv.addObject("board", adService.selectBoard(adNo)).setViewName("ad/adDetail");;
		} else {
			mv.addObject("errorMsg", "게시글이 존재하지 않습니다").setViewName("common/error");
		}
		return mv;
	}
	
	@PostMapping("adDelete")
	public String deleteboard(int adNo, int areasNo, String filePath, HttpSession session) {
		
		if(adService.deleteBoard(adNo) > 0) {
			
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "게시글삭제성공");
			return "redirect:ad?areasNo="+areasNo+"&category=0";
		} else {
			session.setAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@PostMapping("adUpdate.do")
	public ModelAndView updateForwarding(int adNo, ModelAndView mv) {
		
		mv.addObject("board", adService.selectBoard(adNo)).setViewName("ad/adUpdate");
		
		return mv;
	}
	
	@PostMapping("adUpdate")
	public String update(@ModelAttribute AdBoardVO board, MultipartFile reUpfile, HttpSession session) {
		
		int photoResult = 1;
		if(!reUpfile.getOriginalFilename().equals("")) {
		
			if(board.getChangeName() != null) {
				new File(session.getServletContext().getRealPath(board.getChangeName())).delete();
			}	
				AdPhotoVO photo = new AdPhotoVO();
				photo.setOriginName(reUpfile.getOriginalFilename());
				photo.setChangeName(saveFile(reUpfile, session));
				photo.setAdNo(board.getAdNo());
				photoResult = adService.updatePhoto(photo);
				
		}
		int boardResult = adService.updateBoard(board);
		System.out.println(boardResult);
			
		if(boardResult * photoResult > 0) {
			session.setAttribute("alertMsg", "수정완료");
			return "redirect:adDetail?adNo="+ board.getAdNo();
		} else {
			session.setAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		

	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)Math.random() * 90000 + 10000;
		
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/images/ad");
		
		
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
		
		
		
		return "resources/images/ad" + changeName;
	
	}
	
	@RequestMapping("adEnrollForm")
	public String forward() {
		return "ad/adEnrollForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
