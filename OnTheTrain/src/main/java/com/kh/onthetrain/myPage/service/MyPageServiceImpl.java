package com.kh.onthetrain.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.model.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mapper;
	
	
	// 사용자의 no를 가지고 작성한 문의글을 가져오는 메소드
	@Override
	public List<Qna> getQnaListByMemberNo(int no) {
		
		
		return mapper.selectQnaListByMemberNo(no);
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
}
