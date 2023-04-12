package com.kh.onthetrain.coupon.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.coupon.model.vo.Coupon;

@Mapper
public interface CouponMapper {
	
	Coupon selectCouponByMemberId(@Param("m_no") int m_no);
	
	Coupon updateExpiredOrUsedCoupon(@Param("m_no") int m_no, @Param("c_no") int c_no);
}
