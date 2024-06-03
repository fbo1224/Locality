package com.kh.local.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;
import com.kh.local.community.model.service.CommunityService;
import com.kh.local.community.model.vo.CommuBoardVO;
import com.kh.local.community.model.vo.CommuPhotoVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class CommunityController {
	
	
	private final CommunityService commuService;
	
	
	
	@RequestMapping("commu")
	public String selectAll(@RequestParam(value="page",defaultValue="1") int page, int areasNo, Model model) {
		
	
		int listCount = commuService.selectListCount(areasNo);
		//System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, page, 10, 5);
		//System.out.println(pi);
		List<CommuBoardVO> list = commuService.selectList(pi, areasNo);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pi);
		
		
		
		
		return "community/commu";
	}
	
	
	
	@RequestMapping("commu.enrollForm")
	public String communityEnrollForm() {
		return "community/commuEnrollForm";
	}
	
	
	@RequestMapping("insert")
	public String insert(CommuBoardVO board, MultipartFile upfile, HttpSession session, Model model) {
		
		int boardResult = commuService.insertBoard(board);
		int photoResult = 1;

		if(!upfile.getOriginalFilename().equals("")) {
			CommuPhotoVO photo = new CommuPhotoVO();	
			photo.setOriginName(upfile.getOriginalFilename());
			photo.setChangeName(saveFile(upfile, session));
			photo.setFilePath("/resources/images/commu");
			photoResult = commuService.insertPhoto(photo);
		} 
		
		if(boardResult * photoResult > 0) {
			session.setAttribute("alertMsg", "게시글 등록에 성공하였습니다.");
			return "redirect:commu?areasNo="+board.getAreasNo();
		} else {
			model.addAttribute("errorMsg", "게시글등록 실패");
			return "common/errorPage";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)Math.random() * 90000 + 10000;
		
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/images/commu");
		
		
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
		
		
		
		return "resources/images/commu" + changeName;
		
	}
		
	
	@RequestMapping("commudetail")
	public ModelAndView detail(int commuNo, ModelAndView mv) {
		if(commuService.increaseCount(commuNo) > 0) {
			
			mv.addObject(commuService.selectBoard(commuNo)).setViewName("community/communityDetail");
		} else {
			mv.addObject("errorMsg", "조회에 실패했습니다.").setViewName("common/errorPage");
		}
		 
		
		return mv;
	}	
	
	@RequestMapping("delete.commu")
	public String deleteBoard(int commuNo, int areasNo, String filePath, HttpSession session) {
		if(commuService.deleteBoard(commuNo) > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "게시글삭제성공");
			return "redirect:commu?areasNo="+areasNo;
		} else {
			session.setAttribute("errorMsg", "삭제실패");
			return "common/errorPage";
		}
	}
	
	
	@PostMapping("updateForm.commu")
	public ModelAndView updateForm(int commuNo, ModelAndView mv) {
		mv.addObject(commuService.selectBoard(commuNo)).setViewName("community/commuUpdate");
		return mv;
	}
	
	@PostMapping("update.commu")
	public String update(@ModelAttribute CommuBoardVO board, MultipartFile reUpfile, HttpSession session) {
		
		
		int photoResult = 1;
		if(!reUpfile.getOriginalFilename().equals("")) {
		
			if(board.getChangeName() != null) {
				new File(session.getServletContext().getRealPath(board.getChangeName())).delete();
			}	
				CommuPhotoVO photo = new CommuPhotoVO();
				photo.setOriginName(reUpfile.getOriginalFilename());
				photo.setChangeName(saveFile(reUpfile, session));
				photo.setCommuNo(board.getCommuNo());
				photoResult = commuService.updatePhoto(photo);
		}
		int boardResult = commuService.updateBoard(board);
			
		if(boardResult * photoResult > 0) {
			session.setAttribute("alertMsg", "수정완료");
			return "redirect:detail?commuNo="+ board.getCommuNo();
		} else {
			session.setAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("commuSearch")
	public String searchBoard(@RequestParam(value="page", defaultValue="1") int page, String countyName, String condition, String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("countyName", countyName);
		System.out.println(map);
		int searchCount = commuService.searchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, page, 10, 5);
		
		model.addAttribute("list", commuService.searchSelect(pi, map));
		model.addAttribute("pageInfo", pi);
		
		return "community/commu";
	}

	
	

	
	
	
	
	
	
	
	
	
	

}
