package com.kh.onthetrain.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	// 아이디 중복 체크
	@Override
	public boolean isDuplicateId(String id) {
		
		Member member = mapper.selectMemberById(id);
		
		return member == null; //아이디가 없으면 true, 있으면 false
	}

	// 닉네임 중복 체크
	@Override
	public boolean isDuplicateNickname(String nickname) {
		
		Member member = mapper.selectMemberByNicknameAll(nickname);
		
		return member == null; //닉네임이 없으면 true, 있으면 false
	}
	
	// 이메일 중복체크
	@Override
	public boolean isDuplicateEmail(String email) {
		
		Member member = mapper.selectMemberByEmailAll(email);
		
		return member == null; //이메일이 없으면 true, 있으면 false
	}
	
	// 회원 저장
	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() > 0) {
			// update
		} else {
			// insert
			member.setPassword(passwordEncoder.encode(member.getPassword()));
			result = mapper.insertMember(member);
		}
		
		return result;
	}
	// sns회원 저장
	@Override
	@Transactional
	public int saveSns(Member member) {
		int result = 0;
		
		if(member.getNo() > 0) {
			// update
		} else {
			// insert
			result = mapper.insertMemberBySns(member);
			if(result == 1) {
				result = mapper.insertLinkedSns(member);
			}
		}
		
		return result;
	}
	
	// email으로 회원찾기(snsMember 연결해서 조회)
	@Override
	public Member findMemberByEmail(String email) {
		
		Member member = mapper.findMemberByEmail(email);
		
		if(member != null) {
			return member;
		} else {
			return null;
		}
		
	}
	
	// name, email과 일치하는 회원찾기 (아이디찾기)
	@Override
	public String findId(String name, String email) {
		
		String id = mapper.findId(name,email);
		
		return id;
	}
	
	// 비밀번호 재설정
	@Override
	@Transactional
	public int updatePwd(String id, String email, String password) {
		int result = mapper.updatePwd(id, email, passwordEncoder.encode(password));
		return result;
	}

}
