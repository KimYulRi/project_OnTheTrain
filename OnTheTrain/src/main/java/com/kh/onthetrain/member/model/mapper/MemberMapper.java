package com.kh.onthetrain.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	// id(일반)로 회원 찾기
	Member selectMemberById(@Param("id") String id);
	// id(sns)로 간편로그인 회원 찾기
	Member selectSnsMemberById(@Param("id") String id);
	
	// id(일반)로 회원 찾기(중복확인)
	Member selectMemberByIdAll(@Param("id") String id);
	// nickname으로 회원 찾기(중복확인)
	Member selectMemberByNicknameAll(@Param("nickname") String nickname);
	// email으로 회원 찾기(중복확인)
	Member selectMemberByEmailAll(@Param("email") String email);
	
	// 회원삽입 (일반로그인)
	int insertMember(Member member);
	// 회원삽입 (간편로그인-MEMBER 테이블)
	int insertMemberBySns(Member member);
	// 회원삽입 (간편로그인-SNS_LOGIN테이블)
	int insertLinkedSns(Member member);
	
	// email으로 회원찾기(snsMember 연결해서 조회)
	Member findMemberByEmail(@Param("email") String email);
	
	// name, email과 일치하는 회원찾기 (아이디찾기)
	String findId(@Param("name") String name, @Param("email") String email);
	
	// 비밀번호 재설정
	int updatePwd(@Param("id") String id, @Param("email") String email, @Param("password") String password);
}
