package com.kh.onthetrain.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
			
		return "member/login";
		}
	
	
	// 일반 로그인 처리
	@PostMapping(value="/login/in")
	public String loginIn(HttpSession session, Model model, @RequestParam String id, @RequestParam String password) {
		log.info("login() = 호출");
		
		Member loginMember = service.login(id, password);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
			
		} else {
			model.addAttribute("msg", "아이디 혹은 비밀번호를 잘못 입력 하셨습니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
	
		
	}
}

	
