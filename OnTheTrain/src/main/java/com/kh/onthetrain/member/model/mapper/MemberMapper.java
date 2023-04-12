package com.kh.onthetrain.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMemberById(@Param("id") String id);
}
