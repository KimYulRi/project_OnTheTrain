package com.kh.onthetrain.member.controller;

import java.util.HashMap;

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
   
   @Autowired
	private MemberService ms;
		
   @GetMapping(value="/login/kakao")
   public ModelAndView kakaoLogin(ModelAndView modelAndView, @RequestParam(value="code", required=false) String code) throws Exception {
		System.out.println("#########" + code);
		String accessToken = ms.getAccessToken(code);
		
		HashMap<String, Object> userInfo = ms.getUserInfo(accessToken);
		System.out.println("###accessToken### : " + accessToken);
		System.out.println("###nickname### : " + userInfo.get("nickname"));
		System.out.println("###email### : " + userInfo.get("email"));
		System.out.println("###id### : " + userInfo.get("id"));
		
		String id = (String) userInfo.get("id");
		String email = (String) userInfo.get("email");
		String nickname = (String) userInfo.get("nickname");
		
		// 회원이 아니면 회원가입 페이지로 이동
		
		// 회원이면 로그인
		Member loginMember = service.loginKakao(id, email);
				
		if(loginMember != null) {
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/");
		} else {
			modelAndView.addObject("msg", "카카오 로그인 실패");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		}
		return modelAndView;
	}
   
   
}
