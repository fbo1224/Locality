package com.kh.local.member.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.local.common.model.vo.Message;
import com.kh.local.member.model.service.MemberService;
import com.kh.local.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("signUp/")
@RequiredArgsConstructor
public class SignUpAjaxController {

	private final JavaMailSender sender;
	private final MemberService memberService; 
	private final Message message;

	public ResponseEntity<Message> merge(Message message){
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		return new ResponseEntity<Message>(message, headers, HttpStatus.OK);
	}
	
	
	@PostMapping("{email}")
	public ResponseEntity<Message> emailSend(@PathVariable("email")String email) throws MessagingException {
		
		MimeMessage messenger = sender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(messenger, true, "UTF-8");
		
		int num = (int)(Math.random() * 100000) + 10000; 
		
		helper.setTo(email);
		helper.setSubject("LOCALITY인증번호입니다.");
		helper.setText("<h1>인증번호 입니다</h1>" + num, true);
		
		sender.send(messenger);
		
		message.setData(num);
		message.setMessage("인증번호");
		message.setResponseCode("200");
		
		return merge(message);
	}
	
	@PostMapping("/confirm/{email}")
	public ResponseEntity<Message> emailConfirm(@PathVariable("email") String email) {
		message.setData(memberService.emailConfirm(email));
		message.setMessage("이메일 인증");
		message.setResponseCode("200");
		return merge(message); 
	}
	
	@GetMapping("{cityNo}")
	public ResponseEntity<Message> citySearch(@PathVariable("cityNo") int cityNo) {
		
		
		message.setData(memberService.citySearch(cityNo));
		message.setMessage("도시 리스트");
		message.setResponseCode("200");
		
		return merge(message);
	}
	
	
	@GetMapping("{nickName}/{phone}")
	public ResponseEntity<Message> nickPhoneConfirm(@PathVariable("nickName")String nickName, 
								   @PathVariable("phone") String phone) {
		
		Member member = new Member();
		member.setNickName(nickName);
		member.setPhone(phone);
		
		List<Integer> list = memberService.nickPhoneConfirm(member);
		
		int confirmName = list.get(0);
		int confirmPhone = list.get(1);
		
		if(confirmName == 0 && confirmPhone == 0) {
			message.setData("okay");
		}else if(confirmName != 0 && confirmPhone == 0) {
			message.setData("nickName");
		}else if(confirmName == 0 && confirmPhone != 0) {
			message.setData("phone");
		}else {
			message.setData("no");
		}
		
		return merge(message);
	}
}