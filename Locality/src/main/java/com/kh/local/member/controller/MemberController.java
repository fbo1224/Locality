package com.kh.local.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.member.model.service.MemberService;
import com.kh.local.member.model.vo.JpgFile;
import com.kh.local.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("loginConfirm")
	public ModelAndView loginConfirm(ModelAndView mv, Member member, HttpSession session, HttpServletResponse response) {
		
		int num = (member.getIdChecked() != null) ? 1*60*60*24*15 : 0;
		Cookie idCookie = new Cookie("userId", member.getUserId());
		idCookie.setMaxAge(num);
		response.addCookie(idCookie);
		
		Member loginUser = memberService.loginConfirm(member);
		if(loginUser != null && bcryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
		} else {
			mv.addObject("alertMsg", "아이디 또는 비밀번호가 일치하지 않습니다").setViewName("login/userLoginForm");
		}
		return mv;
	}
	
	
	@PostMapping("signUpUser")
	public ModelAndView signUpUser(ModelAndView mv, Member member, HttpSession session) {
		
		member.setUserPwd(bcryptPasswordEncoder.encode(member.getUserPwd()));
		
		String msg = (memberService.signUpUser(member) > 0) ? "회원가입 완료" : "회원가입에 실패 했습니다. 다시 진행해주세요";
		
		session.setAttribute("alertMsg", msg);
		mv.setViewName("home");
		
		return mv;
	}
	
	@PostMapping("updateUser")
	public ModelAndView updateUser(ModelAndView mv, Member member, HttpSession session) {
		
		int result = memberService.updateUser(member);
		
		if(((Member)session.getAttribute("loginUser")).getAddress() != null) {
			result *= memberService.updateAddress(member);
		}else {
			result *= memberService.insertAddress(member);
		}
		
		String path = (result > 0) ? "home" : "member/myPage";
		String msg = (result > 0) ? "개인 정보 수정 완료됐습니다. 다시 로그인 해주세요!!"  : "수정에 실패 했습니다. 다시 진행해주세요" ;
		
		session.setAttribute("alertMsg", msg);
		mv.setViewName(path);
		
		return mv;
	}
	
	@GetMapping("photoBook")
	public ModelAndView photoBook(ModelAndView mv, HttpSession session) {
		
		mv.addObject("photoList", memberService.photo(((Member)session.getAttribute("loginUser")).getUserNo()))
		.setViewName("minihome/photoBook");
		
		return mv;
	}
	
	@PostMapping("photoUpload")
	public ModelAndView photoUpload(JpgFile jpg, ModelAndView mv, MultipartFile imageFile, HttpSession session) throws IOException {
		
		String originName = imageFile.getOriginalFilename();
		
		int ranNum = (int) Math.random() * 90000 + 10000;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/photoUpload/");
		
		jpg.setOriginName(originName);
		jpg.setChangeName(changeName);
		jpg.setFilePath(savePath);
		jpg.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		String msg = "";
		if(memberService.photoUpload(jpg) > 0) {
			imageFile.transferTo(new File(savePath + changeName));
			msg = "사진첨부 완료";
		}else {
			msg = "사진첨부 실패";
		}
		session.setAttribute("alertMsg", msg);
		mv.setViewName("redirect:/photoBook");
		
		return mv;
	}
	
	@PostMapping("photoDelete")
	public ModelAndView photoDelete(ModelAndView mv, JpgFile photo, HttpSession session) {
		
		String msg = "";
		if(memberService.photoDelete(photo.getFileNo()) > 0) {
			new File(photo.getFilePath() + photo.getChangeName()).delete();
			msg = "삭제되었습니다.";
		} else {
			msg = "실패했습니다.";
		}
		session.setAttribute("alertMsg", msg);
		mv.setViewName("redirect:photoBook");
		return mv;
	}
	
	
	@GetMapping("userPhoto/{userNo}/{userName}")
	public ModelAndView userPhoto(@PathVariable("userNo")int userNo, 
								  @PathVariable("userName")String userName,
								  ModelAndView mv) {
		
		mv.addObject("friendNo", userNo)
		.addObject("friendName", userName)
		.addObject("photoList", memberService.photo(userNo))
		.setViewName("minihome/userPhotoBook");
		
		return mv;
	}
	
	@PostMapping("userDelete")
	public ModelAndView userDelete(HttpSession session, ModelAndView mv) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		if(memberService.userDelete(userNo)> 0) {
			session.removeAttribute("loginUser");
			mv.addObject("alertMsg", "탈퇴 완료")
			.setViewName("home");
		}else {
			mv.addObject("alertMsg", "다시 시도해주세요")
			.setViewName("member/myPage");
		}
		return mv;
	}
	
	@PostMapping("confirmUpdate")
	public ModelAndView confirmUpdate(ModelAndView mv,HttpSession session, Member member) {
		
		System.out.println(member);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("friendNo", member.getFriendNo());
		map.put("userNo", member.getUserNo());
		
		String msg = (memberService.confirmUpdate(memberService.friendSelect(map)) > 0) ? "승인완료됐습니다." : "오류발생";
		session.setAttribute("alertMsg", msg);
		
		mv.setViewName("redirect:friendAll");
		
		return mv;
	}
	
	@PostMapping("refuse")
	public ModelAndView refuse(ModelAndView mv,HttpSession session, Member member) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("friendNo", member.getFriendNo());
		map.put("userNo", member.getUserNo());
		
		String msg = (memberService.refuse(memberService.friendSelect(map)) > 0) ? "거절완료됐습니다." : "오류발생";
		session.setAttribute("alertMsg", msg);
		
		mv.setViewName("redirect:friendAll");
		
		return mv;
		
	}
	
}
