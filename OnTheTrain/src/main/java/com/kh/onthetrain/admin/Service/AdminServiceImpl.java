package com.kh.onthetrain.admin.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onthetrain.admin.model.mapper.AdminMapper;
import com.kh.onthetrain.admin.model.vo.Faq;
import com.kh.onthetrain.admin.model.vo.Notice;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
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
	
	
	
	// 총 승차권수
	@Override
	public int getCountTicket() {
		
		return mapper.countTicket();
	}
	
	/* 자주묻는 질문*/
	@Override
	public List<Faq> getFaqList(){
		
		List<Faq> list = mapper.findFaqList();
		
		
		
		return list;
	}
	

	// 공지사항 등록
	@Override
	@Transactional
	public int save(Notice notice){
		
		int result = 0;
		
		if(notice.getNo() > 0) {
		//update
			
		}else {
			/*
			 * result = mapper.saveNotice();
			 */
			
		}
		
		return result;
	}
}
