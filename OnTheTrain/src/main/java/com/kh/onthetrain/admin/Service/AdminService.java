package com.kh.onthetrain.admin.Service;

import java.util.List;

import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

public interface AdminService {

	// 총 회원 수
	int getCountMember();

	// 회원리스트
	List<Member> getMemberList(PageInfo pageInfo);

}
