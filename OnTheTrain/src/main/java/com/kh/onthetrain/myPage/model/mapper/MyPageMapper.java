package com.kh.onthetrain.myPage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;

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

	int selectQnaCount(@Param("no")int no);


	

	
	
}
