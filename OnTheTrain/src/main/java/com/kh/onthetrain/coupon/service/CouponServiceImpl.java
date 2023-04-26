package com.kh.onthetrain.coupon.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.coupon.model.mapper.CouponMapper;
import com.kh.onthetrain.coupon.model.vo.Coupon;
import com.kh.onthetrain.coupon.model.vo.MyCoupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponMapper couponMapper;
	
	@Override
	public List<MyCoupon> selectMyCouponList(int memberNo) {
		return couponMapper.selectMyCouponListByMemberNo(memberNo);
	}
	
	@Override
	public int updateUsedCoupon(int memberNo, int couponNo) {
		return couponMapper.updateUsedCoupon(memberNo, couponNo);
	}
	
	@Override
	public int insertCouponByAdmin(Coupon coupon) {		 
		return couponMapper.insertCouponByAdmin(coupon);
	}
	
	@Override
	@Scheduled(cron = "0 0 */1 * * *")
	public void updateExpiredCouponTest() {
		java.sql.Timestamp now = java.sql.Timestamp.valueOf(LocalDateTime.now());
		couponMapper.updateExpiredCoupon(now);
		System.out.println("쿠폰만료 테스트");
	}

}

