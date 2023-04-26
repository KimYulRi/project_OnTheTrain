package com.kh.onthetrain.payment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentWaiting {
	private int paymentWaitingNo;
	
	private int paymentNo;
	
	private int ticketNo;
	
	private int reservationNo;
	
	private String paymentStatus;
	
	private String refundStatus;
	
	private Date refundDate;
		
}
