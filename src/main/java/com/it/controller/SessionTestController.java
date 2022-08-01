package com.it.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/*@Controller
@SessionAttributes("user")
public class SessionTestController {

	@PostMapping("/testLogin")
	public String doLogion(@ModelAttribute("user") User user, Model model) {
		HttpSession session = request
		
		return "testLogin";
	}
}*/

@Controller
@RequestMapping("/Test/")
public class SessionTestController {
	
//	@GetMapping("/test")
//	public String test(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String id = "kim";
//		session.setAttribute("login_id", id);
//		
//		return "Test/test";
//	}	
	
	@RequestMapping("/test")
	public String test2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		
		System.out.println("세션 저장 변수: "+id);
		
		return "Test/test";
	}
}