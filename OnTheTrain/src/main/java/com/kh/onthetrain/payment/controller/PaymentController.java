package com.kh.onthetrain.payment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onthetrain.common.util.PageInfo;

@Controller
public class PaymentController {
	
	// 결제 페이지
	@RequestMapping("/payment")
	public String payment() {
		
		String asdf = "payment/payment";
		
		return asdf;
	};
	
	// 결제 성공 페이지 
	@RequestMapping("/success")
	public String success() {
		
		
		return null;
	};
	
	// 결제 대기 페이지 
	@RequestMapping("/myPage/paymentWaiting")
	public ModelAndView selectPaymentWaitingList(HttpSession session) {
		
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, 5, totalMyCoupon, 10);
		return null;
	}
	
	// 결제 완료 페이지
	@RequestMapping("/")
	public ModelAndView () {
		// 페이징 처리
				PageInfo pageInfo = new PageInfo(page, 5, totalMyCoupon, 10);
	}
	
	
	

}
