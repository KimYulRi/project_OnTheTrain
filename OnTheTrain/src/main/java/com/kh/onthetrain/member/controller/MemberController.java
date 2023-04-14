package com.kh.onthetrain.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.onthetrain.member.api.KakaoLoginBo;
import com.kh.onthetrain.member.api.NaverLoginBo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
   
   @Autowired
   private MemberService service;
   
   /* NaverLoginBo */
   private NaverLoginBo naverLoginBO;
   private KakaoLoginBo kakaoLoginBO;
   private String apiResult = null;
	
   @Autowired
   private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
   @Autowired
   private void setKaokaoLoginBO(KakaoLoginBo kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}
	
   // 로그인 페이지
   @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST} )
   public String login(Model model, HttpSession session) {
	   
	    // 간편로그인 Url 생성
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		
		//네이버 
		model.addAttribute("Nurl", naverAuthUrl);
		//카카오
		model.addAttribute("Kurl", kakaoAuthUrl);

      return "member/login";
      }
   
   // 로그아웃
   @GetMapping("/logout")
   public String logout(SessionStatus status) {
      status.setComplete();
      return "redirect:/";
      }
   
   
   // 일반 로그인
   @PostMapping(value="/login/in")
   public ModelAndView loginIn(HttpSession session, ModelAndView modelAndView,  HttpServletResponse response, @RequestParam String id, @RequestParam String password, @RequestParam(required = false) String rememberId) {
      log.info("login() = 호출");
      
      Member loginMember = service.login(id, password);
      
      // 아이디 저장
      if(rememberId != null) {
    	  Cookie cookie = new Cookie("rememberId", id);
    	  cookie.setMaxAge(259200);
    	  response.addCookie(cookie);
      }else{
    	  Cookie cookie = new Cookie("rememberId", id);
    	  cookie.setMaxAge(0);
    	  response.addCookie(cookie);
      }
      
      // 로그인
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
   
   // 회원가입
   @RequestMapping(value = "/enroll", method = {RequestMethod.GET, RequestMethod.POST} )
   public String enroll() {
	   log.info("enroll() = 호출");
	   
	   return "member/enroll";
   }
   
   // 카카오 로그인
   @GetMapping(value="/login/kakao")
   public ModelAndView kakaoLogin(ModelAndView modelAndView, @RequestParam(value="code", required=false) String code, @RequestParam String state, HttpSession session) throws Exception {
	   
	   // 인가 코드로 토큰 획득
	   OAuth2AccessToken oauthToken;
	   oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
	   System.out.println("카카오토큰"+oauthToken);
	   
	   // 토큰으로 사용자 정보 받아오기
       String apiResult = kakaoLoginBO.getUserInfo(oauthToken);
       System.out.println("카카오사용자정보"+apiResult);
       
       // JSON 파싱
       JsonParser parser = new JsonParser();
       JsonElement element = parser.parse(apiResult);
       
       JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
       JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
       
       String id = element.getAsJsonObject().get("id").getAsString();
       String nickname = properties.getAsJsonObject().get("nickname").getAsString();
       String email = kakao_account.getAsJsonObject().get("email").getAsString();
		
       // 회원이면 로그인
       Member loginMember = service.snsLogin(id);
				
       // 회원이 아니면 회원가입 페이지로 이동
       if(loginMember != null) {
			System.out.println(loginMember);
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/");
		} else {
			modelAndView.addObject("msg", "카카오 로그인 실패");
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("common/msg");
		}
	
       return modelAndView;
	}
   
   
   // 네이버 로그인
 	@RequestMapping(value = "/login/naver", method = { RequestMethod.GET, RequestMethod.POST })
 	public ModelAndView naverLogin(ModelAndView modelAndView, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
 		
		// 인가 코드로 토큰 획득
 		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
         
        // 토큰으로 사용자 정보 받아오기
        String apiResult = naverLoginBO.getUserInfo(oauthToken);
        
        System.out.println("네이버 컨트롤러 apiResult");
        
        // JSON 파싱
 		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(apiResult);
		JsonObject jsonObj = element.getAsJsonObject().get("response").getAsJsonObject();
		
		String id = jsonObj.getAsJsonObject().get("id").getAsString();
		String email = jsonObj.getAsJsonObject().get("email").getAsString();
		String nickname = jsonObj.getAsJsonObject().get("nickname").getAsString();

		// 회원이면 로그인
		Member loginMember = service.snsLogin(id);
				
//		 회원이 아니면 회원가입 페이지로 이동
		if(loginMember != null) {
			System.out.println(loginMember);
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.setViewName("redirect:/");
		} else {
			modelAndView.addObject("msg", "네이버 로그인 실패");
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("common/msg");
		}
		
		return modelAndView;

 	}
   
}
