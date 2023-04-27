package com.kh.onthetrain.admin.Service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onthetrain.admin.model.mapper.AdminMapper;
import com.kh.onthetrain.admin.model.vo.AccommodationReservation;
import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.admin.model.vo.TrainTicketReservation;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	/* 대시보드 */
	// 오늘의 가입자 수 
	@Override
	public int todayEnrollCount() {
		return mapper.countEnroll();
	}
	
	// 미답변문의 수 구하기
	@Override
	public int unansweredCount() {
		return mapper.countUnanswered();
	}
	
	// 월별 가입자 정보 가져오기
	@Override
	public List<Map<String, Object>>  getMonthEnroll(){
		return mapper.selectMonthEnroll();
	}

	// 오늘의 승차권예약수
	@Override
	public int todayTicketCount() {
		return mapper.countTodayTicket();
	}
	
	// 오늘의 숙소예약수
	@Override
	public int todayAccCount() {
		return mapper.countTodayAcc();
	}
	
	// 전체 예약수
	@Override
	public int getCountReservation() {
		return mapper.countTotalReservation();
	};
	
	/* 회원관리 */
	// 총 회원수
	@Override
	public int getCountMember() {
		return mapper.countMember();
	}
	
	// 회원 리스트
	@Override
	public List<Member> getMemberList(PageInfo pageInfo){
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1 ) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Member> list = mapper.getMemberList(rowBounds);
		
		for (Member member : list) {
			if(member.getLoginType()!=null) {
			member.setLoginTypeText(member.getLoginType());}
			member.setMembershipText(member.getMembership());
			member.setStatusText(member.getStatus());
		}
				
		return list;
	}
	
	// 회원 정보 가져오기
	@Override
	public Member findMemberByNo(int no) {
	
		Member member = mapper.findMemberByNo(no);
		
		if(member != null) {
			if(member.getLoginType()!=null) {
					member.setLoginTypeText(member.getLoginType());
					}
					member.setMembershipText(member.getMembership());
		
					member.setStatusText(member.getStatus());
			return member;
		}else {
			return null;
		}

	}
	
	/* 승차권 */
	// 총 승차권수(환불 포함)
	@Override
	public int getCountTicket() {
		
		return mapper.countTicket();
	}
	
	// 승차권 리스트 가져오기
	@Override
	public List<TrainTicketReservation> getTicketReservation(PageInfo pageInfo){
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1 ) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<TrainTicketReservation> list = mapper.getTicketReservationList(rowBounds);
		return list;
	}

//	
	// 총 숙박예약 수(환불 포함)
	@Override
	public int getCountAccommodation() {
		
		return mapper.countAccommodation();
	}

	// 숙박 예약 리스트 가져오기
	@Override
	public List<AccommodationReservation> getAccommodationList(PageInfo pageInfo){
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1 ) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<AccommodationReservation> list = mapper.getAccommodationReservationList(rowBounds);
		return list;
		
	}
	
	
	/* 자주묻는 질문*/
	@Override
	public List<Faq> getFaqList(){
		
		List<Faq> list = mapper.selectFaqList();
		
		return list;
	}
	

	/* 1:1 문의 */
	
	// 총 1:1문의 수
	@Override
	public int getCountQna() {
		return mapper.countQna();
	}
	
	@Override
	public List<Qna> getQnaList(PageInfo pageInfo){
		List<Qna> list = mapper.selectQnaList();
		return list;
	}
	
	// 문의 답글 수정
	@Override
	public 
	int updateQnaReply(QnaReply reply) {
		
		int result = 0;
		
		if(reply.getQnaReplyNo() > 0) {
			//update
			result = mapper.updateQnaReply(reply);
		}else {
			// insert
		}
		
		return result;
	}
	
	// 문의 답변 삭제
	@Override
	@Transactional
	public int replyDelete(int no, int replyno) {
		int result = mapper.deleteReply(replyno);
		if(result > 0) {
			return mapper.updateQnaDelteReply(no);
		}else {
			return result;
		}
	}
	
	
	/* 공지사항 */
	
	// 총 공지사항 수
	@Override
	public int getCountNotice() {
		
		return mapper.countNotice();
	}
	
	// 공지사항 리스트
	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo){
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1 ) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Notice> list = mapper.getNoticeList(rowBounds);
				
		return list;
	}
	// 공지사항 고정리스트
	@Override
	public List<Notice> getFixList(){
		List<Notice> list = mapper.getFixNoticeList();

		return list;
	}
	
	// 상단고정 개수 체크(개수가 1~2개이면 true, 3개이상이면 false)
	@Override
	public boolean fixCheck() {
		int fix = mapper.countFix();
		
		if(fix>=3) {return false;}
		else {return true;}
		
	}
	
	// 공지사항 상세페이지
	@Override
	public Notice findNotice(int no) {
		Notice notice = mapper.selectNoticeByNo(no);
		return notice;
	}
	
	
	// 공지사항 등록
	@Override
	@Transactional
	public int save(Notice notice){
		
		int result = 0;
		
		if(notice.getNo() > 0) {
			//update
			result = mapper.updateNotice(notice);
		}else {
			// insert
			result = mapper.insertNotice(notice);
			
		}
		
		return result;
	}
	
	// 상단고정 3개이상
	@Override
	@Transactional
	public int updateSave(Notice notice){
		
		int result = 0;
		
		if(notice.getNo() > 0) {
			//update
			if(mapper.deleteFix()>0) {
				result = mapper.updateNotice(notice);
			}
		}else {
			// insert
			if(mapper.deleteFix()>0) {
				result = mapper.insertNotice(notice);
			}
		}
		return result;
	}
	
	
	// 공지사항 삭제
	@Override
	@Transactional
	public int noticeDelete(int no) {
		
		return mapper.deleteNotice(no);
	}
}
