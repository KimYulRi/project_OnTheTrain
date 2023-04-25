package com.kh.onthetrain.myPage.model.entity;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class QnaReply {
	
	// 문의 게시글 답변 번호
	public int qnaReplyNo;
	
	// 문의 게시글 번호
	public int qnaNo;
	
	// 문의 게시글 답변 내용
	public String qnaReplyContent;
	
	// 문의 답변 시간
	public Date qnaReplyDate;
	
	// 문의 답변 삭제 여부
	public String visable;
	
	
	
}
