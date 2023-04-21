package com.kh.onthetrain.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.member.model.vo.Member;
import com.kh.onthetrain.myPage.model.entity.Qna;
import com.kh.onthetrain.myPage.model.entity.QnaReply;
import com.kh.onthetrain.myPage.model.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
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


}
