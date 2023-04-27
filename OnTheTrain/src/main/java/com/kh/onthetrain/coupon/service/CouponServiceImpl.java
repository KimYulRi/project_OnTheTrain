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
	
	// 내 쿠폰 리스트 가져오기
	@Override
	public List<MyCoupon> selectMyCouponList(int memberNo) {
		return couponMapper.selectMyCouponListByMemberNo(memberNo);
	}
	
	// 쿠폰 리스트 가져오기
	@Override
	public List<Coupon> selectCouponList() {
		return couponMapper.selectCouponListByAdmin();
	}
	
	// 쿠폰 사용
	@Override
	public int updateUsedCoupon(int memberNo, int couponNo) {
		return couponMapper.updateUsedCoupon(memberNo, couponNo);
	}
	
	// 관리자 쿠폰 생성
	@Override
	public int insertCouponByAdmin(Coupon coupon) {		 
		return couponMapper.insertCouponByAdmin(coupon);
	}
	
	// 자동 쿠폰 만료
	@Override
	@Scheduled(cron = "0 */10 * * * *")
	public void updateExpiredCouponTest() {
		java.sql.Timestamp now = java.sql.Timestamp.valueOf(LocalDateTime.now());
		couponMapper.updateExpiredCoupon(now);
		System.out.println("쿠폰만료 테스트");
	}
	
	// 회원 쿠폰 조회
	@Override
	public int selectCountMyCoupon() {
		return couponMapper.selectCountMyCoupon();
	}
	
	// 쿠폰 조회 (관리자)
	@Override
	public int selectCountCoupon() {
		return couponMapper.selectCountCoupon();
	}
	
	
	
	
	
}

