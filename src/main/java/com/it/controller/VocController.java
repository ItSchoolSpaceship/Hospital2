package com.it.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	  
	  log.info("register: " + voc);
	  service.register(voc);
	  rttr.addFlashAttribute("result",voc.getBoard_number()); 
	  
	  return "redirect:/voc/list";
	  
	  }
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("board_number") Long board_number,
			@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get of modify");
		model.addAttribute("voc",service.get(board_number));
	}
	
	@PreAuthorize("principal.username == #voc.board_writer")
	@PostMapping("/modify")
	public String modify(VocVO voc, Criteria cri, RedirectAttributes rttr) {
		log.info("modify: "+voc);
		if(service.modify(voc)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/voc/list" + cri.getListLink();
	}
	@PreAuthorize("principal.username == #voc.board_writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("board_number") Long board_number,
			Criteria cri, RedirectAttributes rttr, String board_writer) {
		log.info("remove..." + board_number);
		if(service.remove(board_number)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/voc/list" + cri.getListLink();
	}
	
}