package com.kh.onthetrain.coupon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onthetrain.coupon.model.vo.Coupon;
import com.kh.onthetrain.coupon.service.CouponService;

@Controller
public class CouponController {
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/coupon")
	public String coupon(){
		
		
		return "coupon/coupon";
	}
	
//	public List<Coupon> getCoupons(){
//		
//		
//		return null;
//	}
	
}
