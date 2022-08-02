package com.it.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.it.domain.QnaVO;
import com.it.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor  // 이 생성자메소드를 쓸 때는 Setter 불필요
public class QnaController {
	
	private QnaService service;
	
	// 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("qna_number") Long qna_number, 
			RedirectAttributes rttr) {
		
		log.info("remove..." + qna_number);
		
		if(service.remove(qna_number)) {
			rttr.addFlashAttribute("result", "seccess");
		}
		return "redirect:/qna/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("qna_number") Long qna_number, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("qna", service.get(qna_number));
	}

	// 수정
	@PostMapping("/modify")
	public String modify(QnaVO qna, RedirectAttributes rttr) {
		
		log.info("modify:" + qna);
		
		service.modify(qna);
		
		
		return "redirect:/qua/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	// 등록
	@PostMapping("/register")
	public String register(QnaVO qna, RedirectAttributes rttr) {
		
		log.info("register:" + qna);
		
		service.register(qna);
		
		rttr.addFlashAttribute("result", qna.getQna_number());
		
		return "redirect:/qna/list";
	}
	
	
	
	
	
	// 목록
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
		
		
	}
	
}
