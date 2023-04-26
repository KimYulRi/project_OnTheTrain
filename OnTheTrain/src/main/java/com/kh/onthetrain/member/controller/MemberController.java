package com.kh.onthetrain.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.onthetrain.member.api.KakaoLoginBo;
import com.kh.onthetrain.member.api.NaverLoginBo;
import com.kh.onthetrain.member.api.SendEmail;
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
    	 if(loginMember.getStatus().equals("N")){
    		 // 정지된 회원인 경우
    		 modelAndView.addObject("msg", "정지된 회원입니다. 관리자에게 문의하세요");
             modelAndView.addObject("location", "/login");
             modelAndView.setViewName("common/msg");
    	 }else {
    		 // 로그인 성공
	         modelAndView.addObject("loginMember", loginMember);
	         modelAndView.setViewName("redirect:/");
    	 }

      } else {
         modelAndView.addObject("msg", "아이디 혹은 비밀번호를 잘못 입력 하셨습니다.");
         modelAndView.addObject("location", "/login");
         modelAndView.setViewName("common/msg");
      }
      
      return modelAndView;
      
   }
   
   // 카카오 로그인
   @GetMapping(value="/login/kakao")
   public ModelAndView kakaoLogin(ModelAndView modelAndView, @RequestParam(value="code", required=false) String code, @RequestParam String state, HttpSession session, RedirectAttributes redirectAttributes,  HttpServletRequest request) throws Exception {
	   
	   // 인가 코드로 토큰 획득
	   OAuth2AccessToken oauthToken;
	   oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
	   
	   // 토큰으로 사용자 정보 받아오기
       String apiResult = kakaoLoginBO.getUserInfo(oauthToken);
       
       // JSON 파싱
       JsonParser parser = new JsonParser();
       JsonElement element = parser.parse(apiResult);
       
       JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
       JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
       
       String id = element.getAsJsonObject().get("id").getAsString();
       String nickname = properties.getAsJsonObject().get("nickname").getAsString();
       String email = kakao_account.getAsJsonObject().get("email").getAsString();
		
       // 회원찾기
       Member loginMember = service.snsLogin(id);
				
       // 회원찾기 성공
       if(loginMember != null) {
			if(loginMember.getStatus().equals("N")){
	    		 // 정지된 회원인 경우
	    		 modelAndView.addObject("msg", "정지된 회원입니다. 관리자에게 문의하세요");
	             modelAndView.addObject("location", "/login");
	             modelAndView.setViewName("common/msg");
			}else {
				// 로그인 성공
				session = request.getSession();
				session.setAttribute("loginMember", loginMember);
				modelAndView.setViewName("redirect:/");
			}
			
		// 회원찾기 실패
		}else {
			// 회원정보를 찾지 못했을 때 email을 통해 다른 로그인회원인지 확인
			Member findMember = service.findMemberByEmail(email);
			
			// 회원이 아니면(email로 못찾았을때) 회원가입 페이지로 이동
			if(findMember == null) {
				Member member = new Member();
				member.setSnsId(id);
				member.setEmail(email);
				member.setNickname(nickname);
				member.setLoginType("K");
				
				redirectAttributes.addFlashAttribute("member", member);
				modelAndView.setViewName("redirect:/enroll/sns");
				return modelAndView;
				
			}else if(findMember.getLoginType()==null) {
			// 일반회원
				modelAndView.addObject("msg1", "일반회원으로 이미 가입된 계정입니다.");
				modelAndView.addObject("msg2",  email + " 일반 로그인 해주세요");
			}else if(findMember.getLoginType().equals("N")) {
			// 네이버
				modelAndView.addObject("msg1", "네이버로 이미 가입된 계정입니다.");
				modelAndView.addObject("msg2",   email + " 네이버로 로그인 해주세요");
			}else if(findMember.getStatus().equals("N")) {
			// status == N 이면 정지된 회원
				modelAndView.addObject("msg1", "정지된 회원입니다. 관리자에게 문의해주세요.");
			}else {
				modelAndView.addObject("msg1", "로그인에 실패 하셨습니다.");
			}
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("member/loginMsg");
		}
       return modelAndView;
	}
   
   
   // 네이버 로그인
 	@RequestMapping(value = "/login/naver", method = { RequestMethod.GET, RequestMethod.POST })
 	public ModelAndView naverLogin(ModelAndView modelAndView, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request) throws IOException, ParseException {
 		
		// 인가 코드로 토큰 획득
 		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
         
        // 토큰으로 사용자 정보 받아오기
        String apiResult = naverLoginBO.getUserInfo(oauthToken);
        
        
        // JSON 파싱
 		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(apiResult);
		JsonObject jsonObj = element.getAsJsonObject().get("response").getAsJsonObject();
		
		String id = jsonObj.getAsJsonObject().get("id").getAsString();
		String email = jsonObj.getAsJsonObject().get("email").getAsString();
		String nickname = jsonObj.getAsJsonObject().get("nickname").getAsString();
		String phone = jsonObj.getAsJsonObject().get("mobile").getAsString();
		String name = jsonObj.getAsJsonObject().get("name").getAsString();
		String birthS = jsonObj.getAsJsonObject().get("birthyear").getAsString() + "-" +jsonObj.getAsJsonObject().get("birthday").getAsString();
		Date birth = Date.valueOf(birthS);
		
		// 회원찾기
		Member loginMember = service.snsLogin(id);
		
		// 회원찾기 성공
		if(loginMember != null) {
			if(loginMember.getStatus().equals("N")){
	    		 // 정지된 회원인 경우
	    		 modelAndView.addObject("msg", "정지된 회원입니다. 관리자에게 문의하세요");
	             modelAndView.addObject("location", "/login");
	             modelAndView.setViewName("common/msg");
			}else {
				// 로그인 성공
				session = request.getSession();
				session.setAttribute("loginMember", loginMember);
				modelAndView.setViewName("redirect:/");
			}
		// 회원찾기 실패
		} else {
			// 회원정보를 찾지 못했을 때 email을 통해 다른 로그인회원인지 확인
			Member findMember = service.findMemberByEmail(email);
			
			// 회원이 아니면(email로 못찾았을때) 회원가입 페이지로 이동
			if(findMember == null) {
				Member member = new Member();
				member.setSnsId(id);
				member.setEmail(email);
				member.setNickname(nickname);
				member.setLoginType("N");
				member.setPhone(phone);
				member.setName(name);
				member.setBirth(birth);
				redirectAttributes.addFlashAttribute("member", member);
				modelAndView.setViewName("redirect:/enroll/sns");
				return modelAndView;
				
			}else if(findMember.getLoginType()==null) {
			// 일반회원
				modelAndView.addObject("msg1", "일반회원으로 이미 가입된 계정입니다.");
				modelAndView.addObject("msg2",  email + " 일반 로그인 해주세요");
			}else if(findMember.getLoginType().equals("K")) {
			// 카카오
				modelAndView.addObject("msg1", "카카오로 이미 가입된 계정입니다.");
				modelAndView.addObject("msg2",   email + " 카카오로 로그인 해주세요");
			}else if(findMember.getStatus().equals("N")) {
			// status == N 이면 정지된 회원
				modelAndView.addObject("msg1", "정지된 회원입니다. 관리자에게 문의해주세요.");
			}else {
				modelAndView.addObject("msg1", "로그인에 실패 하셨습니다.");
			}
			modelAndView.addObject("location", "/login");
			modelAndView.setViewName("member/loginMsg");
		}
		return modelAndView;
 	}
    
    // 일반 회원가입
    @GetMapping(value="/enroll")
    public String enroll(Model model) {
 	   log.info("enroll() = 호출");
 	   
 	   return "member/enroll";
    }
    
    // 간편 회원가입
    @GetMapping(value="/enroll/sns")
    public String enrollSns(Model model,  @ModelAttribute("member") Member member) {
 	   log.info("enroll()간편로그인 = 호출");
 	   if(member.getLoginType() == null){
 		  model.addAttribute("msg", "다시 시도해 주세요.");
 		  model.addAttribute("location", "/login");
 		 return "common/msg";
 	   }else {
 		   model.addAttribute("msg",  "가입된 계정이 아닙니다. 회원가입을 먼저 진행해주세요.");
 		   model.addAttribute("member", member);
 		   return "member/enroll";
 	   }
    }
    
    // 회원가입(Insert)
    @PostMapping(value="/enroll")
    public ModelAndView enrollInsert(ModelAndView modelAndView, @ModelAttribute Member member) {
    	int result = 0;
		
    	if(member.getLoginType()==null) {
    		result = service.save(member);
    	}
    	// 간편회원가입
    	else {
    		result = service.saveSns(member);
    	}
		
		if(result > 0) {
			modelAndView.addObject("msg", "환영합니다! 회원가입이 성공적으로 완료되었습니다.");
			modelAndView.addObject("location", "/");
		} else {
			modelAndView.addObject("msg", "회원가입에 실패하였습니다.  다시 시도해주세요.");
			modelAndView.addObject("location", "/enroll");
			
		}
		
		modelAndView.setViewName("common/msg");
 	   
 	   return modelAndView;
    }
 	
 	// 아이디 중복확인
 	@ResponseBody
	@PostMapping("/idCheck")
	public boolean idCheck(@RequestParam String userId) {
		
 		//아이디가 없으면 true, 있으면 false
		return service.isDuplicateId(userId);
	}
 	
 	// 닉네임 중복확인
 	@ResponseBody
	@PostMapping("/nicknameCheck")
	public boolean nicknameCheck(@RequestParam String nickname) {
		
 		//닉네임이 없으면 true, 있으면 false
		return service.isDuplicateNickname(nickname);
	}
 	
 	// 이메일 중복확인
  	@ResponseBody
 	@PostMapping("/emailCheck")
 	public boolean emailCheck(@RequestParam String email) {
 		
  		//이메일이 없으면 true, 있으면 false
 		return service.isDuplicateEmail(email);
 	}

    // 아이디 찾기 페이지
    @GetMapping(value="/login/find")
    public String findId(Model model) {
 	   log.info("findId() = 호출");
 	   
 	   return "member/findId";
    }
    
    // 아이디 찾기
    @ResponseBody
    @PostMapping(value="/login/find")
    public Map<String, String> findId(@RequestParam String name, @RequestParam String email) {
    	log.info("findId() = 호출");
    	Map<String, String> map = new HashMap<>();
    	String id = service.findId(name, email);
    	map.put("id", id);
    	return map;
    }
    

    // 비밀번호 찾기 페이지
    @GetMapping(value="/login/findPw")
    public String findPwd(Model model) {
 	   log.info("findPwd() = 호출");
 	   
 	   return "member/findPwd";
    }
    
    // 비밀번호 임시비밀번호 update, 메일전송
    @ResponseBody
    @PostMapping(value="/login/findPw")
    public Map<String, String> findPwd(Model model, @RequestParam String id, @RequestParam String email) {
 	  log.info("post findPwd() = 호출");
 	  
 	  Map<String, String> map = new HashMap<>();
 	  String password = RandomStringUtils.randomAlphanumeric(10);
 		
 	  int result = service.updatePwd(id, email, password);
 	  
 	  // id, email에 해당하는 회원의 비밀번호 재설정
 	  if(result > 0) {
 		  SendEmail.sendEmail(email, password);
 		  map.put("update", "true");
 	  } else {
		  map.put("update", null);
	  }
 	   
 	  return map ;
    }
    
}
