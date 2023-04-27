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
		
		return "payment/payment";
	};
	
	// 결제 성공 페이지 
	@RequestMapping("payment/paymentSuccess")
	public String success() {
		
		
		return "payment/paymentSuccess";
	};
	
	// 결제 대기 페이지 
	@RequestMapping("/myPage/paymentWaiting")
	public ModelAndView selectPaymentWaitingList(ModelAndView modelAndView,
												 HttpSession session) {
		
		int totalPaymentWaiting = 0;
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(1, 5, totalPaymentWaiting, 10);
		return null;
	}
	
	// 결제 완료 페이지
	@RequestMapping("/myPageAccommodation")
	public ModelAndView selectCompletedPaymentAccommodation(ModelAndView modelAndView,
															HttpSession httpSession) {
		
		int total = 123;
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(1, 5, total, 10);
		return modelAndView;
	}
	
	
	

}
