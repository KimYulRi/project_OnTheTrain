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
public class Qna {
	
	// 문의 게시글 번호
	public int qnaNo;
	
	// 문의 게시글 작성자 번호
	public int writerNo;
	
	// 문의 구분
	public String type;
	
	// 문의 제목
	public String title;
	
	// 문의 내용
	public String qnaContent;
	
	// 문의 답변 상태
	public String qnaCheck;
	
	public Date createDate;
	
	// 문의 삭제 여부
	public String visable;
	
	// 첨부 파일 원본 이름
	public String qnaOriginalFileName;
	
	// 첨부파일 바뀐이름 
	public String qnaRenamedFileName;
 	
	
}
