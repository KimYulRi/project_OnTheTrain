package com.kh.onthetrain.admin.Service;

import java.util.List;
import java.util.Map;

import com.kh.onthetrain.admin.model.vo.AccommodationReservation;
import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.admin.model.vo.TrainTicketReservation;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;

public interface AdminService {

	/* 대시보드 */
	// 오늘의 가입자수
	int todayEnrollCount();
	// 미답변문의 수 구하기
	int unansweredCount();
	// 오늘의 승차권예약수
	int todayTicketCount();
	// 오늘의 숙소예약수
	int todayAccCount();
	
	// 전체 예약수
	int getCountReservation();
	// 월별 가입자 정보 가져오기
	List<Map<String, Object>> getMonthEnroll();
	
	/* 회원 */
	// 총 회원 수
	int getCountMember();

	


	// 회원리스트
	List<Member> getMemberList(PageInfo pageInfo);

	// 회원 정보 가져오기
	Member findMemberByNo(int no);
	
	/* 승차권 */
	// 총 승차권 수(취소포함)
	int getCountTicket();
	
	// 승차권 리스트 가져오기
	List<TrainTicketReservation> getTicketReservation(PageInfo pageInfo);

	
	/* 숙박 */
	// 총 숙박예약 수(취소포함)
	int getCountAccommodation();

	// 숙박 예약 리스트 가져오기
	List<AccommodationReservation> getAccommodationList(PageInfo pageInfo);
	
	/* 1:1 문의 */
	// 총 1:1문의 수
	int getCountQna();
	
	// 문의 리스트
	List<Qna> getQnaList(PageInfo pageInfo);
	
	// 문의 답글 수정
	int updateQnaReply(QnaReply reply);
	
	// 문의 답변 삭제
	int replyDelete(int no, int replyno);
	
	
	
	/* 자주묻는 질문*/
	List<Faq> getFaqList();

	/* 공지사항 */
	// 총 공지사항 수
	int getCountNotice();
	
	// 공지사항 리스트(전체)
	List<Notice> getNoticeList(PageInfo pageInfo);
	// 공지사항 리스트 (고정)
	List<Notice> getFixList();
	
	// 공지사항 상세페이지
	Notice findNotice(int no);

	// 상단고정 개수 체크(개수가 1~2개이면 true, 3개이상이면 false)
	boolean fixCheck();

	// 공지사항 등록, 수정	
	// fix체크안하거나 2개이하
	int save(Notice notice);
	// 상단고정 3개이상
	int updateSave(Notice notice);
	
	// 공지사항 삭제
	int noticeDelete(int no);
	






}
