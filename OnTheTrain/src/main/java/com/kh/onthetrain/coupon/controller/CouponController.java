package com.kh.onthetrain.coupon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.common.util.PageInfo;
import com.kh.onthetrain.coupon.model.vo.Coupon;
import com.kh.onthetrain.coupon.model.vo.MyCoupon;
import com.kh.onthetrain.coupon.service.CouponService;
import com.kh.onthetrain.member.model.vo.Member;

@Controller
public class CouponController {
	@Autowired
	private CouponService couponService;
	
	// 쿠폰 다운로드 페이지
	@RequestMapping("/coupon")
	public String coupon(){
		
		
		return "coupon/coupon";
	}
	
	//  관리자 쿠폰 페이지
		@GetMapping("/admin/adminCuponList")
		public ModelAndView getCouponListByAdmin(ModelAndView modelAndView,
												 @RequestParam(defaultValue = "1") int page,
												 HttpSession session) {
			// 총 내 쿠폰 수 
			int totalCoupon = couponService.selectCountCoupon();
			
			// 페이징 처리
			PageInfo pageInfo = new PageInfo(page, 10, totalCoupon, 10);
			
			// 내 쿠폰 리스트 
			List<Coupon> CouponList = couponService.selectCouponList();
			
			modelAndView.addObject("pageInfo",pageInfo);
			modelAndView.addObject("CouponList", CouponList);
			modelAndView.setViewName("/admin/adminCuponList");
			
			return modelAndView;
		}
	
	// 결제 페이지 쿠폰함 모달 
	@GetMapping("/payment/myCoupon")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getMyCouponList(@RequestParam(defaultValue = "1") int page,
															   @RequestParam(defaultValue = "10") int size,
															   HttpSession session) {
		// 회원번호 
		int memberNo = ((Member) session.getAttribute("loginMember")).getNo();
		System.out.println(memberNo);
		
		// 총 내 쿠폰 수 
		int totalMyCoupon = couponService.selectCountMyCoupon();
		
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, size, totalMyCoupon, 5);
		
		// 내 쿠폰 리스트 
		List<MyCoupon> myCouponList = couponService.selectMyCouponList(memberNo);
		
		Map<String, Object> data = new HashMap<>();
		data.put("pageInfo", pageInfo);
		data.put("myCouponList", myCouponList);
		
		return ResponseEntity.ok(data);
	}
	
//	// 마이 페이지 내 쿠폰함 
//	@GetMapping("/myPage/myPageCoupon")
//	public ModelAndView getMyCouponListMyPage(ModelAndView modelAndView,
//											  @RequestParam(defaultValue = "1") int page,
//											  HttpSession session) {
//		// 회원번호 
//		int memberNo = ((Member) session.getAttribute("loginMember")).getNo();
//		
//		// 총 내 쿠폰 수 
//		int totalMyCoupon = couponService.selectCountMyCoupon();
//		
//		// 페이징 처리
//		PageInfo pageInfo = new PageInfo(page, 5, totalMyCoupon, 10);
//		
//		// 내 쿠폰 리스트 
//		List<MyCoupon> myCouponList = couponService.selectMyCouponList(memberNo);
//		
//		modelAndView.addObject("pageInfo",pageInfo);
//		modelAndView.addObject("myCouponList", myCouponList);
//		modelAndView.setViewName("/myPage/myPageCoupon");
//		
//		return modelAndView;
//	}
	
}
