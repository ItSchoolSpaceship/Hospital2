package com.it.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.it.domain.MemberVO;
import com.it.domain.PageDTO;
import com.it.domain.ReservationVO;
import com.it.service.MemberServiceImpl;
import com.it.service.ReservationServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rsv/*")
@AllArgsConstructor
public class ReservationController {
	private ReservationServiceImpl rService;
	private MemberServiceImpl mService;

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", rService.getList(cri));

		int total = rService.getTotal(cri);
		
	    log.info("total:" +total); model.addAttribute("pageMaker", new
	    PageDTO(cri,total));

	}
	
/*	@GetMapping("/detailPage")
	public void detailPage(@RequestParam("member_id") String member_id, 
			 Model model) {
		log.info("ID: "+member_id);
		Map<String, List> cartMap= service.getReservList(member_id);
		
		
		model.addAttribute("detail", cartMap);
	}*/
	
	@PostMapping("/detailPage")
	public void detailPage(@RequestParam("member_id") String member_id, 
			 Model model) {
		log.info("ID: "+member_id);
		Map<String, Class> detailMap = new HashMap<String, Class>();
		
		ReservationVO rvo = rService.getID(member_id);
		MemberVO mvo = mService.memberSelect(member_id);
		
		model.addAttribute("reserv", rvo);
		model.addAttribute("member", mvo);
	}

	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(ReservationVO reservation, RedirectAttributes rttr) {

		log.info("register:" + reservation);
		rService.register(reservation);
		rttr.addFlashAttribute("result", reservation.getReservation_number());

		return "redirect:/rsv/list";
	}

}
