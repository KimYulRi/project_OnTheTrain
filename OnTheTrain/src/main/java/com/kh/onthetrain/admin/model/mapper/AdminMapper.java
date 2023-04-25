package com.kh.onthetrain.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.member.model.vo.Member;

@Mapper
public interface AdminMapper {

	/* 회원 */
	int countMember();
	
	List<Member> getMemberList(@Param("rowBounds") RowBounds bounds);
	
	Member findMemberByNo(@Param("no") int no);
	
	/* 승차권 */
	int countTicket();
	
	/* 자주 묻는 질문 */
	List<Faq> findFaqList();

	/* 공지사항 글쓰기*/
	int saveNotice(@Param("notice") Notice notice);
}
