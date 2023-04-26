package com.kh.onthetrain.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	
	@RequestMapping("/apitest")
	public String apitest() {
		
		
		return "payment/apitest";
	};
	
	@RequestMapping("/payment")
	public String payment() {
		
		String asdf = "payment/payment";
		
		return asdf;
	};
	
	
	@RequestMapping("/success")
	public String success() {
		
		
		return null;
	};
	
	
	
	
	

}
