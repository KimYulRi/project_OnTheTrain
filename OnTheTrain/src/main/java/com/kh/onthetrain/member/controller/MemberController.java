package com.kh.onthetrain.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
   
   @Autowired
   private MemberService service;
   
   // 로그인 페이지
   @GetMapping("/login")
   public String login() {
         
      return "member/login";
      }
   
   // 로그아웃
   @GetMapping("/logout")
   public String logout(SessionStatus status) {
      status.setComplete();
      return "redirect:/";
      }
   
   
   // 일반 로그인 처리
   @PostMapping(value="/login/in")
   public ModelAndView loginIn(HttpSession session, ModelAndView modelAndView, @RequestParam String id, @RequestParam String password) {
      log.info("login() = 호출");
      
      Member loginMember = service.login(id, password);
      
      if(loginMember != null) {
         modelAndView.addObject("loginMember", loginMember);
         modelAndView.setViewName("redirect:/");

      } else {
         
         modelAndView.addObject("msg", "아이디 혹은 비밀번호를 잘못 입력 하셨습니다.");
         modelAndView.addObject("location", "/login");
         modelAndView.setViewName("common/msg");
      }
      
      return modelAndView;
      
   }
   
   @PostMapping(value="/enroll")
   public String enroll() {
	   log.info("login() = 호출");
	   
	   return "member/enroll";
   }
   
   
}
