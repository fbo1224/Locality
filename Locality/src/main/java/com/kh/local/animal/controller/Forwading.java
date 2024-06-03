package com.kh.local.animal.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.animal.model.service.animalService;
import com.kh.local.animal.model.vo.Animal;
import com.kh.local.animal.model.vo.AnimalBoard;
import com.kh.local.animal.model.vo.Attachment;
import com.kh.local.animal.model.vo.Report;
import com.kh.local.common.model.vo.AreaInfomation;
import com.kh.local.common.model.vo.PageInfo;
import com.kh.local.common.template.Pagination;
import com.kh.local.member.model.vo.Member;

@Controller
public class Forwading {

	@Autowired
	private animalService service;
	
	// 등록된 반려동물 정보
	public Animal animalInfo(HttpSession session, String animalName) {
			
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		// int형을 String으로 변환
		String user = Integer.toString(userNo);
		
		HashMap<String, String> info = new HashMap<String, String>();
		info.put("animalName", animalName);
		info.put("user", user);
		
		return service.animalInfo(info);
	}


	@RequestMapping("main") // ��, �� ���� 
	public String forward(HttpSession session){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
	//	service.viewMain(userNo);
		
		if(loginUser !=null) {
		return "animal/firstPage";		
		} else {
			session.setAttribute("alertMsg", "로그인이 안되어있습니다");
			return "common/errorPage";
		}
	}
	
	@GetMapping("boardList")
	public String boardList(@RequestParam(value="page", defaultValue="1")
	int page, Model model) {



		PageInfo pi =Pagination.getPageInfo(service.BoardCount(), page, 4, 10);
		
		
		

		model.addAttribute("list", service.BoardList(pi));
		
		model.addAttribute("pageInfo", pi);
		
	//	System.out.println(service.BoardList(pi).toString());
	
		return "animal/boardList";
	}
	
	// 카테고리 옵션 선택시 값 추출 
	//	@ResponseBody
		@GetMapping("keywordList")
		public ModelAndView keywordList(@RequestParam(value="page", defaultValue="1")  int page,String category, ModelAndView model) {
			PageInfo pi =Pagination.getPageInfo(service.BoardCount(), page, 5, 5);
			System.out.println(service.keywordList(pi,category));
			
			model.addObject("list",service.keywordList(pi, category)).addObject("pageInfo",pi).setViewName("animal/boardList");
			return model;
		}
		
	@GetMapping("searchkeyword")
	public ModelAndView searchKeyword(@RequestParam(value="page",defaultValue="1") int page, String category, String keyword,ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(service.BoardCount(), page, 5, 5);
	//	System.out.println(category);
	//	System.out.println(keyword);

		
		HashMap<String, String> map = new HashMap();
		map.put("category", category);
		map.put("keyword", keyword);
		
		if(service.searchkeyword(pi,map) == null) {
			mv.addObject("alertMsg", "조회결과가 없습니다").setViewName("common/errorPage");
		}else {
			mv.addObject("list", service.searchkeyword(pi, map)).addObject("pageInfo", pi).setViewName("animal/boardList");
		};
		
		return mv;
		
	}
	// 게시판 글 작성양식 
	@RequestMapping("enrollform")
	public String enrollForm() {
		return "animal/boardEnrollForm";
	}
	

	@RequestMapping("viewDetail")
	public String boardDetail(int boardNo, Model model) {
		service.viewDetail(boardNo);
		model.addAttribute("AnimalBoard", service.viewDetail(boardNo));
		return "animal/boardDetail";
	}
	
	@PostMapping("insertAnimalBoard")
	public String insert(AnimalBoard board, MultipartFile upfile, HttpSession session, Model model) throws IllegalStateException, IOException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		board.setUserNo(loginUser.getUserNo());
		String category = board.getCategoryName();
		String animalName = board.getAnimalName();
		int result = 1;
		
		// 카테고리를 카테고리 no로 변환 
		switch(category) {
		case "묻고답해요" 			: board.setCategoryNo(1); break;
		case "반려동물TIP" 		: board.setCategoryNo(2); break;
		case "일상공유" 			: board.setCategoryNo(3); break;
		case "소개합니다" 			: board.setCategoryNo(4); break;
		}
		
		Attachment attachment = new Attachment();
		
		 service.insertAnimalBoard(board);
		
		if(!upfile.getOriginalFilename().equals("")) {
			attachment.setOriginName(upfile.getOriginalFilename());
			attachment.setChangeName(saveFile(upfile,session));
			result = service.insertAttachment(attachment);
		}
		
		if(result*service.insertAnimalBoard(board)>0) {
			model.addAttribute("animal",animalInfo(session,animalName));
			model.addAttribute("alertMsg","게시글이 등록되었습니다");
			return "animal/boardList";
			
		} else {
			model.addAttribute("errorMsg","게시글이 등록되지 않았습니다");
			return "animal/boardList";
		}
	}
	
	
	@RequestMapping("hospital")
	public ModelAndView viewHospital (HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int code =  loginUser.getAreasCode();
		
		AreaInfomation info = service.information(code);
		
		if(service.information(code) !=null) {
			mv.addObject("area",service.information(code)).setViewName("animal/hospital");
		} else {
			mv.addObject("alertMsg","로그인이 되어있지 않습니다").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("report")
	public String viewSalon() {
		return "animal/report";
	}
	
	@PostMapping("insertReport")
	public String insertReport(Report report, MultipartFile upfile, HttpSession session, Model model) throws IllegalStateException, IOException {
		// 첨부파일 테이블에 들어갈 USERNO 추출 
		Member loginUser = (Member)session.getAttribute("loginUser");
		report.setUserNo(loginUser.getUserNo());
		
		// 첨부파일 여부를 1(성공)으로 일단 초기화
		int result = 1;
		
		Attachment attachment = new Attachment();
		
		service.insertContent(report);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			attachment.setOriginName(upfile.getOriginalFilename());
			attachment.setChangeName(saveFile(upfile,session));
			attachment.setFilePath(saveFile(upfile, session));
			result = service.insertReport(attachment);
		}
		
		if(service.insertContent(report)*result > 0) {
			session.setAttribute("alertMsg", "게시글을 등록하였습니다");
			return "redirect:animal/firstPage";
		} else {
			session.setAttribute("alertMsg", "게시글이 등록되지 않았습니다");
			return "common/errorPage";
		}
		
		
		
		
		
	
		
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) throws IllegalStateException, IOException {
		
		String originName = upfile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)Math.random()*90000 + 10000;
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadedFiles");
		
		upfile.transferTo(new File(savePath + changeName));
	
		return "resources/uploadedFiles" + changeName;
	}
	@RequestMapping("fowarding") 
	public String fowarding() {
		return "animal/boardEnrollForm2";
	}
	
	@PostMapping("attachment")
	public void attachment(MultipartFile upfile,HttpSession session) throws IllegalStateException, IOException {
		System.out.println(upfile);
		Attachment attachment = new Attachment();
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			attachment.setOriginName(upfile.getOriginalFilename());
			attachment.setChangeName(saveFile(upfile,session));
			attachment.setFilePath(saveFile(upfile, session));
			attachment.setReportNo(1);
			service.defaultAttachment(attachment);
		}
		
	}
	
	
	
}
