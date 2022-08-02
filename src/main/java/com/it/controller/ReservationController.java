package com.it.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		log.info("total:" + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

/*	@GetMapping("/detailPage")
	public void detailPage(@RequestParam("member_id") String member_id, 
			 Model model) {
		log.info("ID: "+member_id);
		Map<String, List> cartMap= service.getReservList(member_id);
		
		
		model.addAttribute("detail", cartMap);
	}*/

	//예약 상세 페이지
	@GetMapping("/detailPage")
//	@PreAuthorize("isAuthenticated()")
	public void detailPage(@RequestParam("member_id") String member_id, Model model) {
		log.info("ID: " + member_id);
		Map<String, Class> detailMap = new HashMap<String, Class>();

		ReservationVO rvo = rService.getID(member_id);
		MemberVO mvo = mService.memberSelectID(member_id);

		model.addAttribute("reserv", rvo);
		model.addAttribute("member", mvo);
	}

	@GetMapping("/register")
//	@PreAuthorize("isAuthenticated()")
	public void register() {
		
/*		@GetMapping({"/get","/modify"})
		public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model)
		{
			log.info("/get or modify");
			model.addAttribute("board", service.get(bno));
		}*/
		
	}

	@PostMapping("/register")
//	@PreAuthorize("isAuthenticated()")
	public String register(ReservationVO reservation, RedirectAttributes rttr, Model model) {

		log.info("register:" + reservation);
		rService.register(reservation);
		
		log.info("reservation_number: "+reservation.getReservation_number());
		rttr.addFlashAttribute("result", reservation.getReservation_number());

//		return "/main";
		return "redirect:/rsv/list";
	}
	
//	@PreAuthorize("isAuthenticated()")
	/*@PreAuthorize("principal.username == #reservation_number")*/
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("reservation_number") Long reservation_number, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", rService.get(reservation_number));
	}
	
	//예약리스트 삭제
//	@PreAuthorize("principal.username == #reservation_number")
	@GetMapping("/remove")
		public String remove(Long reservation_number, Criteria cri) {
		
		rService.remove(reservation_number);
		
		return "redirect:/rsv/list";
	}
	
	//예약리스트 수정
//	@PreAuthorize("principal.username == #member_id")
	@PostMapping("/modify")
	public String modify(ReservationVO reservation, Criteria cri ) {
		rService.modify(reservation);
		
		return "redirect:/rsv/list";
	}
	
	
	
}

/*public String update(@PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails) {
    *//**
		 * @AuthenticationPrincipal PrincipalDetails principalDetails 위에 어노테이션을 통해서 세션
		 *                          정보를 바로 찾을 수 있다. System.out.println("세션 정보 : " +
		 *                          principalDetails.getUser());
		 *//*
			
			[출처] [Spring Security] #6 스프링부트 회원가입 및 로그인하기 - View 연결하기, 로그인 세션 정보 확인, Security taglibs|작성자 sosow0212*/
/*

Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
User user = (User)principal; 
String username = principal.getUsername();

 
Principal & Authentication 객체 활용

 

제가 사용한 방법입니다. 컨트롤러단에서 매개변수로 받아서 사용하는 방식입니다. 사용자 이름을 받아와서 model.addAttribute를 통해 view단에 이름을 넘겨줬습니다. 

 

    @GetMapping("/board/post")
    public String post(Model model,Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        model.addAttribute("author",userDetails.getUsername());
        return "board/post.html";
    }

@GetMapping("/")
public String username(Principal principal) { 
	System.out.println(principal.getName());
   	retutn "/";
}
//Principal 객체 활용하는 방법

 

게시글 작성 view 수정

 

<div class="form-group row">
            <label for="author" class="col-sm-2 col-form-label"><strong>작성자</strong></label>
            <div class="col-sm-10">
                <p class="" th:text="${author}" id = "author"></p>
                <input type="hidden" name="author" class="form-control" id="inputAuthor" th:value="${author}">
            </div>
        </div>*/
