package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.it.domain.MemberVO;
import com.it.service.MemberServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class MemberContoroller {
	@Setter(onMethod_= @Autowired)
	private MemberServiceImpl service;
	
	//회원가입 페이지 이동
	@GetMapping("/member/join")
	public void loginGet() {
		
	}
		//회원가입
	@PostMapping("/member/join")
	public String logindo(MemberVO member) {
		service.memberInsert(member);
		return "redirect:/voc/list";
	}
	
	//권한없음
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth) {
		log.info("access Denied :" + auth);
		
	}
	
	@GetMapping("/logout")
	public String logout() {
		log.info("logout");
		return "home";
	}
	
	

}
