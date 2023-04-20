package com.kh.onthetrain.myPage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;

@Mapper
public interface MyPageMapper {
   
	
	// 유저가 작성한 문의글들을 게시판 가져오는 메소드
	List<Qna> selectQnaListByMemberNo(@Param("no") int no);
	
	// 문의글을 작성하는 메소드
	int insertQna(Qna qna);
	
	// 문의글 상세보기 정보를 가져오는 메소드
	Qna findQnaByNo(@Param("no") int no);
	
	// 문의 게시글 상세보기를 불러올때 해당하는 문의 게시글의 답변을 가져오는 메소드
	QnaReply findReplyByNo(int no);
	
	// 관리자가 문의 답변을 작성하는 메소드
	int insertQnaReply(@Param("qnaNo") int qnaNo, @Param("qnamodalreply") String qnamodalreply);

	int updateCheck(int qnaNo);

	
	
}
