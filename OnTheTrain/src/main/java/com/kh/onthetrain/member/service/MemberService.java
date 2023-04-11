package com.kh.onthetrain.member.service;

import java.util.HashMap;

import com.kh.onthetrain.member.model.vo.Member;

public interface MemberService {

	// 일반 로그인
	Member login(String id, String password);

	// 카카오 로그인 - 토근가져오기
	String getAccessToken(String code);
	
	// 카카오 로그인 - 
	HashMap<String, Object> getUserInfo(String accessToken);
	
	// 카카오 로그인 - 
	Member loginKakao(String id, String email);
	
	
	

}
