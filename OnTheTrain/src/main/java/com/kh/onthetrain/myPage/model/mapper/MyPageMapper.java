package com.kh.onthetrain.myPage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.model.entity.ReservationCheck;
import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.trainTable.model.vo.TrainTicket;

@Mapper
public interface MyPageMapper {
   
	
	// 유저가 작성한 문의글들을 게시판 가져오는 메소드
	List<Qna> selectQnaListByMemberNo(@Param("no") int no,RowBounds rowBounds);
	
	// 문의글을 작성하는 메소드
	int insertQna(Qna qna);
	
	// 문의글 상세보기 정보를 가져오는 메소드
	Qna findQnaByNo(@Param("no") int no);
	
	// 문의 게시글 상세보기를 불러올때 해당하는 문의 게시글의 답변을 가져오는 메소드
	QnaReply findReplyByNo(int no);
	
	// 관리자가 문의 답변을 작성하는 메소드
	int insertQnaReply(@Param("qnaNo") int qnaNo, @Param("qnamodalreply") String qnamodalreply);
	
	// 관리자가 문의 답변을 작성하면 qna 의 check 값을 바꿔주는 메소드
	int updateCheck(int qnaNo);
	
	// 마이페이지 개인정보 확인에서 입력한 id와 pwd를 가지고 해당 맴버를 가져오는 메소드
	Member checkMember(@Param("id")String id);
	
	
	// 마이페이지 개인정보 수정하는 메소드
	int updateMember(@Param("name")String name, @Param("id")String id, @Param("nickname")String nickname, @Param("phone")String phone, @Param("address")String address,@Param("no") int no);
	
	// 비밀번호를 변경하기전 입력한 비밀번호와 유저의 비밀번호가 맞는지 확인하는 메소드
	Member checkMemberPwd(@Param("no") int no);
	
	// 비밀번호를 변경하는 메소드
	int updatePwd(@Param("pwd")String pwd,@Param("no") int no);
	
	// 게시글 no를 가지고 문의 게시판 작성자를 가져오는 메소드
	Member findMemberByNo(int no);

	// qna 페이징바 구현을 위해 qna count를 가져오는 메소드
	int selectQnaCount(@Param("no")int no);
	
	// scheduler 페이징바 구현을 위해 scheduler count를 가져오는 메소드
	int getSchedulerCount(@Param("no")int no);

	// 로그인한 유저의 scheduler 리스트를 가져오는 메소드
	List<Scheduler> selectSchedulerListByMemberNo(@Param("no")int no, RowBounds rowBounds);

	// 숙박 결제 확인 페이징바를 구현하기 위해 숙박 count를 가져오는 메소드
	int selectAccommodationCount(@Param("no") int no);

	// 숙박 결제 확엔 페이지의 리스트를 가져오는 메소드
	List<Accommodation> selectAccommodationListByMemberNo(@Param("no")int no, RowBounds rowBounds);
	
//	// 티켓 결제 확인 페이징 바를 구현하기위해 티켓 count를 가져오는 메소드
	int selectTicketCount(@Param("no")int no);

	// 로그인한 멤버의 no를 가지고 티켓 정보를 가져오는 메소드
	List<TrainTicket> selectTicketListByMemberNo(@Param("no")int no, RowBounds rowBounds);

	// 로그인한 멤버의 no를 가지고 회원 탈퇴를 하는 메소드
	int deleteMember(@Param("no")int no);

	
	// sns 회원 status를 성공적으로 x로 업데이트시 sns_member 테이블에서 해당 유저 drop 하는 메소드
	int deleteSns(@Param("no")int no);

	// 개인정보 페이지에 들어갈때마다 member 테이블의 amount(총결제금액)컬럼을 확인하고 membership 업데이트하기
	Member selectMemberAmount(@Param("no") int no);
	
	// 누적금액이 10만원이 넘어갈시 멤버십 등급 실버로 올리기
	int updateMembershipM2(@Param("no")int no);
	
	// 누적금액이 30만원이 넘어갈시 멤버십 등급 실버로 올리기
	int updateMembershipM3(@Param("no")int no);
	
	// 누적금액이 50만원이 넘어갈시 멤버십 등급 실버로 올리기
	int updateMembershipM4(@Param("no")int no);

//	// 결제완료 예약 확인 no 를 가지고 문의 게시판 상세보기를 가져오는 메소드
//	ReservationCheck findReservationCheckByNo int no);

	
	// 결제완료 예약 확인 no 를 가지고 숙소의 정보를 가져오는 메소드
	Accommodation findAccommodationByNo(@Param("no")int no);

	
	// 숙소 번호 및 유저 번호를 가지고 예약 정보를 가져오는 메소드
	ReservationCheck findReservationByNo(@Param("no")int no, @Param("memberNo")int memberNo);


	

	
	
}
