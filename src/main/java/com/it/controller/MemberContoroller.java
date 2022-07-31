package com.it.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.it.domain.MemberVO;
import com.it.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberContoroller {
	
	private MemberServiceImpl service;
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public void login() {
		
	}
	
	//회원가입 페이지 이동
	@GetMapping("/join")
	public void loginGet() {
		
	}
	//회원가입
	@PostMapping("/join")
	public String logindo(MemberVO member) {
		service.memberRegister(member);
		return "redirect:/member/login";
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
