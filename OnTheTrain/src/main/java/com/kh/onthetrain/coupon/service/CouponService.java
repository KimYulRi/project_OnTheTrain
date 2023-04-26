package com.kh.onthetrain.coupon.service;

import java.util.List;

import com.kh.onthetrain.coupon.model.vo.Coupon;
import com.kh.onthetrain.coupon.model.vo.MyCoupon;

public interface CouponService {

	List<MyCoupon> selectMyCouponList(int memberNo);

	int updateUsedCoupon(int memberNo, int couponNo);

	void updateExpiredCouponTest();

	int insertCouponByAdmin(Coupon coupon);


}
