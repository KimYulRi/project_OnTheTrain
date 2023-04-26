package com.kh.onthetrain.admin.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;

@Mapper
public interface AdminMapper {

	/* 대시보드 */
	int countEnroll();
	
	int countUnanswered();

	List<Map<String, Object>> selectMonthEnroll();

	/* 회원 */
	int countMember();
	
	List<Member> getMemberList(@Param("rowBounds") RowBounds bounds);
	
	Member findMemberByNo(@Param("no") int no);
	
	/* 승차권 */
	int countTicket();
	
	/* 1:1문의 */
	int countQna();
	List<Qna> selectQnaList();
	
	/* 자주 묻는 질문 */
	List<Faq> selectFaqList();

	/* 공지사항*/
	int countNotice();

	List<Notice> getNoticeList(@Param("rowBounds") RowBounds bounds);
	
	List<Notice> getFixNoticeList();
	
	int insertNotice(Notice notice);

	Notice selectNoticeByNo(@Param("no") int no);

	int deleteNotice(@Param("no") int no);

	int countFix();

	int deleteFix();

	int updateNotice(Notice notice);





}
