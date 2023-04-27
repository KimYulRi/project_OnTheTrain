package com.kh.onthetrain.coupon.service;

import java.util.List;

import com.kh.onthetrain.coupon.model.vo.Coupon;
import com.kh.onthetrain.coupon.model.vo.MyCoupon;

public interface CouponService {
	
	// 내 쿠폰 리스트 가져오기
	List<MyCoupon> selectMyCouponList(int memberNo);
	
	// 쿠폰 리스트 가져오기
	List<Coupon> selectCouponList();
	
	// 쿠폰 사용
	int updateUsedCoupon(int memberNo, int couponNo);

	// 관리자 쿠폰 생성
	int insertCouponByAdmin(Coupon coupon);
	
	// 자동 쿠폰 만료
	void updateExpiredCouponTest();

	// 전체 내 쿠폰 수 조회(회원)
	int selectCountMyCoupon();
	
	// 전체 쿠폰 수 조회(관리자)
	int selectCountCoupon();
	
}
