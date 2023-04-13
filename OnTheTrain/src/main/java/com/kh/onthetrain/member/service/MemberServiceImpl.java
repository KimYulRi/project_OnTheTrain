package com.kh.onthetrain.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.member.model.mapper.MemberMapper;
import com.kh.onthetrain.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 일반 로그인
	@Override
	public Member login(String id, String password) {
		Member member = null;
		
		member = mapper.selectMemberById(id);
		
		if(member != null && passwordEncoder.matches(password, member.getPassword())) {
			return member;
		} else {
			return null;
		}
	}
	
	// 간편 로그인 
	@Override
	public Member snsLogin(String id) {
		Member member = null;
		
		member = mapper.selectSnsMemberById(id);
		
		if(member != null) {
			return member;
		} else {
			return null;
		}
	}

}
