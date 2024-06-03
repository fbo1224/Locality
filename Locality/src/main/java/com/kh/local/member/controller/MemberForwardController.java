package com.kh.local.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.kh.local.member.model.vo.Member;

@Controller
public class MemberForwardController {

	@GetMapping("loginForm")
	public String userLoginForm() {
		return "login/userLoginForm";
	}
	@GetMapping("bizLoginForm")
	public String bizLoginForm() {
		return "login/bizLoginForm";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		session.removeAttribute("socialId");
		return "home";
	}
	
	@GetMapping("signUpForm")
	public String signUpForm() {
		return "login/signUpForm";
	}
	
	@GetMapping("myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	@GetMapping("updateUserForm")
	public String updateUserForm() {
		return "member/updateUserForm";
	}
	
	@GetMapping("miniPage")
	public String miniPage() {
		return "minihome/miniPage";
	}
	
	@GetMapping("miniDetail")
	public String miniDetail(int category, HttpSession session) {
		session.setAttribute("category", category);
		return "member/miniDetail";
	}
	
	@GetMapping("photoUploadForm")
	public String photoUploadForm() {
		return "minihome/photoUploadForm";
	}
	
	@GetMapping("guestBook")
	public String guestBook() {
		return "minihome/guestBook";
	}
	
	@GetMapping("friendAll")
	public String friend() {
		return "minihome/friend";
	}
	
	@GetMapping("mainPage")
	public String main() {
		return "main";
	}
	
	@GetMapping("friendMiniPage/{userNo}/{userName}/{result}")
	public ModelAndView friendMiniPage(@PathVariable("userNo") int userNo,
								       @PathVariable("userName") String userName,
								       @PathVariable("result") int result,
									   ModelAndView mv, HttpSession session) {
		int myNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		if(myNo == userNo) {
			mv.setViewName("redirect:/miniPage");
		}else {
			mv.addObject("friendNo", userNo)
			.addObject("friendName", userName)
			.addObject("result", result)
			.setViewName("minihome/userMiniPage");
		}
		
		return mv;
	}
	
	@GetMapping("userGuestBook/{friendNo}/{friendName}")
	public ModelAndView guestBook(@PathVariable("friendNo")int friendNo,
							      @PathVariable("friendName")String friendName,
								  ModelAndView mv) {
		mv.addObject("friendNo", friendNo)
		.addObject("friendName", friendName)
		.setViewName("minihome/userGuestBook");
		return mv;
	}
	
}
