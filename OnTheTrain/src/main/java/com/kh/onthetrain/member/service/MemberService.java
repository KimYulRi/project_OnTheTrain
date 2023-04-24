package com.kh.onthetrain.member.service;

import com.kh.onthetrain.member.model.vo.Member;

public interface MemberService {

	// 일반 로그인
	Member login(String id, String password);
	
	// 간편 로그인
	Member snsLogin(String id);

	// 아이디 중복 체크
	boolean isDuplicateId(String id);

	// 닉네임 중복 체크
	boolean isDuplicateNickname(String nickname);

	// 이메일 중복 체크
	boolean isDuplicateEmail(String email);

	// 회원저장
	int save(Member member);
	
	// sns회원 저장
	int saveSns(Member member);
	
	// email으로 회원찾기(snsMember 연결해서 조회)
	Member findMemberByEmail(String email);

	// name, email과 일치하는 회원찾기 (아이디찾기)
	String findId(String name, String email);

	// 비밀번호 재설정
	int updatePwd(String id, String email, String password);

	
}
