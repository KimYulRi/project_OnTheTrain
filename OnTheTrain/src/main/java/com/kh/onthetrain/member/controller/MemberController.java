package com.kh.onthetrain.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onthetrain.member.model.service.MemberService;

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
	public String loginIn(@RequestParam String id, @RequestParam String password) {
		log.info("login() = 호출");
		return "redirect:/";
		}
	}

	
