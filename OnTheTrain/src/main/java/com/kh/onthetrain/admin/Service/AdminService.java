package com.kh.onthetrain.admin.Service;

import java.util.List;

import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

public interface AdminService {

	/* 회원 */
	// 총 회원 수
	int getCountMember();

	// 회원리스트
	List<Member> getMemberList(PageInfo pageInfo);

	// 회원 정보 가져오기
	Member findMemberByNo(int no);

	
	/* 승차권 */
	// 총 승차권 수
	int getCountTicket();

}
