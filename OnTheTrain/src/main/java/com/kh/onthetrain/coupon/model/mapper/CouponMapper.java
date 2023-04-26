package com.kh.onthetrain.coupon.model.mapper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.onthetrain.coupon.model.vo.Coupon;
import com.kh.onthetrain.coupon.model.vo.MyCoupon;

@Mapper
public interface CouponMapper {
	
	List<MyCoupon> selectMyCouponListByMemberNo(@Param("memberNo") int memberNo);
	
	int updateUsedCoupon(@Param("memberNo") int memberNo, @Param("couponNo") int couponNo);
	
	void updateExpiredCoupon(@Param("now") java.sql.Timestamp now);
	
	int insertCouponByAdmin(Coupon coupon);
}
