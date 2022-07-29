package com.it.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.it.domain.Criteria;
import com.it.domain.PageDTO;
import com.it.domain.VocVO;
import com.it.service.VocServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/voc/*")
@AllArgsConstructor
public class VocController {
	private VocServiceImpl service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total=service.getTotal(cri);
		log.info("total: "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(VocVO voc,
			RedirectAttributes rttr) {
		
		log.info("register: "+voc);
		service.register(voc);
		rttr.addFlashAttribute("result",voc.getBoard_number());
		return "redirect:/voc/list";
	}
	
}
