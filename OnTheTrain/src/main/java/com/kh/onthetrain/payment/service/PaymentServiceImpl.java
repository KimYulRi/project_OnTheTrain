package com.kh.onthetrain.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onthetrain.payment.model.mapper.PaymentMapper;
import com.kh.onthetrain.payment.model.vo.Payment;
import com.kh.onthetrain.payment.model.vo.PaymentWaiting;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentMapper paymentMapper;
	
	@Override
	public List<PaymentWaiting> selectPaymentWaitingList() {
		
		return null;
	}

	@Override
	public List<PaymentWaiting> selectPaymentWaitingRefundedList() {
		
		return null;
	}
	
//	@Override
//	public List<PaymentWaiting> selectPaymentWaitingRefundedList() {
//		
//		return null;
//	}
	
	@Override
	public List<Payment> selectPaymentList() {
		
		return null;
	}
	
	
	
	
}
