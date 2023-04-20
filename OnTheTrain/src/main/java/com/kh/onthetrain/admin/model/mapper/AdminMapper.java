package com.kh.onthetrain.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.onthetrain.member.model.vo.Member;

@Mapper
public interface AdminMapper {

	int countMember();
	
	List<Member> getMemberList(@Param("rowBounds") RowBounds bounds);
}
