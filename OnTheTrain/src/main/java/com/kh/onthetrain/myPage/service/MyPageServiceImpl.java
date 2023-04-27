package com.kh.onthetrain.myPage.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.MyPageCoupon;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.model.entity.ReservationCheck;
import com.kh.onthetrain.myPage.model.mapper.MyPageMapper;
import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.trainTable.model.vo.TrainTicket;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	// 사용자의 no를 가지고 작성한 문의글을 가져오는 메소드
	@Override
	public List<Qna> getQnaListByMemberNo(int no, PageInfo pageInfo) {
		
		System.out.println(no);
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		
		return mapper.selectQnaListByMemberNo(no, rowBounds);
	}

	// 문의 게시글을 작성하는 메소드
	@Override
	public int save(Qna qna) {
		
		
			

		return mapper.insertQna(qna);
	}
	
	
	// 문의 게시글 번호를 가지고 문의 게시글을 찾는 메소드
	@Override
	public Qna findQnaByNo(int no) {
		
		return mapper.findQnaByNo(no);
	}

	// 관리자가 문의 게시글에 답변을 작성하는 메소드
	@Override
	public int insertQnaReply(int qnaNo, String qnamodalreply) {
		int result = 0;
		
		result = mapper.insertQnaReply(qnaNo, qnamodalreply);
		
		if(result> 0) {
			mapper.updateCheck(qnaNo);
		}
		
		
		return result;
	}
	
	// 문의 게시글 번호를 가지고 문의 답변을 찾는 메소드
	@Override
	public QnaReply findReplyByNo(int no) {
		
		
		
		return mapper.findReplyByNo(no);
	}
	
	// 마이페이지 개인정보 확인에서 입력한 id와 pwd를 가지고 해당 맴버를 가져오는 메소드
	  @Override
	  public Member checkMember(String id, String pwd) {
	    Member member = mapper.checkMember(id);
	    if (member != null && passwordEncoder.matches(pwd, member.getPassword())) {
	      return member;
	    } else {
	      return null;
	    }
	  }
	  
	 // 마이페이지에서 개인정보 수정을 하는 메소드
	@Override
	public int updateMember(String name, String id, String nickname, String phone, String address, int no) {
		
		return mapper.updateMember(name,id,nickname,phone,address,no);
	}
	
	// 비밀번호를 변경할때 비밀번호 확인에 입력한 비밀번호와 로그인한 유저의 비밀번호가 일치하는지 확인하는 메소드
	@Override
	public int updatePwd(String oldPwd, String newPwd, int no) {
//		String pwdCheck = passwordEncoder.encode(oldPwd);
		String pwd = passwordEncoder.encode(newPwd);
		
		Member member = mapper.checkMemberPwd(no);
		
		 if (member != null && passwordEncoder.matches(oldPwd, member.getPassword())) {
		      int result = mapper.updatePwd(pwd, no);
		      return result;
		    } else {
		      return 0;
		    }
		 
		 
		 
		  }

	
	// 게시글 no를 가지고 문의 게시판 작성자를 가져오는 메소드
	@Override
	public Member findMemberByNo(int no) {
		
		
		
		return mapper.findMemberByNo(no);
	}
	
	
	// qna 페이징바 구현을 위해 qna count를 가져오는 메소드
	@Override
	public int getQnaCount(int no) {
		
		
		return mapper.selectQnaCount(no);
	}
	
	
	// scheduler 페이징바 구현을 위해 scheduler count를 가져오는 메소드
	@Override
	public int getSchedulerCount(int no) {
		
		
		return mapper.getSchedulerCount(no);
	}
	
	// 로그인한 유저의 scheduler 리스트를 가져오는 메소드
	@Override
	public List<Scheduler> getSchedulerListByMemberNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		
		return mapper.selectSchedulerListByMemberNo(no, rowBounds);
	}
	
	// 숙박 결제 확인 페이징바를 구현하기 위해 숙박 count를 가져오는 메소드
	@Override
	public int getAccommodationCount(int no) {
		
		return mapper.selectAccommodationCount(no);
	}
	
	// 숙박 결제 확엔 페이지의 리스트를 가져오는 메소드
	@Override
	public List<Accommodation> getAccommodationListByMemberNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		return mapper.selectAccommodationListByMemberNo(no,rowBounds);
	}
	
	
	// 티켓 결제 확인 페이징 바를 구현하기위해 티켓 count를 가져오는 메소드
	@Override
	public int getTicketCount(int no) {
		
		return mapper.selectTicketCount(no);
	}
	
	
	// 로그인한 멤버의 no를 가지고 티켓 정보를 가져오는 메소드
	@Override
	public List<TrainTicket> getTicketListByMemberNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		return mapper.selectTicketListByMemberNo(no,rowBounds);
	}
	
	
	// 로그인한 멤버의 no를 가지고 회원 탈퇴를 하는 메소드
	@Override
	public int deleteMember(int no) {
		
		
		return mapper.deleteMember(no);
	}
	
	// 로그인한 멤버의 no를 가지고 회원 탈퇴를 하는 메소드 (sns)
	@Override
	public int deleteSnsMember(int no) {
		int result = mapper.deleteMember(no);
		
		if(result > 0) {
			result = mapper.deleteSns(no);
		}
		
		
		return result;
	}
	
	// 개인정보 페이지에 들어갈때마다 member 테이블의 amount(총결제금액)컬럼을 확인하고 membership 업데이트하기
	@Override
	public int updateMemberShip(int no) {
		int result = 0;
		Member member = mapper.selectMemberAmount(no);
		
		if(member.getAmount()>500000) {
			// 누적금액이 10만원이 넘어갈시 멤버십 등급 실버로 올리기
			result = mapper.updateMembershipM2(no);
		} else if (member.getAmount()>1000000) {
			result = mapper.updateMembershipM3(no);
		} else if (member.getAmount()>1500000) {
			result = mapper.updateMembershipM4(no);
		}
		
		
		
		return result;
	}
	
//	// 결제완료 예약 확인 no 를 가지고 문의 게시판 상세보기를 가져오는 메소드
//	@Override
//	public ReservationCheck findReservationCheckByNo(int no) {
//
//
//		
//		return mapper.findReservationCheckByNo(no);
//	}
	
	// 결제완료 예약 확인 no 를 가지고 숙소의 정보를 가져오는 메소드
	@Override
	public Accommodation findAccommodationByNo(int no) {
		
		return mapper.findAccommodationByNo(no);
	}

	// 숙소 번호 및 유저 번호를 가지고 예약 정보를 가져오는 메소드
	@Override
	public ReservationCheck findReservationByNo(int no, int memberNo) {
		
		return mapper.findReservationByNo(no,memberNo);
	}
	
	
	// 쿠폰 개수를 가져오기 ( listCount )
	@Override
	public int selectCountMyCoupon(int no) {
		
		
		return mapper.selectCountMyCoupon(no);
	}
	
	// 내 쿠폰 상세 정보 가져오는 메소드
	@Override
	public List<MyPageCoupon> findCouponByNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		return mapper.findCouponByNo(no,rowBounds);
	}


}
