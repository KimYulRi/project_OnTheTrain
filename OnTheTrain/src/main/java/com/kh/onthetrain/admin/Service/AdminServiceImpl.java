package com.kh.onthetrain.admin.Service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.admin.model.mapper.AdminMapper;
import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int getCountMember() {
		
		return mapper.countMember();
	}
	
	@Override
	public List<Member> getMemberList(PageInfo pageInfo){
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1 ) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Member> list = mapper.getMemberList(rowBounds);
		
				
				
				
		return list;
	}
	
}
