package com.kh.onthetrain.payment.service;

import java.util.List;

import com.kh.onthetrain.payment.model.vo.Payment;
import com.kh.onthetrain.payment.model.vo.PaymentWaiting;

public interface PaymentService {
	
	// 결제 대기 상품 리스트 
	List<PaymentWaiting> selectPaymentWaitingList();

	// 환불된 상품 리스트
	List<PaymentWaiting> selectPaymentWaitingRefundedList();

	// 결제 완료 리스트 
	List<Payment> selectPaymentList();

}
