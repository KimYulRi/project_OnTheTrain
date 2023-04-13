package com.kh.onthetrain.member.service;

import com.kh.onthetrain.member.model.vo.Member;

public interface MemberService {

	// 일반 로그인
	Member login(String id, String password);
	
	// 간편 로그인
	Member snsLogin(String id);
	
}
