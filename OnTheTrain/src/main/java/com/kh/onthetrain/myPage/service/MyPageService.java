package com.kh.onthetrain.myPage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.onthetrain.accommodation.model.vo.Accommodation;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.scheduler.model.entity.Scheduler;
import com.kh.onthetrain.trainTable.model.vo.TrainTicket;

@Service
public interface MyPageService {
	
	// 사용자의 no를 가지고 작성한 문의 게시글을 가져오는 메소드
	// QNA 게시글 페이징바 만드는 메소드
	int getQnaCount(int no);
	
	
	List<Qna> getQnaListByMemberNo(int no, PageInfo pageInfo);
	
	
	// qna를 작성하는 메소드
	int save(Qna qna);

	// 문의 게시글 번호를 가지고 문의 게시글을 찾는 메소드
	Qna findQnaByNo(int no);

	
	// 관리자가 문의 게시글에 답변을 작성하는 메소드
	int insertQnaReply(int qnaNo, String qnamodalreply);

	
	// 문의 게시글 번호를 가지고 문의 답변을 찾는 메소드
	QnaReply findReplyByNo(int no);

	// 마이페이지 개인정보 확인에서 입력한 id와 pwd를 가지고 해당 맴버를 가져오는 메소드
	Member checkMember(String id, String pwd);

	// 마이페이지에서 개인정보 수정을 하는 메소드
	int updateMember(String name, String id, String nickname, String phone, String address, int no);


	
	// 비밀번호를 변경하는 메소드
	int updatePwd(String oldPwd, String newPwd, int no);

	// 게시글 no를 가지고 문의 게시판 작성자를 가져오는 메소드
	Member findMemberByNo(int no);

	// scheduler 페이징바 구현을 위해 scheduler count를 가져오는 메소드
	int getSchedulerCount(int no);

	
	// 로그인한 유저의 scheduler 리스트를 가져오는 메소드
	List<Scheduler> getSchedulerListByMemberNo(int no, PageInfo pageInfo);

	// 숙박 결제 확인 페이징바를 구현하기 위해 숙박 count를 가져오는 메소드
	int getAccommodationCount(int no);

	// 숙박 결제 확엔 페이지의 리스트를 가져오는 메소드
	List<Accommodation> getAccommodationListByMemberNo(int no, PageInfo pageInfo);

	// 티켓 결제 확인 페이징 바를 구현하기위해 티켓 count를 가져오는 메소드
	int getTicketCount(int no);

	// 로그인한 멤버의 no를 가지고 티켓 정보를 가져오는 메소드
	List<TrainTicket> getTicketListByMemberNo(int no, PageInfo pageInfo);

	
	// 로그인한 멤버의 no를 가지고 회원 탈퇴를 하는 메소드
	int deleteMember(int no);

	// 로그인한 멤버의 no를 가지고 회원 탈퇴를 하는 메소드 (sns)
	int deleteSnsMember(int no);

	// 개인정보 페이지에 들어갈때마다 member 테이블의 amount(총결제금액)컬럼을 확인하고 membership 업데이트하기
	int updateMemberShip(int no);
	


		
	}


