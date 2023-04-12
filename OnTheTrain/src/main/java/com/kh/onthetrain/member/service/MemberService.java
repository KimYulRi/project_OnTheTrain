package com.kh.onthetrain.member.service;

import com.kh.onthetrain.member.model.vo.Member;

public interface MemberService {

	Member login(String id, String password);

}
